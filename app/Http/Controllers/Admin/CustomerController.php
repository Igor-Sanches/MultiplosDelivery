<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CustomerAddress;
use App\Models\Order;
use App\Models\User;
use App\Models\WalletTransaction;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\CentralLogics\Helpers;
use App\Models\Newsletter;
use App\Models\BusinessSetting;
use Rap2hpoutre\FastExcel\FastExcel;

class CustomerController extends Controller
{
    public function customer_list(Request $request)
    {
        $key = [];
        if ($request->search) {
            $key = explode(' ', $request['search']);
        }
        $customers = User::when(count($key) > 0, function ($query) use ($key) {
            foreach ($key as $value) {
                $query->orWhere('f_name', 'like', "%{$value}%")
                    ->orWhere('l_name', 'like', "%{$value}%")
                    ->orWhere('email', 'like', "%{$value}%")
                    ->orWhere('phone', 'like', "%{$value}%");
            };
        })
            ->orderBy('order_count', 'desc')->paginate(config('default_pagination'));
        return view('admin-views.customer.list', compact('customers'));
    }

    public function status(User $customer, Request $request)
    {
        $customer->status = $request->status;
        $customer->save();

        try {
            if ($request->status == 0) {
                $customer->tokens->each(function ($token, $key) {
                    $token->delete();
                });
                if (isset($customer->cm_firebase_token)) {
                    $data = [
                        'title' => translate('messages.suspended'),
                        'description' => translate('messages.your_account_has_been_blocked'),
                        'order_id' => '',
                        'image' => '',
                        'type' => 'block'
                    ];
                    Helpers::send_push_notif_to_device($customer->cm_firebase_token, $data);

                    DB::table('user_notifications')->insert([
                        'data' => json_encode($data),
                        'user_id' => $customer->id,
                        'created_at' => now(),
                        'updated_at' => now()
                    ]);
                }
            }
        } catch (\Exception $e) {
            Toastr::warning(translate('messages.push_notification_faild'));
        }

        Toastr::success(translate('messages.customer') . translate('messages.status_updated'));
        return back();
    }

