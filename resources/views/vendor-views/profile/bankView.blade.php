@extends('layouts.vendor.app')
@section('title',translate('messages.Bank Info View'))
@push('css_or_js')
    <!-- Custom styles for this page -->
    <link href="{{my_asset('assets/back-end')}}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
@endpush

@section('content')
    <div class="content container-fluid">
        <div class="page-header">
            <h1 class="page-header-title">
                <span class="page-header-icon">
                    <img src="{{my_asset('/assets/admin/img/bank.png')}}" class="w--26" alt="">
                </span>
                <span>
                    {{translate('messages.my_bank_info')}}
                </span>
            </h1>
        </div>
        <!-- Page Heading -->
        <div class="row mt-3">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header flex-wrap justify-content-end p-2 px-xl-4">
                        @if($data->holder_name)
                            <button class="btn btn--primary m-1 m-sm-2" type="button" data-toggle="modal" data-target="#update-modal"><i class="tio-edit"></i> {{__('messages.update')}}</button>
                            <a class="btn btn--danger m-1 m-sm-2" href="javascript:void(0)" onclick="form_alert('del','Delete Bank Info ?')"><i class="tio-delete-outlined"></i> {{__('messages.delete')}}</a>
                            <form action="javascript:" id="del" method="post">
                                @csrf @method('post')
                            </form>
                        @else
                            <button class="btn btn--primary m-1 m-sm-2" type="button" data-toggle="modal" data-target="#update-modal"><i class="tio-add"></i>{{ translate('Add Bank Info') }}</button>
                        @endif
                    </div>
                    <div class="card-body">
                        <div class="bank--card">
                            <div class="bank--card__header border-bottom">
                                <div class="title">{{translate('messages.holder_name')}} : {{$data->holder_name ? $data->holder_name : translate('messages.No Data found')}}</div>
                            </div>
                            <div class="bank--card__body">
                                <img class="bank__icon" src="{{my_asset('assets/admin/img/bank-icon.png')}}" alt="public">
                                <ul>
                                    <li>
                                        <h5>
                                            {{translate('messages.bank_name')}} :
                                        </h5>
                                        <div class="info">
                                            {{$bank->short_name ?? translate('messages.No Data found')}}
                                        </div>
                                    </li>
                                    <li>
                                        <h5>
                                            {{translate('messages.branch')}} + {{translate('messages.digit')}}:
                                        </h5>
                                        <div class="info">
                                            {{$data->branch ?? translate('messages.No Data found')}}
                                        </div>
                                    </li>
                                    <li>
                                        <h5>
                                            {{translate('messages.nu_account')}} + {{translate('messages.digit')}}:
                                        </h5>
                                        <div class="info">
                                            {{$data->account ?? translate('messages.No Data found')}}
                                        </div>
                                    </li>
                                    <li>
                                        <h5>
                                            {{translate('messages.account_type')}}:
                                        </h5>
                                        <div class="info">
                                            {{trans('messages.'.$data->account_type) ?? translate('messages.No Data found')}}
                                        </div>
                                    </li>
                                    <li>
                                        <h5>
                                            {{translate('messages.holder_name')}}:
                                        </h5>
                                        <div class="info">
                                            {{$data->holder_name ?? translate('messages.No Data found')}}
                                        </div>
                                    </li>
                                    <li>
                                        <h5>
                                            {{translate('messages.cpf_holder')}}:
                                        </h5>
                                        <div class="info">
                                            {{$data->cpf_holder ?? translate('messages.No Data found')}}
                                        </div>
                                    </li>
                                    <li>
                                        <h5>
                                            {{translate('messages.pix_key_type')}}:
                                        </h5>
                                        <div class="info">
                                            {{trans('messages.pix_key_type_'.$data->pix_key_type) ?? translate('messages.No Data found')}}
                                        </div>
                                    </li>
                                    <li>
                                        <h5>
                                            {{translate('messages.key')}}:
                                        </h5>
                                        <div class="info">
                                            {{$data->pix_key ?? translate('messages.No Data found')}}
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="update-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="h3 mb-0">{{ translate('messages.edit_bank_info') }}</h1>
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true" class="btn btn--circle btn-soft-danger text-danger"><ti class="tio-clear"></ti></span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{route('vendor.profile.bank_update')}}" method="post"
                            enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="bank">{{translate('messages.bank')}} <span class="text-danger">*</span></label>
                                    <select name="bank" class="form-control js-select2-custom" id="bank" required>
                                        <option value="null">{{translate('messages.select_')}}</option>
                                        @foreach(\App\Models\Bank::query()->get() as $bank)
                                            <option {{$data->bank_id == $bank->id ? 'selected' : ''}} value="{{$bank->id}}">{{$bank->name_extension}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="name">{{translate('messages.branch')}} + {{translate('messages.digit')}}<span class="text-danger">*</span></label>
                                    <input type="number" name="branch" value="{{$data->branch}}" class="form-control"
                                           id="name"
                                           required maxlength="191">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="nu_account">{{translate('messages.nu_account')}} + {{translate('messages.digit')}} <span class="text-danger">*</span></label>
                                    <input type="number" name="nu_account" value="{{$data->account}}"
                                           class="form-control" id="nu_account"
                                           required maxlength="191">
                                </div>
                                <div class="col-md-6">
                                    <label for="account_type">{{translate('messages.account_type')}}<span class="text-danger">*</span></label>
                                    <select name="account_type" class="form-control js-select2-custom" id="account_type" required>
                                        <option {{$data->account_type == 'current_account' ? 'selected' : ''}} value="current_account">{{translate('messages.current_account')}}</option>
                                        <option {{$data->account_type == 'savings_account' ? 'selected' : ''}} value="savings_account">{{translate('messages.savings_account')}}</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="account_no">{{translate('messages.holder_name')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="holder_name" value="{{$data->holder_name}}"
                                           class="form-control" id="account_no"
                                           required maxlength="191">
                                </div>
                                <div class="col-md-6">
                                    <label for="cpf_holder">{{translate('messages.cpf_holder')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="cpf_holder" value="{{$data->cpf_holder}}"
                                           class="form-control" id="cpf_holder"
                                           required maxlength="191">
                                </div>

                            </div>

                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="pix_key_type">{{translate('messages.pix_key_type')}} <span class="text-danger">*</span></label>
                                    <select name="pix_key_type" class="form-control js-select2-custom" id="pix_key_type" required>
                                        <option {{'pix_key_type_'.$data->pix_key_type == 'pix_key_type_cpf' ? 'selected' : ''}} value="pix_key_type_cpf">{{translate('messages.pix_key_type_cpf')}}</option>
                                        <option {{'pix_key_type_'.$data->pix_key_type == 'pix_key_type_cnpj' ? 'selected' : ''}} value="pix_key_type_cnpj">{{translate('messages.pix_key_type_cnpj')}}</option>
                                        <option {{'pix_key_type_'.$data->pix_key_type == 'pix_key_type_phone' ? 'selected' : ''}} value="pix_key_type_phone">{{translate('messages.pix_key_type_phone')}}</option>
                                        <option {{'pix_key_type_'.$data->pix_key_type == 'pix_key_type_email' ? 'selected' : ''}} value="pix_key_type_email">{{translate('messages.pix_key_type_email')}}</option>
                                        <option {{'pix_key_type_'.$data->pix_key_type == 'pix_key_type_random' ? 'selected' : ''}} value="pix_key_type_random">{{translate('messages.pix_key_type_random')}}</option>
                                    </select>
                                </div>
                                <div id="pix_key_type_cpf_layout" {{'pix_key_type_'.$data->pix_key_type == 'pix_key_type_cpf' ? '' : 'hidden'}} class="col-md-6">
                                    <label for="pix_key_type_cpf_input">{{translate('messages.key')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="pix_key_type_cpf_input" value="{{$data->pix_key ??''}}"
                                           class="form-control" id="pix_key_type_cpf_input"
                                           {{'pix_key_type_'.$data->pix_key_type == 'pix_key_type_cpf' ? 'required' : ''}}>
                                </div>
                                <div id="pix_key_type_cnpj_layout" {{'pix_key_type_'.$data->pix_key_type == 'pix_key_type_cnpj' ? '' : 'hidden'}} class="col-md-6">
                                    <label for="pix_key_type_cnpj_input">{{translate('messages.key')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="pix_key_type_cnpj_input" value="{{$data->pix_key ??''}}"
                                           class="form-control" id="pix_key_type_cnpj_input"
                                        {{'pix_key_type_'.$data->pix_key_type == 'pix_key_type_cnpj' ? 'required' : ''}}>

                                </div>
                                <div id="pix_key_type_phone_layout" {{'pix_key_type_'.$data->pix_key_type == 'pix_key_type_phone' ? '' : 'hidden'}} class="col-md-6">
                                    <label for="pix_key_type_phone_input">{{translate('messages.key')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="pix_key_type_phone_input" value="{{$data->pix_key ??''}}"
                                           class="form-control" id="pix_key_type_phone_input"
                                        {{'pix_key_type_'.$data->pix_key_type == 'pix_key_type_phone' ? 'required' : ''}}>
                                </div>
                                <div id="pix_key_type_email_layout" {{'pix_key_type_'.$data->pix_key_type == 'pix_key_type_email' ? '' : 'hidden'}} class="col-md-6">
                                    <label for="pix_key_type_email_input">{{translate('messages.key')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="pix_key_type_email_input" value="{{$data->pix_key ??''}}"
                                           class="form-control" id="pix_key_type_email_input"
                                        {{'pix_key_type_'.$data->pix_key_type == 'pix_key_type_email' ? 'required' : ''}}>
                                </div>

                                <div id="pix_key_type_random_layout" {{'pix_key_type_'.$data->pix_key_type == 'pix_key_type_random' ? '' : 'hidden'}} class="col-md-6">
                                    <label for="pix_key_type_random_input">{{translate('messages.key')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="pix_key_type_random_input" value="{{$data->pix_key ??''}}"
                                           class="form-control" id="pix_key_type_random_input"
                                        {{'pix_key_type_'.$data->pix_key_type == 'pix_key_type_random' ? 'required' : ''}}>
                                </div>

                            </div>

                        </div>
                        <div class="btn--container justify-content-end">
                            <button type="reset" class="btn btn--reset">{{translate('messages.reset')}}</button>
                            <button type="submit" class="btn btn--primary" id="btn_update">{{translate('messages.update')}}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script_2')
    <script>
        $('#cpf_holder').mask('000.000.000-00');
        $('#pix_key_type_cpf_input').mask('000.000.000-00');
        $('#pix_key_type_cnpj_input').mask('00.000.000/0000-00');
        $('#pix_key_type_phone_input').mask('(00) 00000-0000');
        // $('#pix_key_type_random_input').mask('00000000-0000-0000-0000-000000000000');
        const pix_key_type_cpf_layout = document.getElementById('pix_key_type_cpf_layout')
        const pix_key_type_cnpj_layout = document.getElementById('pix_key_type_cnpj_layout')
        const pix_key_type_phone_layout = document.getElementById('pix_key_type_phone_layout')
        const pix_key_type_email_layout = document.getElementById('pix_key_type_email_layout')
        const pix_key_type_random_layout = document.getElementById('pix_key_type_random_layout')
        const pix_key_type_cpf = document.getElementById('pix_key_type_cpf_input')
        const pix_key_type_cnpj = document.getElementById('pix_key_type_cnpj_input')
        const pix_key_type_phone = document.getElementById('pix_key_type_phone_input')
        const pix_key_type_email = document.getElementById('pix_key_type_email_input')
        const pix_key_type_random= document.getElementById('pix_key_type_random_input')

        $('#pix_key_type').change(function(){
            const val = $(this).val()
            console.log(val)
            pix_key_type_cpf_layout.setAttribute('hidden', '')
            pix_key_type_cnpj_layout.setAttribute('hidden', '')
            pix_key_type_phone_layout.setAttribute('hidden', '')
            pix_key_type_email_layout.setAttribute('hidden', '')
            pix_key_type_random_layout.setAttribute('hidden', '')

            pix_key_type_cpf.removeAttribute('required')
            pix_key_type_cnpj.removeAttribute('required')
            pix_key_type_phone.removeAttribute('required')
            pix_key_type_email.removeAttribute('required')
            pix_key_type_random.removeAttribute('required')
            if(val === 'pix_key_type_cnpj'){
                pix_key_type_cnpj_layout.removeAttribute('hidden')
                pix_key_type_cnpj.setAttribute('required', '')
            }
            if(val === 'pix_key_type_cpf'){
                pix_key_type_cpf_layout.removeAttribute('hidden')
                pix_key_type_cpf.setAttribute('required', '')
            }
            if(val === 'pix_key_type_phone'){
                pix_key_type_phone_layout.removeAttribute('hidden')
                pix_key_type_phone.setAttribute('required', '')
            }
            if(val === 'pix_key_type_email'){
                pix_key_type_email_layout.removeAttribute('hidden')
                pix_key_type_email.setAttribute('required', '')
            }
            if(val === 'pix_key_type_random'){
                pix_key_type_random_layout.removeAttribute('hidden')
                pix_key_type_random.setAttribute('required', '')
            }
        })
    </script>
@endpush
