<?php

namespace App\CentralLogics;

use App\Models\Admin;
use App\Models\Order;
use App\Models\OrderTransaction;
use App\Models\AdminWallet;
use App\Models\BusinessSetting;
use App\Models\StoreWallet;
use App\Models\DeliveryManWallet;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class OrderLogic
{
    public static function gen_unique_id()
    {
        return rand(1000, 9999) . '-' . Str::random(5) . '-' . time();
    }

    public static function track_order($order_id)
    {
        return Helpers::order_data_formatting(Order::with(['details', 'delivery_man.rating'])->where(['id' => $order_id])->first(), false);
    }

    public static function updated_order_calculation($order)
    {
        return true;
    }
    public static function create_transaction($order, $received_by=false, $status = null)
    {
        $type = $order->order_type;
        $dm_tips_manage_status = BusinessSetting::where('key', 'dm_tips_status')->first()->value;
        $admin_subsidy = 0;
        $cashback = '';
        $cashback_generated = '';
        if($type=='parcel')
        {
            $comission = \App\Models\BusinessSetting::where('key','parcel_commission_dm')->first();
            $dm_tips = $dm_tips_manage_status ? $order->dm_tips : 0;
            $comission = isset($comission) ? $comission->value : 0;
            $order_amount = $order->order_amount - $dm_tips;
            $dm_commission = $comission?($order_amount/ 100) * $comission:0;
            $comission_amount = $order_amount - $dm_commission;
        }
        else
        {
            $dm_tips = $dm_tips_manage_status ? $order->dm_tips : 0;
            $order_amount = $order->order_amount - $order->delivery_charge - $order->total_tax_amount - $dm_tips;
            $comission = $order->store->no_commission_default ? $order->store->comission : \App\Models\BusinessSetting::where('key','admin_commission')->first()->value;
            $cashback = $order->store->no_cashback_default ? $order->store->cashback_store : \App\Models\BusinessSetting::where('key','cashback_default')->first()->value;
            $cashback_generated = $order_amount * ($cashback/100);


            $comission_on_delivery = 0;
            if($type != 'take_away'){
                // comission in delivery charge
                $delivery_charge_comission = BusinessSetting::where('key', 'delivery_charge_comission')->first();
                $delivery_charge_comission_percentage = $delivery_charge_comission ? $delivery_charge_comission->value : 0;
                $comission_on_delivery = $delivery_charge_comission_percentage * ( $order->original_delivery_charge / 100 );
            }


            if($order->store->self_delivery_system)
            {
                $comission_on_actual_delivery_fee = 0;
            }else{

                $comission_on_actual_delivery_fee = ($order->delivery_charge > 0) ? $comission_on_delivery : 0;
            }
            $comission_amount = ($comission?($order_amount/ 100) * $comission:0)+$comission_on_actual_delivery_fee;
            $dm_commission = 0;
            if($type != 'take_away'){
                $dm_commission = $order->original_delivery_charge - $comission_on_actual_delivery_fee;
            }
            //final comission

            if($order->free_delivery_by == 'admin')
            {
                $admin_subsidy = $order->original_delivery_charge;
                Helpers::expenseCreate($order->original_delivery_charge,'free_delivery',now(),$order->id);
            }

        }
        try{
            $store_value = $order_amount - $order_amount * $comission/100;

            OrderTransaction::insert([
                'vendor_id' =>$type=='parcel'?null:$order->store->vendor->id,
                'delivery_man_id'=>$order->delivery_man_id,
                'order_id' =>$order->id,
                'order_amount'=>$order->order_amount,
                'store_amount'=>$store_value + $order->total_tax_amount,
                'admin_commission'=>$comission_amount - $admin_subsidy,
                'cashback_generated'=>$cashback_generated,
                'cashback'=>$cashback,
                'delivery_charge'=>$order->delivery_charge,
                'original_delivery_charge'=>$dm_commission,
                'tax'=>$order->total_tax_amount,
                'received_by'=> $received_by??'admin',
                'zone_id'=>$order->zone_id,
                'module_id'=>$order->module_id,
                'admin_expense'=>$admin_subsidy,
                'status'=> $status,
                'dm_tips'=> $dm_tips,
                'created_at' => now(),
                'updated_at' => now(),
                'delivery_fee_comission'=> $comission_on_actual_delivery_fee ?? 0
            ]);
            $adminWallet = AdminWallet::firstOrNew(
                ['admin_id' => Admin::where('role_id', 1)->first()->id]
            );

            $adminWallet->total_commission_earning = $adminWallet->total_commission_earning + $comission_amount - $admin_subsidy;


            if($type != 'parcel')
            {
                $vendorWallet = StoreWallet::query()->where('vendor_id', $order->store->vendor->id)->first();
                if(!isset($vendorWallet)){
                    $vendorWallet= new StoreWallet();
                    $vendorWallet->vendor_id = $order->store->vendor->id;
                    $vendorWallet->total_earning= 0.0;
                    $vendorWallet->money_in_hands=0.0;
                    $vendorWallet->current_cycle=now();
                    $vendorWallet->created_at=now();
                    $vendorWallet->updated_at=now();
                    $vendorWallet->save();
                }
                if($order->store->self_delivery_system)
                {
                    $total = $vendorWallet->total_earning + $order->delivery_charge + $dm_tips;
                    $vendorWallet->total_earning = $total;
                    if(has_payment_offline($order->payment_method) && $received_by!='store'){
                        $store_value = $order_amount - ($order_amount) * $comission/100;
                        $store_value += $order->total_tax_amount;
                        $vendorWallet->money_in_hands = $vendorWallet->money_in_hands + $store_value + $total;
                    }
                }
                else{
                    $total = $adminWallet->delivery_charge+$order->delivery_charge;
                    $adminWallet->delivery_charge = $total;
                }
                $store_value = $order_amount - ($order_amount) * $comission/100;
                $store_value += $order->total_tax_amount;
                $vendorWallet->total_earning = $vendorWallet->total_earning+$store_value;
            }

            if($order->delivery_man && !$order->store->self_delivery_system){
                $dmWallet = DeliveryManWallet::firstOrNew(
                    ['delivery_man_id' => $order->delivery_man_id]
                );
                if($order->delivery_man->earning == 1){
                    $dmWallet->total_earning = $dmWallet->total_earning + $dm_commission+ $dm_tips;
                }else {
                    $adminWallet->total_commission_earning = $adminWallet->total_commission_earning + $dm_commission + $dm_tips;
                }
            } else {
                $adminWallet->total_commission_earning = $adminWallet->total_commission_earning + $dm_commission + $dm_tips;
            }

            try
            {
                DB::beginTransaction();
                if($received_by=='admin')
                {
                    $adminWallet->digital_received = $adminWallet->digital_received+$order->order_amount;
                }
                else if($received_by=='store' && $type != 'parcel' && has_payment_offline($order->payment_method))
                {
                    $vendorWallet->money_in_hands = $vendorWallet->money_in_hands+$order->order_amount;
                }
                else if(!$received_by)
                {
                    $adminWallet->manual_received = $adminWallet->manual_received+$order->order_amount;
                }
                else if($received_by=='deliveryman' && $order->delivery_man->type == 'zone_wise')
                {
                    $dmWallet->collected_cash = $dmWallet->collected_cash+$order->order_amount;
                }

                $adminWallet->save();
                if($type != 'parcel')
                {
                    $vendorWallet->save();
                }
                if(isset($dmWallet)){
                    $dmWallet->save();
                }

                DB::commit();
                if($order->user_id) {
                    CustomerLogic::create_loyalty_point_transaction($order->user_id, $order->id, $order->order_amount, 'order_place');
                    CustomerLogic::create_cashback_transaction($order->user_id, $order->id, $order_amount, $cashback, $cashback_generated, $order->store->name);
                    CustomerLogic::set_cashback_historical($order->user_id, $order->store->id, $order->id, $order_amount, $cashback, $cashback_generated, $order->delivery_charge);
                    CustomerLogic::set_money_affiliate($order->user_id, $order->store->id, $order->id, $order_amount, $order->store->name, $order->delivery_charge);
                }

            }
            catch(\Exception $e)
            {
                DB::rollBack();
                info($e);
                dd($e->getMessage(), '2');
                return false;
            }
        }
        catch(\Exception $e){
            info($e);
            dd($e->getMessage(),'3');
            return false;
        }

        return true;
    }

    public static function refund_order($order)
    {
        $order_transaction = $order->transaction;
        if($order_transaction == null || $order->store == null)
        {
            return false;
        }
        $received_by = $order_transaction->received_by;

        $adminWallet = AdminWallet::firstOrNew(
            ['admin_id' => Admin::where('role_id', 1)->first()->id]
        );

        $vendorWallet = StoreWallet::query()->where('vendor_id', $order->store->vendor->id)->first();
        if(!isset($vendorWallet)){
            $vendorWallet= new StoreWallet();
            $vendorWallet->vendor_id = $order->store->vendor->id;
            $vendorWallet->total_earning= 0.0;
            $vendorWallet->money_in_hands=0.0;
            $vendorWallet->current_cycle=now();
            $vendorWallet->created_at=now();
            $vendorWallet->updated_at=now();
            $vendorWallet->save();
        }
        $adminWallet->total_commission_earning = $adminWallet->total_commission_earning - $order_transaction->admin_commission + $order_transaction->delivery_fee_comission;

        $vendorWallet->total_earning = $vendorWallet->total_earning - $order_transaction->store_amount;

        $refund_amount = $order->order_amount;

        $status = 'refunded_with_delivery_charge';
        if($order->order_status == 'delivered' || $order->order_status == 'refund_requested')
        {
            $refund_amount = $order->order_amount - $order->delivery_charge -$order->dm_tips;
            $status = 'refunded_without_delivery_charge';
        }
        else
        {
            $adminWallet->delivery_charge = $adminWallet->delivery_charge - $order_transaction->delivery_charge;
        }
        try
        {
            DB::beginTransaction();
            if($received_by=='admin')
            {
                if($order->delivery_man_id && has_payment_offline($order->payment_method))
                {
                    $adminWallet->digital_received = $adminWallet->digital_received - $refund_amount;
                }
                else
                {
                    $adminWallet->manual_received = $adminWallet->manual_received - $refund_amount;
                }

            }
            else if($received_by=='store')
            {
                $vendorWallet->money_in_hands = $vendorWallet->money_in_hands - $refund_amount;
            }

            // else if($received_by=='deliveryman')
            // {
            //     $dmWallet = DeliveryManWallet::firstOrNew(
            //         ['delivery_man_id' => $order->delivery_man_id]
            //     );
            //     $dmWallet->collected_cash=$dmWallet->collected_cash - $refund_amount;
            //     $dmWallet->save();
            // }
            $order_transaction->status = $status;
            $order_transaction->save();
            $adminWallet->save();
            $vendorWallet->save();
            DB::commit();
        }
        catch(\Exception $e)
        {
            DB::rollBack();
            info($e);
            dd($e->getMessage(), '1');
            return false;
        }
        return true;

    }

    public static function format_export_data($orders, $type='order')
    {
        $data = [];
        foreach($orders as $key=>$order)
        {

            $data[]=[
                '#'=>$key+1,
                translate('messages.order')=>$order['id'],
                translate('messages.date')=>date('d M Y',strtotime($order['created_at'])),
                translate('messages.customer')=>$order->customer?$order->customer['f_name'].' '.$order->customer['l_name']:translate('messages.invalid').' '.translate('messages.customer').' '.translate('messages.data'),
                translate($type=='order'?'messages.store':'messages.parcel_category')=>Str::limit($type=='order'?($order->store?$order->store->name:translate('messages.store deleted!')):($order->parcel_category?$order->parcel_category->name:translate('messages.not_found')),20,'...'),
                translate('messages.payment').' '.translate('messages.status')=>$order->payment_status=='paid'?translate('messages.paid'):translate('messages.unpaid'),
                translate('messages.total')=>\App\CentralLogics\Helpers::format_currency($order['order_amount']),
                translate('messages.order').' '.translate('messages.status')=>translate('messages.'. $order['order_status']),
                translate('messages.order').' '.translate('messages.type')=>translate('messages.'.$order['order_type'])
            ];
        }
        return $data;
    }
    public static function format_store_order_export_data($orders)
    {
        $data = [];
        foreach($orders as $key=>$order)
        {

            $data[]=[
                '#'=>$key+1,
                translate('messages.order')=>$order['id'],
                translate('messages.date')=>date('d M Y',strtotime($order['created_at'])),
                translate('messages.customer')=>$order->customer?$order->customer['f_name'].' '.$order->customer['l_name']:translate('messages.invalid').' '.translate('messages.customer').' '.translate('messages.data'),
                translate('messages.payment').' '.translate('messages.status')=>$order->payment_status=='paid'?translate('messages.paid'):translate('messages.unpaid'),
                translate('messages.total')=>\App\CentralLogics\Helpers::format_currency($order['order_amount']),
                translate('messages.order').' '.translate('messages.status')=>translate('messages.'. $order['order_status']),
                translate('messages.order').' '.translate('messages.type')=>translate('messages.'.$order['order_type']),
                translate('messages.coupon_discount_amount')=>$order['coupon_discount_amount']+$order['store_discount_amount'],
                translate('messages.total_tax_amount')=>$order['total_tax_amount'],
                translate('messages.delivery_charge')=>$order['original_delivery_charge']
            ];
        }
        return $data;
    }
}