    public function search(Request $request)
    {
        $key = explode(' ', $request['search']);
        $customers = User::where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('f_name', 'like', "%{$value}%")
                    ->orWhere('l_name', 'like', "%{$value}%")
                    ->orWhere('email', 'like', "%{$value}%")
                    ->orWhere('phone', 'like', "%{$value}%");
            }
        })->orderBy('order_count', 'desc')->limit(50)->get();
        return response()->json([
            'count' => count($customers),
            'view' => view('admin-views.customer.partials._table', compact('customers'))->render()
        ]);
    }

    public function edit_customer($id){
        $customer = User::query()->find($id);
        if (isset($customer)) {
            return view('admin-views.customer.customer-edit', compact('customer'));
        }
        Toastr::error(translate('messages.customer_not_found'));
        return back();
    }

    public function update_customer($id, Request $request){
        $request->validate([
            'f_name' => 'required',
            'l_name' => 'required',
            'email' => 'required',
            'cpf' => 'required',
        ]);
        $customer = User::query()->find($id);
        if (isset($customer)) {
            $customer->f_name = $request->f_name;
            $customer->l_name = $request->l_name;
            $customer->email = $request->email;
            $customer->cpf = $request->cpf;
            $customer->save();
            Toastr::success(translate('messages.save_customer'));
            return back();
        }

        Toastr::error(translate('messages.customer_not_found'));
        return back();
    }

    public function view($tab, $id)
    {
        $customer = User::query()->find($id);
        if (isset($customer)) {
            if($tab == 'index'){
                $payments = WalletTransaction::query()
                    ->where('user_id', $id)
                    ->where('input', 1)
                    ->whereIn('transaction_type', ['cashback', 'reference', 'affiliate'])
                    ->selectRaw(DB::raw("sum(`credit`) as total_credit, count(*) as credit, IF((`transaction_type`='cashback'), `transaction_type`, IF(`transaction_type`='reference',`transaction_type`, IF(`transaction_type`='affiliate',`transaction_type`, `transaction_type`))) as 'transaction_types'"))->groupBy('transaction_types')
                    ->get();

                return view('admin-views.customer.customer-view', compact('customer', 'payments'));
            }else if($tab == 'orders'){
                $orders = Order::latest()->where(['user_id' => $id])->Notpos()->paginate(config('default_pagination'));
                return view('admin-views.customer.view.orders', compact('customer', 'orders'));
            }else if($tab == 'cashback'){
                $cashbacks = WalletTransaction::query()
                    ->latest()
                    ->where(['user_id' => $id])
                    ->where('transaction_type', 'cashback')
                    ->where('input', 1)
                    ->paginate(config('default_pagination'));
                return view('admin-views.customer.view.cashback', compact('customer', 'cashbacks'));
            }else if($tab == 'reference_extracted'){
                $reference_extracted = WalletTransaction::query()
                    ->latest()
                    ->where(['user_id' => $id])
                    ->where('transaction_type', 'reference')
                    ->where('input', 1)
                    ->paginate(config('default_pagination'));
                return view('admin-views.customer.view.reference_extracted', compact('customer', 'reference_extracted'));
            }else if($tab == 'affiliates_extracted'){
                $affiliates_extracted = WalletTransaction::query()
                    ->latest()
                    ->where(['user_id' => $id])
                    ->where('transaction_type', 'affiliate')
                    ->where('input', 1)
                    ->paginate(config('default_pagination'));
                return view('admin-views.customer.view.affiliates_extracted', compact('customer', 'affiliates_extracted'));
            }else if($tab == 'transactions'){
                $transactions = WalletTransaction::query()
                    ->latest()
                    ->where(['user_id' => $id])
                    ->paginate(config('default_pagination'));
                return view('admin-views.customer.view.transactions_extracted', compact('customer', 'transactions'));
            }else if($tab == 'affiliates'){
                $affiliates = User::query()
                    ->latest()
                    ->where(['affiliate' => $customer->ref_code])
                    ->paginate(config('default_pagination'));
                return view('admin-views.customer.view.affiliates', compact('customer', 'affiliates'));
            }else if($tab == 'address'){
                $addresses = CustomerAddress::query()
                    ->latest()
                    ->where(['user_id' => $customer->id])
                    ->paginate(config('default_pagination'));
                return view('admin-views.customer.view.address', compact('customer', 'addresses'));
            }
        }
        Toastr::error(translate('messages.customer_not_found'));
        return back();
    }

    public function edit_address($id, $address_id){
        $customer = User::query()->find($id);
        $address = CustomerAddress::query()->find($address_id);
        return view('admin-views.customer.address-edit', compact('customer', 'address'));
    }

    public function update_address_customer($id, $address_id, Request $request){

        $request->validate([
            'address_type' => 'required|in:home,office,others',
            'contact_person_number' => 'required',
            'contact_person_name' => 'required',
            'address' => 'required',
            'floor' => 'required',
            'road' => 'required',
            'house' => 'required',
        ]);

        $address = CustomerAddress::query()->find($address_id);
        if (isset($address)) {
            $address->address_type = $request->address_type;
            $address->contact_person_number = $request->contact_person_number;
            $address->contact_person_name = $request->contact_person_name;
            $address->address = $request->address;
            $address->floor = $request->floor;
            $address->road = $request->road;
            $address->house = $request->house;
            $address->save();
            Toastr::success(translate('messages.save_customer'));
            return back();
        }

        Toastr::error(translate('messages.customer_not_found'));
        return back();
    }

    public function subscribedCustomers()
    {
        $data['subscribedCustomers'] = Newsletter::orderBy('id', 'desc')->get();
        return view('admin-views.customer.subscribed-emails', $data);
    }

    public function subscribed_customer_export(Request $request){
        $customers = Newsletter::orderBy('id', 'desc')->get();
        if($request->type == 'excel'){
            return (new FastExcel($customers))->download('Customers.xlsx');
        }elseif($request->type == 'csv'){
            return (new FastExcel($customers))->download('Customers.csv');
        }
    }

    public function subscriberMailSearch(Request $request)
    {
        $key = explode(' ', $request['search']);
        $customers = Newsletter::where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('email', 'like', "%". $value."%");
            }
        })->orderBy('id', 'desc')->get();
        return response()->json([
            'count' => count($customers),
            'view' => view('admin-views.customer.partials._subscriber-email-table', compact('customers'))->render()
        ]);
    }

    public function get_customers(Request $request){
        $key = explode(' ', $request['q']);
        $data = User::
        where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('f_name', 'like', "%{$value}%")
                ->orWhere('l_name', 'like', "%{$value}%")
                ->orWhere('phone', 'like', "%{$value}%");
            }
        })
        ->limit(8)
        ->get([DB::raw('id, CONCAT(f_name, " ", l_name, " (", phone ,")") as text')]);
        if($request->all) $data[]=(object)['id'=>false, 'text'=>translate('messages.all')];


        return response()->json($data);
    }

    public function settings()
    {
        $data = BusinessSetting::where('key','like','wallet_%')
            ->orWhere('key','like','loyalty_%')
            ->orWhere('key','like','ref_earning_%')
            ->orWhere('key','like','ref_earning_%')->get();
        $data = array_column($data->toArray(), 'value','key');
        //dd($data);
        return view('admin-views.customer.settings', compact('data'));
    }

    public function update_settings(Request $request)
    {

        if (env('APP_MODE') == 'demo') {
            Toastr::info(translate('messages.update_option_is_disable_for_demo'));
            return back();
        }

        $request->validate([
            'add_fund_bonus'=>'nullable|numeric|max:100|min:0',
            'loyalty_point_exchange_rate'=>'nullable|numeric',
            'ref_earning_exchange_rate'=>'nullable|numeric',
        ]);
        BusinessSetting::updateOrInsert(['key' => 'wallet_status'], [
            'value' => $request['customer_wallet']??0
        ]);
        BusinessSetting::updateOrInsert(['key' => 'loyalty_point_status'], [
            'value' => $request['customer_loyalty_point']??0
        ]);
        BusinessSetting::updateOrInsert(['key' => 'ref_earning_status'], [
            'value' => $request['ref_earning_status'] ?? 0
        ]);
        BusinessSetting::updateOrInsert(['key' => 'wallet_add_refund'], [
            'value' => $request['refund_to_wallet']??0
        ]);
        BusinessSetting::updateOrInsert(['key' => 'loyalty_point_exchange_rate'], [
            'value' => $request['loyalty_point_exchange_rate'] ?? 0
        ]);
        BusinessSetting::updateOrInsert(['key' => 'ref_earning_exchange_rate'], [
            'value' => $request['ref_earning_exchange_rate'] ?? 0
        ]);
        BusinessSetting::updateOrInsert(['key' => 'loyalty_point_item_purchase_point'], [
            'value' => $request['item_purchase_point']??0
        ]);
        BusinessSetting::updateOrInsert(['key' => 'loyalty_point_minimum_point'], [
            'value' => $request['minimun_transfer_point']??0
        ]);

        Toastr::success(translate('messages.customer_settings_updated_successfully'));
        return back();
    }

    public function export(Request $request){
        $customers = User::orderBy('order_count', 'desc')->get();
        if($request->type == 'excel'){
            return (new FastExcel($customers))->download('Customers.xlsx');
        }elseif($request->type == 'csv'){
            return (new FastExcel($customers))->download('Customers.csv');
        }
    }
}
