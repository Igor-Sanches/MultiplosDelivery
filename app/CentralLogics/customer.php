<?php

namespace App\CentralLogics;

use App\Models\AffiliateHistorical;
use App\Models\BusinessSetting;
use App\Models\CashbackHistorial;
use App\Models\LoyaltyPointTransaction;
use App\Models\User;
use App\Models\WalletTransaction;
use Illuminate\Support\Facades\DB;
use PHPUnit\Exception;

class CustomerLogic
{

    private static function put_money_affiliate($userAffiliate, $user, $value, $order_id, $store_name, $isMyGain){
        $current_balance = $userAffiliate->wallet_balance;
        $wallet_transaction = new WalletTransaction();
        $wallet_transaction->user_id = $userAffiliate->id;
        $wallet_transaction->transaction_id = \Str::uuid();
        $wallet_transaction->description = $isMyGain ? 'Crédito referente ao cadastro de '.go_name_client($user->f_name, $user->l_name).'. Continue compartilhando e ganhando!' : 'Crédito no pedido de '.go_name_client($user->f_name, $user->l_name).' em '.$store_name;
        $wallet_transaction->transaction_type = $isMyGain ? 'reference' : 'affiliate';
        $wallet_transaction->input = true;
        $wallet_transaction->reference = $order_id;
        $wallet_transaction->credit = $value;
        $wallet_transaction->debit = 0.00;
        $wallet_transaction->balance = $current_balance + $value;
        $wallet_transaction->created_at = now();
        $wallet_transaction->updated_at = now();
        $userAffiliate->wallet_balance += $value;
        $userAffiliate->wallet_balance_received += $value;
        try{
            $userAffiliate->save();
            $wallet_transaction->save();
            DB::beginTransaction();
            $userAffiliate->save();
            DB::commit();
        }catch (\Exception $ex){
            info($ex);
            echo $ex->getMessage();
            DB::rollback();
        }
    }

    public static function set_money_affiliate($user_id, $store_id, $order_id, $amount, $store_name, $delivery_charge): bool{
        if (BusinessSetting::query()->where('key', 'wallet_status')->first()->value != 1) return false;
        $user = User::query()->find($user_id);
        $codeAffiliate = $user->affiliate;
        $userAffiliate = null;
        if(isset($codeAffiliate)){
            $userAffiliate = User::query()->where('ref_code', $codeAffiliate)->first();
        }

        if(isset($userAffiliate)){
            $single_referral_bonus = BusinessSetting::query()->where('key', 'single_referral_bonus')->first()->value;
            $isMyGain = false;
            if($single_referral_bonus && $user->order_count == 0){// && $user->registered_with_the_code){
                $value = BusinessSetting::query()->where('key', 'money_referral_bonus')->first()->value;
                $isMyGain = true;
                try{
                    $fcm_token = $userAffiliate->cm_firebase_token;
                    $data = [
                        'title' =>'Você recebeu R$ '.number_format($value, 2).' na primeira compra de '.go_name_client($user->f_name, $user->l_name),
                        'description' => 'R$ '.number_format($value, 2).' disponível na sua carteira',
                        'order_id' => '',
                        'image' => '',
                        'message' => json_encode(''),
                        'type'=> 'reference',
                        'conversation_id'=> 0,
                        'sender_type'=> 'user'
                    ];
                    Helpers::send_push_notif_to_device($fcm_token, $data);
                }catch (Exception $exception){}
                self::put_money_affiliate($userAffiliate, $user, $value, $order_id, $store_name, true);
            }else{
                $percentage = BusinessSetting::query()->where('key', 'percentage_referral_bonus')->first()->value;
                $value = $amount * ($percentage/100);
                self::put_money_affiliate($userAffiliate, $user, $value, $order_id, $store_name, false);
            }
//
            try {
                self::bonus_affiliation_historical($user_id, $userAffiliate->id, $order_id, $store_id, $amount, $value, $isMyGain, 'affiliate', $delivery_charge);

              return true;
            } catch (\Exception $ex) {
                info($ex);
                echo $ex->getMessage();
                DB::rollback();
                return false;
            }
        }else return false;
    }

