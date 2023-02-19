@extends('layouts.admin.app')

@section('title',translate('Customer Details'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        @include('admin-views.customer.view.partials._header',['customer'=>$customer])
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

                <a class="btn btn-sm btn-soft-danger mr-1"
                   href="{{route('admin.customer.edit-customer',[$customer['id']])}}"
                   data-toggle="tooltip" data-placement="top" title="@lang('messages.edit_customer')">
                    @lang('messages.edit')
                </a>

                <div class="col-sm-auto">
                    <a class="btn btn-icon btn-sm btn-soft-secondary rounded-circle mr-1"
                       href="{{route('admin.customer.view',['index', $customer['id']-1])}}"
                       data-toggle="tooltip" data-placement="top" title="@lang('messages.previous_customer')">
                        <i class="tio-arrow-backward"></i>
                    </a>
                    <a class="btn btn-icon btn-sm btn-soft-secondary rounded-circle"
                       href="{{route('admin.customer.view',['index', $customer['id']+1])}}" data-toggle="tooltip"
                       data-placement="top" title="@lang('messages.next_customer')">
                        <i class="tio-arrow-forward"></i>
                    </a>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row mb-2 g-2">
            <!-- Collected Cash Card Example -->
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="resturant-card card--bg-1">
                    <img class="resturant-icon" src="{{my_asset('assets/admin/img/customer-loyality/1.png')}}" alt="public">
                    <div class="title text-capitalize">{{$customer->wallet_balance??0}}</div>
                    <div class="subtitle">{{__('messages.wallet')}} {{__('messages.balance')}}</div>
                </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="resturant-card card--bg-3">
                    <img class="resturant-icon" src="{{my_asset('assets/admin/img/customer-loyality/2.png')}}" alt="public">
                    <div class="title text-capitalize">{{\App\CentralLogics\Helpers::user_report($payments, 'cashback')??0}}</div>
                    <div class="subtitle ">{{__('messages.cashback_already_won')}}</div>
                </div>
            </div>

            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="resturant-card card--bg-4">
                    <img class="resturant-icon" src="{{my_asset('assets/admin/img/customer-loyality/2.png')}}" alt="public">
                    <div class="title text-capitalize">{{\App\CentralLogics\Helpers::user_report($payments, 'reference')??0}}</div>
                    <div class="subtitle ">{{__('messages.reference_already_won')}}</div>
                </div>
            </div>

            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="resturant-card card--bg-2">
                    <img class="resturant-icon" src="{{my_asset('assets/admin/img/customer-loyality/2.png')}}" alt="public">
                    <div class="title text-capitalize">{{\App\CentralLogics\Helpers::user_report($payments, 'affiliate')??0}}</div>
                    <div class="subtitle ">{{__('messages.affiliate_already_won')}}</div>
                </div>
            </div>
        </div>
        <div class="row" id="printableArea">

            <div class="col-lg-4">
                <!-- Card -->
                <div class="card">
                    <!-- Header -->
                    <div class="card-header">
                        <h4 class="card-header-title">
                            <span class="card-header-icon">
                                <i class="tio-user"></i>
                            </span>
                            <span>{{$customer['f_name'].' '.$customer['l_name']}}</span>
                        </h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    @if($customer)
                        <div class="card-body">
                            <div class="customer--information-single media align-items-center" href="javascript:">
                                <div class="avatar avatar-circle">
                                    <img class="avatar-img" onerror="this.src='{{my_asset('assets/admin/img/160x160/img1.jpg')}}'" src="{{my_asset('storage/app/public/profile/'.$customer->image)}}" alt="Image Description">
                                </div>
                                <div class="media-body">
                                    <ul class="list-unstyled m-0">
                                        <li class="pb-1">
                                            <i class="tio-email mr-2"></i>
                                            {{$customer['email']}}
                                        </li>
                                        <li class="pb-1">
                                            <i class="tio-call-talking-quiet mr-2"></i>
                                            {{$customer['phone']}}
                                        </li>
                                        <li class="pb-1">
                                            <i class="tio-shopping-basket-outlined mr-2"></i>
                                            {{$customer->order_count}} {{translate('messages.orders')}}
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <hr>


                            @foreach($customer->addresses as $address)
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5>{{translate('messages.addresses')}}</h5>
                                </div>
                                <ul class="list-unstyled list-unstyled-py-2">
                                    <li>
                                        <i class="tio-tab mr-2"></i>
                                        {{$address['address_type']}}
                                    </li>
                                    @if($address['contact_person_umber'])
                                        <li>
                                            <i class="tio-android-phone-vs mr-2"></i>
                                            {{$address['contact_person_number']}}
                                        </li>
                                    @endif
                                    <li>
                                        <a target="_blank" href="http://maps.google.com/maps?z=12&t=m&q=loc:{{$address['latitude']}}+{{$address['longitude']}}" class="text--hover">
                                            <i class="tio-poi mr-2"></i>
                                            {{$address['address']}}
                                        </a>
                                    </li>
                                </ul>
                                <hr>
                            @endforeach

                        </div>
                    @endif
                    <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>
        </div>

    </div>
@endsection

