<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Models\Invoices;
use App\Models\Store;
use App\Models\StoreWallet;
use App\Models\WithdrawRequest;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\File;

class WalletController extends Controller
{
    public function index()
    {
        $store = Store::query()->where('vendor_id', Helpers::get_vendor_id())->first();
        $wallet = StoreWallet::query()->where('vendor_id', Helpers::get_vendor_id())->first();
        if(!isset($wallet)){
            $wallet= new StoreWallet();
            $wallet->vendor_id = Helpers::get_vendor_id();
            $wallet->total_earning= 0.0;
            $wallet->money_in_hands=0.0;
            $wallet->current_cycle=now();
            $wallet->created_at=now();
            $wallet->updated_at=now();
            $wallet->save();
        }
        $total_gain = 0;
        $money_in_hand = 0;
        $total_paid = 0;
        $credit_balance = 0;
        $debit_balance = 0;
        $allPaidCredit = Invoices::query()
            ->where('store_id', $store->id)
            ->where('status', 'paid_out')
            ->where('type', 'credit')
            ->selectRaw(DB::raw("SUM(`total_gain`) as r_total_gain, SUM(`money_in_hand`) + SUM(`invoice_balance`) as r_money_in_hand, 0 as total_paid"))
            ->get();
        $allPaidDebit = Invoices::query()
            ->where('store_id', $store->id)
            ->where('status', 'paid_out')
            ->where('type', 'debit')
            ->selectRaw(DB::raw("SUM(`total_gain`) as r_total_gain, SUM(`money_in_hand`) - SUM(`invoice_balance`) as r_money_in_hand, SUM(`invoice_balance`) as total_paid"))
            ->get();

        $allCredit = Invoices::query()
            ->where('store_id', $store->id)
            ->whereNotIn('status', ['paid_out'])
            ->where('type', 'credit')
            ->selectRaw(DB::raw("SUM(`total_gain`) as r_total_gain, SUM(`money_in_hand`) as r_money_in_hand, SUM(`invoice_balance`) as credit_balance"))
            ->get();
        $allDebit = Invoices::query()
            ->where('store_id', $store->id)
            ->whereNotIn('status', ['paid_out'])
            ->where('type', 'debit')
            ->selectRaw(DB::raw("SUM(`total_gain`) as r_total_gain, SUM(`money_in_hand`) as r_money_in_hand, SUM(`invoice_balance`) as debit_balance"))
            ->get();

        foreach ($allPaidCredit as $value){
            $total_gain += $value->r_total_gain ?? 0;
            $money_in_hand += $value->r_money_in_hand ?? 0;
            $total_paid += $value->total_paid ?? 0;
        }
        foreach ($allPaidDebit as $value){
            $total_gain += $value->r_total_gain ?? 0;
            $money_in_hand += $value->r_money_in_hand ?? 0;
            $total_paid += $value->total_paid ?? 0;
        }

        foreach ($allCredit as $value){
            $total_gain += $value->r_total_gain ?? 0;
            $money_in_hand += $value->r_money_in_hand ?? 0;
            $credit_balance += $value->credit_balance ?? 0;
        }
        foreach ($allDebit as $value){
            $total_gain += $value->r_total_gain ?? 0;
            $money_in_hand += $value->r_money_in_hand ?? 0;
            $debit_balance += $value->debit_balance ?? 0;
        }
        $invoices = Invoices::query()
            ->where('store_id', $store->id)
            ->orderBy('created_at', 'DESC')->limit(5)->paginate(5);

        return view('vendor-views.wallet.index', compact('invoices', 'wallet', 'total_gain', 'money_in_hand', 'total_paid', 'credit_balance', 'debit_balance'));

//        $withdraw_req = WithdrawRequest::with(['vendor'])->where('vendor_id', Helpers::get_vendor_id())->latest()->paginate(config('default_pagination'));
//        return view('vendor-views.wallet.index', compact('withdraw_req'));
    }

    public function w_request(Request $request)
    {
        $w = StoreWallet::where('vendor_id', Helpers::get_vendor_id())->first();
        if ($w->balance >= $request['amount'] && $request['amount'] > .01) {
            $data = [
                'vendor_id' => Helpers::get_vendor_id(),
                'amount' => $request['amount'],
                'transaction_note' => null,
                'approved' => 0,
                'created_at' => now(),
                'updated_at' => now()
            ];
            DB::table('withdraw_requests')->insert($data);
            StoreWallet::where('vendor_id', Helpers::get_vendor_id())->increment('pending_withdraw', $request['amount']);
            Toastr::success('Withdraw request has been sent.');
            return redirect()->back();
        }

        Toastr::error('invalid request.!');
        return redirect()->back();
    }