    private static function bonus_affiliation_historical($user_id, $affiliate_id, $order_id, $store_id, $amount, $value, $is_my_gain, $type, $delivery_charge): void
    {
        if (BusinessSetting::query()->where('key', 'wallet_status')->first()->value != 1) {
            return;
        }
        $affiliateHistorical = new AffiliateHistorical();
        $affiliateHistorical->user_id = $user_id;
        $affiliateHistorical->affiliate_id = $affiliate_id;
        $affiliateHistorical->store_id = $store_id;
        $affiliateHistorical->order_id = $order_id;
        $affiliateHistorical->type = $type;
        $affiliateHistorical->amount = $amount;
        $affiliateHistorical->delivery_charge = $delivery_charge;
        $affiliateHistorical->percentage = $is_my_gain ? 0 : $value;
        $affiliateHistorical->money = $is_my_gain ? $value : 0.00;
        $affiliateHistorical->value_gain = $value;
        $affiliateHistorical->is_first_purchase = $is_my_gain;
        try {
            DB::beginTransaction();
            $affiliateHistorical->save();
            DB::commit();
            return;
        } catch (\Exception $ex) {
            info($ex);
            dd($ex->getMessage());
            DB::rollback();

            return;
        }
    }

    public static function set_cashback_historical($user_id, $store_id, $order_id, $amount, $cashback, $cashback_percentage, $delivery_charge): bool
    {
        if (BusinessSetting::query()->where('key', 'wallet_status')->first()->value != 1) return false;
        $cashbackHistorical = new CashbackHistorial();
        $cashbackHistorical->user_id = $user_id;
        $cashbackHistorical->store_id = $store_id;
        $cashbackHistorical->order_id = $order_id;
        $cashbackHistorical->delivery_charge = $delivery_charge;
        $cashbackHistorical->amount = $amount;
        $cashbackHistorical->cashback = $cashback_percentage;
        $cashbackHistorical->cashback_percentage = $cashback;
        try {
            DB::beginTransaction();
            $cashbackHistorical->save();
            DB::commit();
            return true;
        } catch (\Exception $ex) {
            info($ex);
            echo $ex->getMessage();
            DB::rollback();

            return false;
        }
    }

    public static function create_cashback_transaction($user_id, $order_id, $order_amount, $cashback, $cashback_generated, $store_name){
        if (BusinessSetting::where('key', 'wallet_status')->first()->value != 1) return false;
        $user = User::query()->find($user_id);
        $current_balance = $user->wallet_balance;
        $wallet_transaction = new WalletTransaction();
        $wallet_transaction->user_id = $user->id;
        $wallet_transaction->transaction_id = \Str::uuid();
        $wallet_transaction->transaction_type = 'cashback';
        $wallet_transaction->description = 'Cashback referente a pedido #'.$order_id.' na loja '.$store_name;
        $wallet_transaction->input = true;
        $wallet_transaction->reference = $order_id;
        $wallet_transaction->credit = $cashback_generated;
        $wallet_transaction->debit = 0.00;
        $wallet_transaction->balance = $current_balance + $cashback_generated;
        $wallet_transaction->created_at = now();
        $wallet_transaction->updated_at = now();
        $user->wallet_balance += $cashback_generated;
        $user->wallet_balance_received += $cashback_generated;
        try {
            DB::beginTransaction();
            $user->save();
            $wallet_transaction->save();
            DB::commit();
            if (in_array('cashback', ['cashback', 'loyalty_point', 'order_place', 'add_fund_by_admin', 'referrer'])) return $wallet_transaction;
            return true;
        } catch (\Exception $ex) {
            info($ex);
            echo $ex->getMessage();
            DB::rollback();

            return false;
        }
    }

