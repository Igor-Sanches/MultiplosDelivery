<?php

namespace App\Http\Controllers\Vendor;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\Bank;
use App\Models\Vendor;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ProfileController extends Controller
{
    public function view()
    {
        return view('vendor-views.profile.index');
    }

    public function bank_view()
    {
        $data = Helpers::get_vendor_data();
        $bank = Bank::query()->find($data->bank_id);
        return view('vendor-views.profile.bankView', compact('data', 'bank'));
    }

    public function edit()
    {
        $data = Helpers::get_vendor_data();
        return view('vendor-views.profile.edit', compact('data'));
    }

    public function update(Request $request)
    {
        $table=auth('vendor')->check()?'vendors':'vendor_employees';
        $seller = auth('vendor')->check()?auth('vendor')->user():auth('vendor_employee')->user();
        $request->validate([
            'f_name' => 'required|max:100',
            'l_name' => 'nullable|max:100',
            'email' => 'required|unique:'.$table.',email,'.$seller->id,
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10|max:20|unique:'.$table.',phone,'.$seller->id,
        ], [
            'f_name.required' => translate('messages.first_name_is_required'),
        ]);
        $seller = auth('vendor')->check()?auth('vendor')->user():auth('vendor_employee')->user();
        $seller->f_name = $request->f_name;
        $seller->l_name = $request->l_name;
        $seller->phone = $request->phone;
        $seller->email = $request->email;
        if ($request->image) {
            $seller->image = Helpers::update('vendor/', $seller->image, 'png', $request->file('image'));
        }
        $seller->save();

        Toastr::success(translate('messages.profile_updated_successfully'));
        return back();
    }

    public function settings_password_update(Request $request)
    {
        $request->validate([
            'password' => 'required|same:confirm_password|min:6',
            'confirm_password' => 'required',
        ]);

        $seller = auth('vendor')->check()?Helpers::get_vendor_data():auth('vendor_employee')->user();
        $seller->password = bcrypt($request['password']);
        $seller->save();
        Toastr::success(translate('messages.vendor_pasword_updated_successfully'));
        return back();
    }

    public function bank_update(Request $request)
    {
        $request->validate([
            'bank' => 'required',
            'branch' => 'required|max:191',
            'nu_account' => 'required|max:191',
            'holder_name' => 'required',
            'cpf_holder' => 'required',
            'pix_key_type' => 'required|in:pix_key_type_cpf,pix_key_type_cnpj,pix_key_type_phone,pix_key_type_email,pix_key_type_random',
            'account_type' => 'required|in:current_account,savings_account',
        ]);
        $bank_id = $request->bank;
        if($bank_id == 'null'){
            Toastr::error(translate('messages.bank_id_no_add'));
            return back();
        }
        $branch = $request->branch;
        $nu_account = $request->nu_account;
        $account_type = $request->account_type;
        $holder_name = $request->holder_name;
        $cpf_holder = $request->cpf_holder;
        $pix_key_type = $request->pix_key_type;
        $pix_key = '';
        if($pix_key_type == 'pix_key_type_cpf'){
            $pix_key = $request->pix_key_type_cpf_input;
        }
        if($pix_key_type == 'pix_key_type_cnpj'){
            $pix_key = $request->pix_key_type_cnpj_input;
        }
        if($pix_key_type == 'pix_key_type_phone'){
            $pix_key = $request->pix_key_type_phone_input;
        }
        if($pix_key_type == 'pix_key_type_email'){
            $pix_key = $request->pix_key_type_email_input;
        }
        if($pix_key_type == 'pix_key_type_random'){
            $pix_key = $request->pix_key_type_random_input;
        }
        if(strlen($cpf_holder) != 14){
            Toastr::error(translate('messages.cpf_no_format'));
            return back();
        }

        if($pix_key_type == 'pix_key_type_cpf'){
            if(strlen($pix_key) != 14){
                Toastr::error(translate('messages.cpf_no_format'));
                return back();
            }
        }
        if($pix_key_type == 'pix_key_type_cnpj'){
            if(strlen($pix_key) != 17){
                Toastr::error(translate('messages.cnpj_no_format'));
                return back();
            }
        }
        $bank = Helpers::get_vendor_data();
        $bank->bank_id = $bank_id;
        $bank->branch = $branch;
        $bank->account = $nu_account;
        $bank->account_type = $account_type;
        $bank->holder_name = $holder_name;
        $bank->cpf_holder = $cpf_holder;
        $bank->pix_key_type = Str::replace('pix_key_type_', '', $pix_key_type);
        $bank->pix_key = $pix_key;
        $bank->save();
        Toastr::success(translate('messages.bank_info_updated_successfully'));
        return redirect()->route('vendor.profile.bankView');
    }

    public function bank_edit()
    {
        $data = Helpers::get_vendor_data();
        return view('vendor-views.profile.bankEdit', compact('data'));
    }
}