    public function close_request($id)
    {
        $wr = WithdrawRequest::find($id);
        if ($wr->approved == 0) {
            StoreWallet::where('vendor_id', Helpers::get_vendor_id())->decrement('pending_withdraw', $wr['amount']);
        }
        $wr->delete();
        Toastr::success('request closed!');
        return back();
    }

    public function filter_invoices(Request $request): RedirectResponse
    {
        $request->validate([
            'from_date' => 'required_if:to_date,true',
            'to_date' => 'required_if:from_date,true',
        ]);
        session()->put('filter_invoices_my', json_encode($request->all()));
        return back();
    }

    public function filter_reset_invoices(): RedirectResponse
    {
        session()->forget('filter_invoices_my');
        return back();
    }

    public function list_invoices(Request $request){
        $store = Store::query()->where('vendor_id', Helpers::get_vendor_id())->first();
        if(session()->has('filter_invoices_my'))
        {
            foreach (json_decode(session('filter_invoices_my')) as $key => $value){
                $request[$key] = $value;
            }
        }
        $invoices_status = Invoices::query()
            ->where('store_id', $store->id)
            ->selectRaw(DB::raw('count(*) as counts, `status` as types'))->groupBy('types')
            ->get();

        $invoices = Invoices::with('store')->with('module')->with('zone')
            ->where('store_id', $store->id)
            ->orderBy('created_at' , 'desc')
            ->when(isset($request->status), function ($query)use($request){
                return $query->whereIn('status', $request->status);
            })
            ->when(isset($request->types), function ($query)use($request){
                return $query->whereIn('types', $request->types);
            })
            ->when(isset($request->month_year), function ($query)use($request){
                return $query->where('month_year', now()->setTimeFromTimeString($request->month_year.' 00:00:00')->format('m-Y'));
            })
            ->when(isset($request->from_date)&&isset($request->to_date)&&$request->from_date!=null&&$request->to_date!=null, function($query)use($request){
                return $query->whereBetween('created_at', [$request->from_date." 00:00:00",$request->to_date." 23:59:59"]);
            })
            ->paginate(10);;


        $from_date = $request->from_date;
        $to_date = $request->to_date;
        $status = $request->status ?? [];
        $types = $request->types ?? [];
        $month_year = $request->month_year;
//        dd($from_date, $to_date, $status, $types, $store_id, $zone_id, $module_id, $month_year);

        return view('vendor-views.invoices.list', compact('invoices', 'month_year', 'invoices_status', 'status', 'from_date', 'to_date', 'types'));
    }


    public function send_proof(Request $request): RedirectResponse
    {
        $invoice = Invoices::query()->find($request->id_invoice);
        if($request->hasFile('proof') && isset($invoice)){
            $file = storage_path('app/public/proof/'.$invoice->proof ?? '');
            if(file_exists($file)){
                File::delete($file);
            }
            $proof = $request->file('proof')->store('public/proof');
            $nameFile = explode('/', $proof)[2];
            $invoice->proof = $nameFile;
            $invoice->save();
            Toastr::success('Fatura colocada em pagamento em processamento');
            return back();
        }
        Toastr::error('Entre com o comprovante de pagamento');
        return back();
    }

    function view_proof($id, Request $request){
        $invoice = Invoices::query()->find($id);
        if(isset($invoice)){
            $file = storage_path('app/public/proof/'.$invoice->proof ?? '');
            if(file_exists($file)){
                return response()->file($file);
            }
            Toastr::error('Comprovante não encontrado');
            return back();
        }
        Toastr::error('Fatura não encontrada');
        return back();
    }

    public function print_invoice($id){
        $invoice = Invoices::with('store')->find($id);
        if(isset($invoice)){
            return view('vendor-views.invoices.invoice', compact('invoice'));
        }
        Toastr::error('Fatura não encontrada');
        return back();
    }

    public function print_invoice_print($id){
        $invoice = Invoices::with('store')->find($id);
        if(isset($invoice)){
            return view('vendor-views.invoices.invoice-print', compact('invoice'))->render();
        }
        Toastr::error('Fatura não encontrada');
        return back();
    }

    public function finish_payment(Request $request): RedirectResponse
    {
        $invoice = Invoices::query()->find($request->id_invoice);
        if($request->hasFile('proof') && isset($invoice)){
            $proof = $request->file('proof')->store('public/proof');
            $nameFile = explode('/', $proof)[2];
            $invoice->proof = $nameFile;
            $invoice->status = 'processing_payment';
            $invoice->save();
            Toastr::success('Fatura colocada em pagamento em processamento');
            return back();
        }
        Toastr::error('Entre com o comprovante de pagamento');
        return back();
    }

}
