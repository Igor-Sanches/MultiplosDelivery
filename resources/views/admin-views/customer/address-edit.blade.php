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
                    <h1 class="h3 mb-0">{{ translate('messages.edit_address') }}</h1>
                </div>
                <div class="card-body">
                    <form action="{{route('admin.customer.update-address-customer', [$customer->id, $address->id])}}" method="post"
                          enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6 mt-2">
                                    <label for="address_type">{{translate('messages.address_type')}} <span class="text-danger">*</span></label>
                                    <select name="address_type" class="form-control js-select2-custom" id="address_type" required>
                                        <option {{$address->address_type == 'home' ? 'selected' : ''}} value="home">{{translate('messages.home')}}</option>
                                        <option {{$address->address_type == 'office' ? 'selected' : ''}} value="office">{{translate('messages.office')}}</option>
                                        <option {{$address->address_type == 'others' ? 'selected' : ''}} value="others">{{translate('messages.others')}}</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mt-2">
                                    <label for="contact_person_number">{{translate('messages.contact_person_number')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="contact_person_number" value="{{$address->contact_person_number}}"
                                           class="form-control" id="contact_person_number"
                                           required>
                                </div>
                                <div class="col-md-6 mt-2">
                                    <label for="contact_person_name">{{translate('messages.contact_person_name')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="contact_person_name" value="{{$address->contact_person_name}}"
                                           class="form-control" id="contact_person_name"
                                           required>
                                </div>
                                <div class="col-md-6 mt-2">
                                    <label for="address">{{translate('messages.address')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="address" value="{{$address->address}}"
                                           class="form-control" id="address"
                                           required>
                                </div>
                                <div class="col-md-6 mt-2">
                                    <label for="floor">{{translate('messages.floor')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="floor" value="{{$address->floor}}"
                                           class="form-control" id="floor">
                                </div>
                                <div class="col-md-6 mt-2">
                                    <label for="road">{{translate('messages.road')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="road" value="{{$address->road}}"
                                           class="form-control" id="road">
                                </div>
                                <div class="col-md-6 mt-2">
                                    <label for="house">{{translate('messages.house')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="house" value="{{$address->house}}"
                                           class="form-control" id="house">
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