    public static function create_wallet_transaction($user_id, float $amount, $transaction_type, $referance, $store_name, $msg = null)
    {
        if (BusinessSetting::where('key', 'wallet_status')->first()->value != 1) return false;
        $user = User::find($user_id);
        $current_balance = $user->wallet_balance;

        $wallet_transaction = new WalletTransaction();
        $wallet_transaction->user_id = $user->id;
        $wallet_transaction->description = 'Pagamento do pedido #'.$referance.' na loja '.$store_name;
        $wallet_transaction->transaction_id = \Str::uuid();
        $wallet_transaction->reference = $referance;
        $wallet_transaction->transaction_type = $transaction_type;

        $debit = 0.0;
        $credit = 0.0;

        if (in_array($transaction_type, ['add_fund_by_admin', 'add_fund', 'order_refund', 'loyalty_point', 'referrer'])) {
            $credit = $amount;
            if ($transaction_type == 'add_fund') {
                $wallet_transaction->admin_bonus = $amount * BusinessSetting::where('key', 'wallet_add_fund_bonus')->first()->value / 100;
                $wallet_transaction->description = 'Recarga ADM ref';
            } else if ($transaction_type == 'loyalty_point') {

                $check_loyalty_point_exchange_rate = (int) BusinessSetting::where('key', 'loyalty_point_exchange_rate')->first()->value;

                if($check_loyalty_point_exchange_rate == 0){

                    $credit = (int)($amount / 1);
                }
                else{
                    $credit = (int)($amount / BusinessSetting::where('key', 'loyalty_point_exchange_rate')->first()->value);
                }
            }else if($transaction_type == 'add_fund_by_admin'){
                $wallet_transaction->description = $msg ?? 'Recarga ADM ref';
            }
        } else if ($transaction_type == 'order_place') {
            $debit = $amount;
        }

        $wallet_transaction->credit = $credit;
        $wallet_transaction->debit = $debit;
        $wallet_transaction->input = $credit > 0.00;
        $wallet_transaction->balance = $current_balance + $credit - $debit;
        $wallet_transaction->created_at = now();
        $wallet_transaction->updated_at = now();
        $user->wallet_balance += ($credit - $debit);
        $user->wallet_balance_received += ($credit);

        try {
            DB::beginTransaction();
            $user->save();
            $wallet_transaction->save();
            DB::commit();
            if (in_array($transaction_type, ['loyalty_point', 'order_place', 'add_fund_by_admin', 'referrer'])) return $wallet_transaction;
            return true;
        } catch (\Exception $ex) {
            info($ex);
            echo $ex->getMessage();
            DB::rollback();

            return false;
        }
    }

    public static function create_loyalty_point_transaction($user_id, $referance, $amount, $transaction_type): bool
    {
        $settings = array_column(BusinessSetting::whereIn('key', ['loyalty_point_status', 'loyalty_point_exchange_rate', 'loyalty_point_item_purchase_point'])->get()->toArray(), 'value', 'key');
        if ($settings['loyalty_point_status'] != 1) {
            return true;
        }

        $credit = 0;
        $debit = 0;
        $user = User::find($user_id);

        $loyalty_point_transaction = new LoyaltyPointTransaction();
        $loyalty_point_transaction->user_id = $user->id;
        $loyalty_point_transaction->transaction_id = \Str::uuid();
        $loyalty_point_transaction->reference = $referance;
        $loyalty_point_transaction->transaction_type = $transaction_type;

        if ($transaction_type == 'order_place') {
            $credit = (int)($amount * $settings['loyalty_point_item_purchase_point'] / 100);
        } else if ($transaction_type == 'point_to_wallet') {
            $debit = $amount;
        }

        $current_balance = $user->loyalty_point + $credit - $debit;
        $loyalty_point_transaction->balance = $current_balance;
        $loyalty_point_transaction->credit = $credit;
        $loyalty_point_transaction->debit = $debit;
        $loyalty_point_transaction->created_at = now();
        $loyalty_point_transaction->updated_at = now();
        $user->loyalty_point = $current_balance;

        try {
            DB::beginTransaction();
            $user->save();
            $loyalty_point_transaction->save();
            DB::commit();
            return true;
        } catch (\Exception $ex) {
            info($ex);
            DB::rollback();

            return false;
        }
    }
}
