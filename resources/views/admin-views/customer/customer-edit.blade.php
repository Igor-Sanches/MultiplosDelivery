@extends('layouts.admin.app')

@section('title',translate('Customer Edit'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="d-print-none pb-3">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title mb-0">{{translate('messages.customer')}} {{translate('messages.id')}} #{{$customer['id']}}</h1>
                    <span>
                        <i class="tio-date-range"></i>
                        {{translate('messages.joined_at')}} : {{date('d M Y '.config('timeformat'),strtotime($customer['created_at']))}}
                    </span>

                </div>

            </div>
        </div>

        <div class="card">
            <div class="card-content">
                <div class="card-header">
                    <h1 class="h3 mb-0">{{ translate('messages.edit_customer') }}</h1>
                </div>
                <div class="card-body">
                    <form action="{{route('admin.customer.update-customer', [$customer->id])}}" method="post"
                          enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6 mt-2">
                                    <label for="f_name">{{translate('messages.f_name')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="f_name" value="{{$customer->f_name}}"
                                           class="form-control" id="f_name"
                                           required>
                                </div>
                                <div class="col-md-6 mt-2">
                                    <label for="l_name">{{translate('messages.l_name')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="l_name" value="{{$customer->l_name}}"
                                           class="form-control" id="l_name"
                                           required>
                                </div>
                                <div hidden class="col-md-6 mt-2">
                                    <label for="phone">{{translate('messages.phone')}} <span class="text-danger"><span class="badge badge-soft-info">@lang('messages.not_editable')</span></span></label>
                                    <input type="text" name="phone" value="{{$customer->phone}}"
                                           class="form-control" id="phone"
                                           readonly>
                                </div>
                                <div class="col-md-6 mt-2">
                                    <label for="email">{{translate('messages.email')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="email" value="{{$customer->email}}"
                                           class="form-control" id="email">
                                </div>
                                <div class="col-md-6 mt-2">
                                    <label for="cpf">{{translate('messages.cpf')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="cpf" value="{{$customer->cpf}}"
                                           class="form-control" id="cpf">
                                </div>
                            </div>
                        </div>
                        <div class="btn--container justify-content-end">
                            <button type="submit" class="btn btn--primary" id="btn_update">{{translate('messages.update')}}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- End Row -->
    </div>
@endsection

@push('script_2')
    <script>
        $('#cpf').mask('000.000.000-00');
    </script>
@endpush
