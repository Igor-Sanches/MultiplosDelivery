@extends('layouts.admin.app')

@section('title', translate('business_setup'))


@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-header-title mr-3">
                <span class="page-header-icon">
                    <img src="{{ my_asset('assets/admin/img/business.png') }}" class="w--26" alt="">
                </span>
                <span>
                    {{ translate('messages.business') }} {{ translate('messages.setup') }}
                </span>
            </h1>
        </div>
        <!-- End Page Header -->
        <div class="card mb-3">
            <div class="card-body">
                <div
                    class="maintainance-mode-toggle-bar d-flex flex-wrap justify-content-between border border-primary rounded align-items-center p-2">
                    @php($config = \App\CentralLogics\Helpers::get_business_settings('maintenance_mode'))
                    <h5 class="text-capitalize m-0 text--info">
                        <i class="tio-settings-outlined"></i>
                        {{ translate('messages.maintenance_mode') }}
                    </h5>
                    <label class="toggle-switch toggle-switch-sm">
                        <input type="checkbox" class="status toggle-switch-input" onclick="maintenance_mode()"
                            {{ isset($config) && $config ? 'checked' : '' }}>
                        <span class="toggle-switch-label text mb-0">
                            <span class="toggle-switch-indicator"></span>
                        </span>
                    </label>
                </div>
                <div class="mt-2">

                    {{ translate('messages.maintainance_txt') }}
                </div>
            </div>
        </div>
        <form action="{{ route('admin.business-settings.update-setup') }}" method="post" enctype="multipart/form-data">
            @csrf
            @php($name = \App\Models\BusinessSetting::where('key', 'business_name')->first())

            <div class="row g-3">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title"> <span class="card-header-icon mr-2"><i class="tio-user"></i></span>
                                <span>{{ translate('genaral_information') }}</span></h4>
                        </div>
                        <div class="card-body">
                            <div class="row g-3 mb-0">
                                <div class="col-md-4">
                                    <div class="form-group mb-0">
                                        <label class="form-label"
                                            for="exampleFormControlInput1">{{ translate('messages.business') }}
                                            {{ translate('messages.name') }}</label>
                                        <input type="text" name="store_name" value="{{ $name->value ?? '' }}"
                                            class="form-control" placeholder="{{ translate('messages.new_business') }}"
                                            required>
                                    </div>
                                </div>
                                @php($phone = \App\Models\BusinessSetting::where('key', 'phone')->first())
                                <div class="col-md-4">
                                    <div class="form-group mb-0">
                                        <label class="form-label"
                                            for="exampleFormControlInput1">{{ translate('messages.phone') }}</label>
                                        <input type="tel" value="{{ $phone->value ?? '' }}" name="phone"
                                            class="form-control" placeholder="" required>
                                    </div>
                                </div>
                                @php($email = \App\Models\BusinessSetting::where('key', 'email_address')->first())
                                <div class="col-md-4">
                                    <div class="form-group mb-0">
                                        <label class="form-label"
                                            for="exampleFormControlInput1">{{ translate('messages.email') }}</label>
                                        <input type="email" value="{{ $email->value ?? '' }}" name="email"
                                            class="form-control" placeholder="" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-3 mt-0">
                                <div class="col-md-6">
                                    @php($address = \App\Models\BusinessSetting::where('key', 'address')->first())
                                    <div class="form-group">
                                        <label class="form-label"
                                            for="exampleFormControlInput1">{{ translate('messages.address') }}</label>
                                        <textarea type="text" id="address" name="address" class="form-control" placeholder="" rows="1" required>{{ $address->value ?? '' }}</textarea>
                                    </div>

                                    @php($footer_text = \App\Models\BusinessSetting::where('key', 'footer_text')->first())
                                    <div class="form-group">
                                        <label class="form-label"
                                            for="exampleFormControlInput1">{{ translate('messages.footer') }}
                                            {{ translate('messages.text') }}</label>
                                        <textarea type="text" value="" name="footer_text" class="form-control h--45"
                                            placeholder="{{ translate('messages.ex_Footer_Text') }}" required>{{ $footer_text->value ?? '' }}</textarea>
                                    </div>
                                    @php($default_location = \App\Models\BusinessSetting::where('key', 'default_location')->first())
                                    @php($default_location = $default_location->value ? json_decode($default_location->value, true) : 0)
                                    <div class="form-group">
                                        <label class="form-label text-capitalize"
                                            for="latitude">{{ translate('messages.latitude') }}<span
                                                class="form-label-secondary" data-toggle="tooltip" data-placement="right"
                                                data-original-title="{{ translate('messages.click_on_the_map_select_your_defaul_location') }}"><img
                                                    src="{{ my_asset('/assets/admin/img/info-circle.svg') }}"
                                                    alt="{{ translate('messages.click_on_the_map_select_your_defaul_location') }}"></span></label>
                                        <input type="text" id="latitude" name="latitude" class="form-control"
                                            placeholder="{{ translate('messages.Ex:') }} -94.22213"
                                            value="{{ $default_location ? $default_location['lat'] : 0 }}" required
                                            readonly>
                                    </div>
                                    <div class="form-group mb-0">
                                        <label class="form-label text-capitalize"
                                            for="longitude">{{ translate('messages.longitude') }}<span
                                                class="form-label-secondary" data-toggle="tooltip" data-placement="right"
                                                data-original-title="{{ translate('messages.click_on_the_map_select_your_defaul_location') }}"><img
                                                    src="{{ my_asset('/assets/admin/img/info-circle.svg') }}"
                                                    alt="{{ translate('messages.click_on_the_map_select_your_defaul_location') }}"></span></label>
                                        <input type="text" name="longitude" class="form-control"
                                            placeholder="{{ translate('messages.Ex:') }} 103.344322" id="longitude"
                                            value="{{ $default_location ? $default_location['lng'] : 0 }}" required
                                            readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <input id="pac-input" class="controls rounded" data-toggle="tooltip"
                                        data-placement="right"
                                        data-original-title="{{ translate('messages.search_your_location_here') }}"
                                        type="text" placeholder="{{ translate('messages.search_here') }}" />
                                    <div id="location_map_canvas" class="overflow-hidden rounded"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title m-0 d-flex align-items-center"> <span class="card-header-icon mr-2"><i
                                        class="tio-money"></i></span>
                                <span>{{ translate('commission_and_reference') }}</span></h4>
                        </div>

                        <div class="card-body">
                            <div class="row g-3">
                                <div class="col-sm-6 col-lg-4">
                                    @php($admin_commission = \App\Models\BusinessSetting::where('key', 'admin_commission')->first())
                                    <div class="form-group mb-0">
                                        <label class="form-label text-capitalize"
                                               for="admin_commission">{{ translate('messages.default_admin_commission') }}</label>
                                        <input type="text" name="admin_commission" class="form-control"
                                               id="admin_commission"
                                               pattern="^\d*(\.\d{0,2})?$"
                                               value="{{ $admin_commission ? $admin_commission->value : 0 }}"
                                               min="0" max="100" required>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($cashback_default = \App\Models\BusinessSetting::where('key', 'cashback_default')->first())
                                    <div class="form-group mb-0">
                                        <label class="form-label text-capitalize"
                                               for="cashback_default">{{ translate('messages.cashback_default') }}</label>
                                        <input type="text" name="cashback_default" class="form-control"
                                               id="cashback_default"
                                               pattern="^\d*(\.\d{0,2})?$"
                                               value="{{ $cashback_default ? $cashback_default->value : 0 }}"
                                               min="0" max="100" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-5">
                                <div class="col-sm-6 col-lg-4">
                                    @php($single_referral_bonus = \App\Models\BusinessSetting::where('key', 'single_referral_bonus')->first())
                                    @php($single_referral_bonus = $single_referral_bonus ? $single_referral_bonus->value : 0)
                                    <div class="form-group mb-0">
                                        <label class="form-label text-capitalize"
                                               for="admin_commission">{{ translate('messages.single_referral_bonus') }}</label>
                                        <label
                                            class="toggle-switch h--45px toggle-switch-sm d-flex justify-content-between border rounded px-3 py-0 form-control">
                                            <span class="pr-1 d-flex align-items-center switch--label">
                                                <span class="line--limit-1">
                                                    @lang('messages.single_referral_bonus')
                                                </span>
                                            </span>
                                            <input type="checkbox" class="toggle-switch-input" value="1"
                                                   name="single_referral_bonus" id="single_referral_bonus"
                                                {{ $single_referral_bonus == 1 ? 'checked' : '' }}>
                                            <span class="toggle-switch-label text">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>

                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($money_referral_bonus = \App\Models\BusinessSetting::where('key', 'money_referral_bonus')->first())
                                    <div class="form-group mb-0">
                                        <label class="form-label text-capitalize"
                                               for="admin_commission">{{ translate('messages.money_referral_bonus') }}</label>
                                        <input type="text" name="money_referral_bonus" class="form-control"
                                               id="money_referral_bonus"
                                               pattern="^\d*(\.\d{0,2})?$"
                                               value="{{ $money_referral_bonus ? $money_referral_bonus->value : 0 }}"
                                               min="0" max="100" required>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($percentage_referral_bonus = \App\Models\BusinessSetting::where('key', 'percentage_referral_bonus')->first())
                                    <div class="form-group mb-0">
                                        <label class="form-label text-capitalize"
                                               for="admin_commission">{{ translate('messages.percentage_referral_bonus') }}</label>
                                        <input type="text" name="percentage_referral_bonus" class="form-control"
                                               id="percentage_referral_bonus"
                                               pattern="^\d*(\.\d{0,2})?$"
                                               value="{{ $percentage_referral_bonus ? $percentage_referral_bonus->value : 0 }}"
                                               min="0" max="100" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title m-0 d-flex align-items-center"> <span class="card-header-icon mr-2"><i
                                        class="tio-neighborhood"></i></span>
                                <span>{{ translate('business_information') }}</span></h4>
                        </div>
                        <div class="card-body">
                            <div class="row g-3 mb-0">
                                <div class="col-sm-6 col-lg-4">
                                    @php($logo = \App\Models\BusinessSetting::where('key', 'logo')->first())
                                    @php($logo = $logo->value ?? '')
                                    <div class="d-flex flex-column h-100">
                                        <label class="form-label mb-0">
                                            {{ translate('messages.logo') }}
                                            <small class="text-danger">* ( {{ translate('messages.ratio') }} 300x100
                                                )</small>
                                        </label>
                                        <center class="py-3 my-auto">
                                            <img class="img--vertical" id="viewer"
                                                onerror="this.src='{{ my_asset('assets/admin/img/160x160/img2.jpg') }}'"
                                                src="{{ my_asset('storage/app/public/business/' . $logo) }}"
                                                alt="logo image" />
                                        </center>
                                        <div class="custom-file">
                                            <input type="file" name="logo" id="customFileEg1"
                                                class="custom-file-input"
                                                accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                            <label class="custom-file-label"
                                                for="customFileEg1">{{ translate('messages.choose') }}
                                                {{ translate('messages.file') }}</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($icon = \App\Models\BusinessSetting::where('key', 'icon')->first())
                                    @php($icon = $icon->value ?? '')
                                    <div class="d-flex flex-column h-100">
                                        <label class="form-label mb-0">
                                            {{ translate('messages.Fav Icon') }}
                                            <small class="text-danger">* ( {{ translate('messages.ratio') }} 200x200
                                                )</small>
                                        </label>
                                        <center class="py-3 my-auto">
                                            <img class="img--110" id="iconViewer"
                                                onerror="this.src='{{ my_asset('assets/admin/img/160x160/img2.jpg') }}'"
                                                src="{{ my_asset('storage/app/public/business/' . $icon) }}"
                                                alt="Fav icon" />
                                        </center>
                                        <div class="custom-file">
                                            <input type="file" name="icon" id="favIconUpload"
                                                class="custom-file-input"
                                                accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                            <label class="custom-file-label"
                                                for="favIconUpload">{{ translate('messages.choose') }}
                                                {{ translate('messages.file') }}</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-3 mt-0">


                                <div class="col-sm-6 col-lg-4">
                                    @php($digit_after_decimal_point = \App\Models\BusinessSetting::where('key', 'digit_after_decimal_point')->first())
                                    <div class="form-group mb-0">
                                        <label class="form-label text-capitalize"
                                            for="digit_after_decimal_point">{{ translate('messages.Digit after decimal point') }}</label>
                                        <input type="number" name="digit_after_decimal_point" class="form-control"
                                            id="digit_after_decimal_point"
                                            value="{{ $digit_after_decimal_point ? $digit_after_decimal_point->value : 0 }}"
                                            min="0" max="4" required>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($delivery_charge_comission = \App\Models\BusinessSetting::where('key', 'delivery_charge_comission')->first())
                                    <div class="form-group">
                                        <label class="input-label text-capitalize d-flex alig-items-center"
                                        for="admin_comission_in_delivery_charge">{{translate('Admin Comission in Delivery Charge')}}</label>
                                            <input type="number" name="admin_comission_in_delivery_charge" class="form-control" id="admin_comission_in_delivery_charge"
                                            min="0" max="100" step="0.01" value="{{ $delivery_charge_comission ? $delivery_charge_comission->value: 0 }}">
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    @php($opening_time = \App\Models\BusinessSetting::where('key', 'opening_time')->first())
                                    <div class="form-group">
                                        <label class="input-label text-capitalize d-flex alig-items-center"
                                        for="opening_time">{{translate('Opening Time')}}</label>
                                            <input type="time" value="{{ $opening_time ? $opening_time->value: '' }}" name="opening_time" class="form-control" id="opening_time">
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    @php($closing_time = \App\Models\BusinessSetting::where('key', 'closing_time')->first())
                                    <div class="form-group">
                                        <label class="input-label text-capitalize d-flex alig-items-center"
                                        for="closing_time">{{translate('Closing Time')}}</label>
                                        <input type="time" value="{{ $closing_time ? $closing_time->value: '' }}" name="closing_time" class="form-control" id="closing_time">
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    @php($opening_day = \App\Models\BusinessSetting::where('key', 'opening_day')->first())
                                    @php($opening_day = $opening_day ? $opening_day->value : '')
                                    <div class="form-group mb-0">
                                        <label
                                            class="form-label text-capitalize">{{ translate('messages.opening_day') }}</label>
                                        <select name="opening_day" class="form-control">
                                            <option value="saturday" {{ $opening_day == 'saturday' ? 'selected' : '' }}>
                                                {{ translate('messages.saturday') }}
                                            </option>
                                            <option value="sunday" {{ $opening_day == 'sunday' ? 'selected' : '' }}>
                                                {{ translate('messages.sunday') }}
                                            </option>
                                            <option value="monday" {{ $opening_day == 'monday' ? 'selected' : '' }}>
                                                {{ translate('messages.monday') }}
                                            </option>
                                            <option value="tuesday" {{ $opening_day == 'tuesday' ? 'selected' : '' }}>
                                                {{ translate('messages.tuesday') }}
                                            </option>
                                            <option value="wednesday" {{ $opening_day == 'wednesday' ? 'selected' : '' }}>
                                                {{ translate('messages.wednesday') }}
                                            </option>
                                            <option value="thrusday" {{ $opening_day == 'thrusday' ? 'selected' : '' }}>
                                                {{ translate('messages.thrusday') }}
                                            </option>
                                            <option value="friday" {{ $opening_day == 'friday' ? 'selected' : '' }}>
                                                {{ translate('messages.friday') }}
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    @php($closing_day = \App\Models\BusinessSetting::where('key', 'closing_day')->first())
                                    @php($closing_day = $closing_day ? $closing_day->value : '')
                                    <div class="form-group mb-0">
                                        <label
                                            class="form-label text-capitalize">{{ translate('messages.closing_day') }}</label>
                                        <select name="closing_day" class="form-control">
                                            <option value="saturday" {{ $closing_day == 'saturday' ? 'selected' : '' }}>
                                                {{ translate('messages.saturday') }}
                                            </option>
                                            <option value="sunday" {{ $closing_day == 'sunday' ? 'selected' : '' }}>
                                                {{ translate('messages.sunday') }}
                                            </option>
                                            <option value="monday" {{ $closing_day == 'monday' ? 'selected' : '' }}>
                                                {{ translate('messages.monday') }}
                                            </option>
                                            <option value="tuesday" {{ $closing_day == 'tuesday' ? 'selected' : '' }}>
                                                {{ translate('messages.tuesday') }}
                                            </option>
                                            <option value="wednesday" {{ $closing_day == 'wednesday' ? 'selected' : '' }}>
                                                {{ translate('messages.wednesday') }}
                                            </option>
                                            <option value="thrusday" {{ $closing_day == 'thrusday' ? 'selected' : '' }}>
                                                {{ translate('messages.thrusday') }}
                                            </option>
                                            <option value="friday" {{ $closing_day == 'friday' ? 'selected' : '' }}>
                                                {{ translate('messages.friday') }}
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title m-0 d-flex align-items-center"> <span class="card-header-icon mr-2"><i
                                        class="tio-neighborhood"></i></span>
                                <span>{{ translate('business_setting') }}</span></h4>
                        </div>
                        <div class="card-body">
                            <div class="row g-3">
                                <div class="col-sm-6 col-lg-4">
                                    @php($schedule_order = \App\Models\BusinessSetting::where('key', 'schedule_order')->first())
                                    @php($schedule_order = $schedule_order ? $schedule_order->value : 0)
                                    <div class="form-group mb-0">
                                        <label
                                            class="toggle-switch h--45px toggle-switch-sm d-flex justify-content-between border rounded px-3 py-0 form-control">
                                            <span class="pr-1 d-flex align-items-center switch--label">
                                                <span class="line--limit-1">
                                                    {{ translate('messages.scheduled') }}
                                                    {{ translate('messages.orders') }}
                                                </span>
                                                <span class="form-label-secondary text-danger d-flex"
                                                    data-toggle="tooltip" data-placement="right"
                                                    data-original-title="{{ translate('After activating this field, customers are able to place scheduled orders.') }}"><img
                                                        src="{{ my_asset('/assets/admin/img/info-circle.svg') }}"
                                                        alt="{{ translate('messages.customer_varification_toggle') }}"> *
                                                </span>
                                            </span>
                                            <input type="checkbox" class="toggle-switch-input" value="1"
                                                name="schedule_order" id="schedule_order"
                                                {{ $schedule_order == 1 ? 'checked' : '' }}>
                                            <span class="toggle-switch-label text">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>

                                        {{-- <div class="input-group input-group-md-down-break">
                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="1" name="schedule_order"
                                                        id="schedule_order" {{ $schedule_order == 1 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="schedule_order">{{ translate('messages.on') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->

                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="0" name="schedule_order"
                                                        id="schedule_order2" {{ $schedule_order == 0 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="schedule_order2">{{ translate('messages.off') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->
                                        </div> --}}
                                    </div>
                                </div>
                                {{-- <div class="col-sm-6 col-lg-4">
                                    @php($order_confirmation_model = \App\Models\BusinessSetting::where('key', 'order_confirmation_model')->first())
                                    @php($order_confirmation_model = $order_confirmation_model ? $order_confirmation_model->value : 'deliveryman')
                                    <div class="form-group mb-0">

                                        <label class="toggle-switch h--45px toggle-switch-sm d-flex justify-content-between border rounded px-3 py-0 form-control">
                                            <span class="pr-1 d-flex align-items-center switch--label">
                                                <span class="line--limit-1">
                                                    {{ translate('messages.order_confirmation_model') }}
                                                </span>
                                                <span class="form-label-secondary text-danger d-flex" data-toggle="tooltip" data-placement="right" data-original-title="{{ translate('messages.order_confirmation_model_hint') }}"><img src="{{ my_asset('/assets/admin/img/info-circle.svg') }}" alt="{{ translate('messages.order_confirmation_model_hint') }}"> * </span>
                                            </span>
                                            <input type="checkbox" class="toggle-switch-input" value="store"
                                            name="order_confirmation_model" id="order_confirmation_model"
                                            {{ $order_confirmation_model == 'store' ? 'checked' : '' }}>
                                            <span class="toggle-switch-label text">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label> --}}

                                {{-- <div class="input-group input-group-md-down-break">
                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="store"
                                                        name="order_confirmation_model" id="order_confirmation_model"
                                                        {{ $order_confirmation_model == 'store' ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="order_confirmation_model">{{ translate('messages.store') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->

                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="deliveryman"
                                                        name="order_confirmation_model" id="order_confirmation_model2"
                                                        {{ $order_confirmation_model == 'deliveryman' ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="order_confirmation_model2">{{ translate('messages.deliveryman') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->
                                        </div> --}}
                                {{-- </div>
                                </div> --}}
                                <div class="col-sm-6 col-lg-4">
                                    @php($dm_tips_status = \App\Models\BusinessSetting::where('key', 'dm_tips_status')->first())
                                    @php($dm_tips_status = $dm_tips_status ? $dm_tips_status->value : 'deliveryman')
                                    <div class="form-group mb-0">

                                        <label
                                            class="toggle-switch h--45px toggle-switch-sm d-flex justify-content-between border rounded px-3 py-0 form-control">
                                            <span class="pr-1 d-flex align-items-center switch--label">
                                                <span class="line--limit-1">
                                                    {{ translate('dm_tips_status') }}
                                                </span>
                                                <span class="form-label-secondary text-danger d-flex"
                                                    data-toggle="tooltip" data-placement="right"
                                                    data-original-title="{{ translate('If this option is enabled, the Delivery men Tip option will show on the user app & web app during order placement.') }}"><img
                                                        src="{{ my_asset('/assets/admin/img/info-circle.svg') }}"
                                                        alt="{{ translate('messages.dm_tips_model_hint') }}"> * </span>
                                            </span>
                                            <input type="checkbox" class="toggle-switch-input" value="1"
                                                name="dm_tips_status" id="dm_tips_status"
                                                {{ $dm_tips_status == '1' ? 'checked' : '' }}>
                                            <span class="toggle-switch-label text">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>

                                        {{-- <div class="input-group input-group-md-down-break">
                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="1"
                                                        name="dm_tips_status" id="dm_tips_status"
                                                        {{ $dm_tips_status == '1' ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="dm_tips_status">{{ translate('on') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->
                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="0"
                                                        name="dm_tips_status" id="dm_tips_manage2"
                                                        {{ $dm_tips_status == '0' ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="dm_tips_manage2">{{ translate('off') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->
                                        </div> --}}
                                    </div>
                                </div>
                                {{-- <div class="col-sm-6 col-lg-4">
                                    @php($canceled_by_store = \App\Models\BusinessSetting::where('key', 'canceled_by_store')->first())
                                    @php($canceled_by_store = $canceled_by_store ? $canceled_by_store->value : 0)
                                    <div class="form-group mb-0">

                                        <label class="toggle-switch h--45px toggle-switch-sm d-flex justify-content-between border rounded px-3 py-0 form-control">
                                            <span class="pr-1 d-flex align-items-center switch--label">
                                                <span class="line--limit-1">
                                                    {{ translate('store_cancellation_toggle') }}
                                                </span>
                                                <span class="form-label-secondary text-danger d-flex" data-toggle="tooltip" data-placement="right" data-original-title="{{ translate('messages.store_cancellation_toggle') }}"><img src="{{ my_asset('/assets/admin/img/info-circle.svg') }}" alt="{{ translate('messages.store_cancellation_toggle') }}"> * </span>
                                            </span>
                                            <input type="checkbox" class="toggle-switch-input" value="1"
                                            name="canceled_by_store" id="canceled_by_store"
                                            {{ $canceled_by_store == 1 ? 'checked' : '' }}>
                                            <span class="toggle-switch-label text">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label> --}}

                                {{-- <div class="input-group input-group-md-down-break">
                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="1"
                                                        name="canceled_by_store" id="canceled_by_store"
                                                        {{ $canceled_by_store == 1 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="canceled_by_store">{{ translate('messages.yes') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->

                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="0"
                                                        name="canceled_by_store" id="canceled_by_store2"
                                                        {{ $canceled_by_store == 0 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="canceled_by_store2">{{ translate('messages.no') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->
                                        </div> --}}
                                {{-- </div>
                                </div> --}}
                                {{-- <div class="col-sm-6 col-lg-4">
                                    @php($canceled_by_deliveryman = \App\Models\BusinessSetting::where('key', 'canceled_by_deliveryman')->first())
                                    @php($canceled_by_deliveryman = $canceled_by_deliveryman ? $canceled_by_deliveryman->value : 0)
                                    <div class="form-group mb-0">

                                        <label class="toggle-switch h--45px toggle-switch-sm d-flex justify-content-between border rounded px-3 py-0 form-control">
                                            <span class="pr-1 d-flex align-items-center switch--label">
                                                <span class="line--limit-1">
                                                    {{ translate('deliveryman_cancellation_toggle') }}
                                                </span>
                                                <span class="form-label-secondary text-danger d-flex" data-toggle="tooltip" data-placement="right" data-original-title="{{ translate('messages.deliveryman_cancellation_toggle') }}"><img src="{{ my_asset('/assets/admin/img/info-circle.svg') }}" alt="{{ translate('messages.deliveryman_cancellation_toggle') }}"> * </span>
                                            </span>
                                            <input type="checkbox" class="toggle-switch-input" value="1"
                                            name="canceled_by_deliveryman" id="canceled_by_deliveryman"
                                            {{ $canceled_by_deliveryman == 1 ? 'checked' : '' }}>
                                            <span class="toggle-switch-label text">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label> --}}

                                {{-- <div class="input-group input-group-md-down-break">
                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="1"
                                                        name="canceled_by_deliveryman" id="canceled_by_deliveryman"
                                                        {{ $canceled_by_deliveryman == 1 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="canceled_by_deliveryman">{{ translate('messages.yes') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->

                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="0"
                                                        name="canceled_by_deliveryman" id="canceled_by_deliveryman2"
                                                        {{ $canceled_by_deliveryman == 0 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="canceled_by_deliveryman2">{{ translate('messages.no') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->
                                        </div> --}}
                                {{-- </div>
                                </div> --}}
                                <div class="col-sm-6 col-lg-4">
                                    @php($show_dm_earning = \App\Models\BusinessSetting::where('key', 'show_dm_earning')->first())
                                    @php($show_dm_earning = $show_dm_earning ? $show_dm_earning->value : 0)
                                    <div class="form-group mb-0">

                                        <label
                                            class="toggle-switch h--45px toggle-switch-sm d-flex justify-content-between border rounded px-3 py-0 form-control">
                                            <span class="pr-1 d-flex align-items-center switch--label">
                                                <span class="line--limit-1">
                                                    {{ translate('show_earning_for_each_order') }}
                                                </span>
                                                <span class="form-label-secondary text-danger d-flex"
                                                    data-toggle="tooltip" data-placement="right"
                                                    data-original-title="{{ translate('Se este campo estiver habilitado, o entregador poderá visualizar os ganhos ao aceitar o pedido na página de solicitação de pedido.') }}"><img
                                                        src="{{ my_asset('/assets/admin/img/info-circle.svg') }}"
                                                        alt="{{ translate('messages.customer_varification_toggle') }}"> *
                                                </span>
                                            </span>
                                            <input type="checkbox" class="toggle-switch-input" value="1"
                                                name="show_dm_earning" id="show_dm_earning"
                                                {{ $show_dm_earning == 1 ? 'checked' : '' }}>
                                            <span class="toggle-switch-label text">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>

                                        {{-- <div class="input-group input-group-md-down-break">
                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="1"
                                                        name="show_dm_earning" id="show_dm_earning"
                                                        {{ $show_dm_earning == 1 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="show_dm_earning">{{ translate('messages.yes') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->

                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="0"
                                                        name="show_dm_earning" id="show_dm_earning2"
                                                        {{ $show_dm_earning == 0 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="show_dm_earning2">{{ translate('messages.no') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->
                                        </div> --}}
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($admin_order_notification = \App\Models\BusinessSetting::where('key', 'admin_order_notification')->first())
                                    @php($admin_order_notification = $admin_order_notification ? $admin_order_notification->value : 0)
                                    <div class="form-group mb-0">

                                        <label
                                            class="toggle-switch h--45px toggle-switch-sm d-flex justify-content-between border rounded px-3 py-0 form-control">
                                            <span class="pr-1 d-flex align-items-center switch--label">
                                                <span class="line--limit-1">
                                                    {{ translate('messages.admin') }} {{ translate('messages.order') }}
                                                    {{ translate('messages.notification') }}
                                                </span>
                                                <span class="form-label-secondary text-danger d-flex"
                                                    data-toggle="tooltip" data-placement="right"
                                                    data-original-title="{{ translate('Turning on this, admin will get a popup notification with sound for all orders.') }}"><img
                                                        src="{{ my_asset('/assets/admin/img/info-circle.svg') }}"
                                                        alt="{{ translate('messages.customer_varification_toggle') }}"> *
                                                </span>
                                            </span>
                                            <input type="checkbox" class="toggle-switch-input" value="1"
                                                name="admin_order_notification" id="aon1"
                                                {{ $admin_order_notification == 1 ? 'checked' : '' }}>
                                            <span class="toggle-switch-label text">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>


                                        {{-- <div class="input-group input-group-md-down-break">
                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="1"
                                                        name="admin_order_notification" id="aon1"
                                                        {{ $admin_order_notification == 1 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="aon1">{{ translate('messages.on') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->

                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="0"
                                                        name="admin_order_notification" id="aon2"
                                                        {{ $admin_order_notification == 0 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="aon2">{{ translate('messages.off') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->
                                        </div> --}}
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($ev = \App\Models\BusinessSetting::where('key', 'customer_verification')->first())
                                    @php($ev = $ev ? $ev->value : 0)
                                    <div class="form-group mb-0">

                                        <label
                                            class="toggle-switch h--45px toggle-switch-sm d-flex justify-content-between border rounded px-3 py-0 form-control">
                                            <span class="pr-1 d-flex align-items-center switch--label">
                                                <span class="line--limit-1">
                                                    {{ translate('messages.customer') }}
                                                    {{ translate('messages.verification') }}
                                                </span>
                                                <span class="form-label-secondary text-danger d-flex"
                                                    data-toggle="tooltip" data-placement="right"
                                                    data-original-title="{{ translate('messages.customer_varification_toggle') }}"><img
                                                        src="{{ my_asset('/assets/admin/img/info-circle.svg') }}"
                                                        alt="{{ translate('messages.customer_varification_toggle') }}"> *
                                                </span>
                                            </span>
                                            <input type="checkbox" class="toggle-switch-input" value="1"
                                                name="customer_verification" id="ev1"
                                                {{ $ev == 1 ? 'checked' : '' }}>
                                            <span class="toggle-switch-label text">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>


                                        {{-- <div class="input-group input-group-md-down-break">
                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="1"
                                                        name="customer_verification" id="ev1" {{ $ev == 1 ? 'checked' : '' }}>
                                                    <label class="custom-control-label" for="ev1">{{ translate('messages.on') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->

                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="0"
                                                        name="customer_verification" id="ev2" {{ $ev == 0 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="ev2">{{ translate('messages.off') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->
                                        </div> --}}
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($odc = \App\Models\BusinessSetting::where('key', 'order_delivery_verification')->first())
                                    @php($odc = $odc ? $odc->value : 0)
                                    <div class="form-group mb-0">

                                        <label
                                            class="toggle-switch h--45px toggle-switch-sm d-flex justify-content-between border rounded px-3 py-0 form-control">
                                            <span class="pr-1 d-flex align-items-center switch--label">
                                                <span class="line--limit-1">
                                                    {{ translate('messages.order') }}
                                                    {{ translate('messages.delivery') }}
                                                    {{ translate('messages.verification') }}
                                                </span>
                                                <span class="form-label-secondary text-danger d-flex"
                                                    data-toggle="tooltip" data-placement="right"
                                                    data-original-title="{{ translate('If this field is active, customers have to provide a 4-digit code to the delivery man to deliver an order successfully. Customers will get this code in order details.') }}"><img
                                                        src="{{ my_asset('/assets/admin/img/info-circle.svg') }}"
                                                        alt="{{ translate('messages.order_varification_toggle') }}"> *
                                                </span>
                                            </span>
                                            <input type="checkbox" class="toggle-switch-input" value="1"
                                                name="odc" id="odc1" {{ $odc == 1 ? 'checked' : '' }}>
                                            <span class="toggle-switch-label text">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>


                                        {{-- <div class="input-group input-group-md-down-break">
                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="1" name="odc" id="odc1"
                                                        {{ $odc == 1 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="odc1">{{ translate('messages.on') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->

                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="0" name="odc" id="odc2"
                                                        {{ $odc == 0 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="odc2">{{ translate('messages.off') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->
                                        </div> --}}
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($vnv = \App\Models\BusinessSetting::where('key', 'toggle_veg_non_veg')->first())
                                    @php($vnv = $vnv ? $vnv->value : 0)
                                    <div class="form-group mb-0">

                                        <label
                                            class="toggle-switch h--45px toggle-switch-sm d-flex justify-content-between border rounded px-3 py-0 form-control">
                                            <span class="pr-1 d-flex align-items-center switch--label">
                                                <span class="line--limit-1">
                                                    {{ translate('messages.veg') }}/{{ translate('messages.non_veg') }}
                                                </span>
                                                <span class="form-label-secondary text-danger d-flex"
                                                    data-toggle="tooltip" data-placement="right"
                                                    data-original-title="{{ translate('Quando este campo está ativo, as lojas e os clientes podem ver a etiqueta veg/non-veg.') }}"><img
                                                        src="{{ my_asset('/assets/admin/img/info-circle.svg') }}"
                                                        alt="{{ translate('messages.veg_non_veg') }}"> * </span>
                                            </span>
                                            <input type="checkbox" class="toggle-switch-input" value="1"
                                                name="vnv" id="vnv1" {{ $vnv == 1 ? 'checked' : '' }}>
                                            <span class="toggle-switch-label text">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>

                                        {{-- <div class="input-group input-group-md-down-break">
                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="1" name="vnv" id="vnv1"
                                                        {{ $vnv == 1 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="vnv1">{{ translate('messages.on') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->

                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="0" name="vnv" id="vnv2"
                                                        {{ $vnv == 0 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="vnv2">{{ translate('messages.off') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->
                                        </div> --}}
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($store_self_registration = \App\Models\BusinessSetting::where('key', 'toggle_store_registration')->first())
                                    @php($store_self_registration = $store_self_registration ? $store_self_registration->value : 0)
                                    <div class="form-group mb-0">

                                        <label
                                            class="toggle-switch h--45px toggle-switch-sm d-flex justify-content-between border rounded px-3 py-0 form-control">
                                            <span class="pr-1 d-flex align-items-center switch--label">
                                                <span class="line--limit-1">
                                                    {{ translate('messages.store_self_registration') }}
                                                </span>
                                                <span class="form-label-secondary text-danger d-flex"
                                                    data-toggle="tooltip" data-placement="right"
                                                    data-original-title="{{ translate('If this field is active, stores can register themself using the store app, user app, or website.') }}"><img
                                                        src="{{ my_asset('/assets/admin/img/info-circle.svg') }}"
                                                        alt="{{ translate('messages.store_self_registration') }}"> *
                                                </span>
                                            </span>
                                            <input type="checkbox" class="toggle-switch-input" value="1"
                                                name="store_self_registration" id="store_self_registration1"
                                                {{ $store_self_registration == 1 ? 'checked' : '' }}>
                                            <span class="toggle-switch-label text">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>

                                        {{-- <div class="input-group input-group-md-down-break">
                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="1"
                                                        name="store_self_registration" id="store_self_registration1"
                                                        {{ $store_self_registration == 1 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="store_self_registration1">{{ translate('messages.on') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->

                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="0"
                                                        name="store_self_registration" id="store_self_registration2"
                                                        {{ $store_self_registration == 0 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="store_self_registration2">{{ translate('messages.off') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->
                                        </div> --}}
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($dm_self_registration = \App\Models\BusinessSetting::where('key', 'toggle_dm_registration')->first())
                                    {{-- {{ dd($dm_self_registration) }} --}}
                                    @php($dm_self_registration = $dm_self_registration ? $dm_self_registration->value : 0)
                                    <div class="form-group mb-0">

                                        <label
                                            class="toggle-switch h--45px toggle-switch-sm d-flex justify-content-between border rounded px-3 py-0 form-control">
                                            <span class="pr-1 d-flex align-items-center switch--label">
                                                <span class="line--limit-1">
                                                    {{ translate('messages.dm_self_registration') }}
                                                </span>
                                                <span class="form-label-secondary text-danger d-flex"
                                                    data-toggle="tooltip" data-placement="right"
                                                    data-original-title="{{ translate('Quando este campo está ativo, os entregadores podem se cadastrar usando o aplicativo do entregador, aplicativo do usuário ou site.') }}"><img
                                                        src="{{ my_asset('/assets/admin/img/info-circle.svg') }}"
                                                        alt="{{ translate('messages.dm_self_registration') }}"> * </span>
                                            </span>
                                            <input type="checkbox" class="toggle-switch-input" value="1"
                                                name="dm_self_registration" id="dm_self_registration1"
                                                {{ $dm_self_registration == 1 ? 'checked' : '' }}>
                                            <span class="toggle-switch-label text">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>

                                        {{-- <div class="input-group input-group-md-down-break">
                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="1"
                                                        name="dm_self_registration" id="dm_self_registration1"
                                                        {{ $dm_self_registration == 1 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="dm_self_registration1">{{ translate('messages.on') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->

                                            <!-- Custom Radio -->
                                            <div class="form-control">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" class="custom-control-input" value="0"
                                                        name="dm_self_registration" id="dm_self_registration2"
                                                        {{ $dm_self_registration == 0 ? 'checked' : '' }}>
                                                    <label class="custom-control-label"
                                                        for="dm_self_registration2">{{ translate('messages.off') }}</label>
                                                </div>
                                            </div>
                                            <!-- End Custom Radio -->
                                        </div> --}}
                                    </div>
                                </div>
                                <div class="col-lg-4 col-sm-6">
                                    @php($order_confirmation_model = \App\Models\BusinessSetting::where('key', 'order_confirmation_model')->first())
                                    @php($order_confirmation_model = $order_confirmation_model ? $order_confirmation_model->value : 'deliveryman')
                                    <div class="form-group">
                                        <label class="input-label text-capitalize d-flex alig-items-center"><span
                                                class="line--limit-1">{{ translate('messages.order_confirmation_model') }}</span>
                                            <span class="input-label-secondary text--title" data-toggle="tooltip"
                                                data-placement="right"
                                                data-original-title="{{ translate('O modelo escolhido confirmará o pedido primeiro. Por exemplo, se você escolher o modelo de confirmação de entrega, os entregadores receberão os pedidos antes das lojas e confirmarão a entrega e após a confirmação dos entregadores, as lojas receberão o pedido para processamento.') }}">
                                                <i class="tio-info-outined"></i>
                                            </span></label>
                                        <div class="resturant-type-group border">
                                            <label class="form-check form--check mr-2 mr-md-4">
                                                <input class="form-check-input" type="radio" value="store"
                                                    name="order_confirmation_model" id="order_confirmation_model"
                                                    {{ $order_confirmation_model == 'store' ? 'checked' : '' }}>
                                                <span class="form-check-label">
                                                    {{ translate('messages.store') }}
                                                </span>
                                            </label>
                                            <label class="form-check form--check mr-2 mr-md-4">
                                                <input class="form-check-input" type="radio" value="deliveryman"
                                                    name="order_confirmation_model" id="order_confirmation_model2"
                                                    {{ $order_confirmation_model == 'deliveryman' ? 'checked' : '' }}>
                                                <span class="form-check-label">
                                                    {{ translate('messages.deliveryman') }}
                                                </span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-sm-6">
                                    @php($canceled_by_deliveryman = \App\Models\BusinessSetting::where('key', 'canceled_by_deliveryman')->first())
                                    @php($canceled_by_deliveryman = $canceled_by_deliveryman ? $canceled_by_deliveryman->value : 0)
                                    <div class="form-group">
                                        <label class="input-label text-capitalize d-flex alig-items-center"><span
                                                class="line--limit-1">{{ translate('Delivery Man can Cancel Order') }}</span>
                                            <span class="input-label-secondary text--title" data-toggle="tooltip"
                                                data-placement="right"
                                                data-original-title="{{ translate('Order cancellation is possible by the delivery person if "Yes" is chosen .') }}">
                                                <i class="tio-info-outined"></i>
                                            </span></label>
                                        <div class="resturant-type-group border">
                                            <label class="form-check form--check mr-2 mr-md-4">
                                                <input class="form-check-input" type="radio" value="1"
                                                    name="canceled_by_deliveryman" id="canceled_by_deliveryman"
                                                    {{ $canceled_by_deliveryman == 1 ? 'checked' : '' }}>
                                                <span class="form-check-label">
                                                    {{ translate('yes') }}
                                                </span>
                                            </label>
                                            <label class="form-check form--check mr-2 mr-md-4">
                                                <input class="form-check-input" type="radio" value="0"
                                                    name="canceled_by_deliveryman" id="canceled_by_deliveryman2"
                                                    {{ $canceled_by_deliveryman == 0 ? 'checked' : '' }}>
                                                <span class="form-check-label">
                                                    {{ translate('no') }}
                                                </span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-sm-6">
                                    @php($canceled_by_store = \App\Models\BusinessSetting::where('key', 'canceled_by_store')->first())
                                    @php($canceled_by_store = $canceled_by_store ? $canceled_by_store->value : 0)
                                    <div class="form-group">
                                        <label class="input-label text-capitalize d-flex alig-items-center"><span
                                                class="line--limit-1">{{ translate('store_can_cancel_order') }}
                                            </span><span class="input-label-secondary text--title" data-toggle="tooltip"
                                                data-placement="right"
                                                data-original-title="{{ translate('Order cancellation is possible by the store if "Yes" is chosen .') }}">
                                                <i class="tio-info-outined"></i>
                                            </span></label>
                                        <div class="resturant-type-group border">
                                            <label class="form-check form--check mr-2 mr-md-4">
                                                <input class="form-check-input" type="radio" value="1"
                                                    name="canceled_by_store" id="canceled_by_restaurant"
                                                    {{ $canceled_by_store == 1 ? 'checked' : '' }}>
                                                <span class="form-check-label">
                                                    {{ translate('yes') }}
                                                </span>
                                            </label>
                                            <label class="form-check form--check mr-2 mr-md-4">
                                                <input class="form-check-input" type="radio" value="0"
                                                    name="canceled_by_store" id="canceled_by_restaurant2"
                                                    {{ $canceled_by_store == 0 ? 'checked' : '' }}>
                                                <span class="form-check-label">
                                                    {{ translate('no') }}
                                                </span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($schedule_order_slot_duration = \App\Models\BusinessSetting::where('key', 'schedule_order_slot_duration')->first())
                                    <div class="form-group mb-0">
                                        <label class="form-label text-capitalize"
                                            for="schedule_order_slot_duration">{{ translate('messages.Schedule order slot duration') }}
                                            {{ translate('messages.minute') }}</label>
                                        <input type="number" name="schedule_order_slot_duration" class="form-control"
                                            id="schedule_order_slot_duration"
                                            value="{{ $schedule_order_slot_duration ? $schedule_order_slot_duration->value : 0 }}"
                                            min="0" required>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($free_delivery_over = \App\Models\BusinessSetting::where('key', 'free_delivery_over')->first())
                                    @php($free_delivery_over_status = \App\Models\BusinessSetting::where('key', 'free_delivery_over_status')->first())
                                    <div class="form-group mb-0">

                                       <label class="form-label d-flex justify-content-between text-capitalize"
                                            for="free_delivery_over_status">
                                            <span class="pr-1 d-flex align-items-center switch--label">
                                                <span class="line--limit-1">
                                                    {{ translate('messages.free_delivery_over') }} R$
                                                </span>
                                            </span>

                                           {{--                                            <span class="line--limit-1">{{ translate('messages.free_delivery_over') }} R$</span>--}}
{{--                                           <span class="form-label-secondary text-danger d-flex"--}}
{{--                                                 data-toggle="tooltip" data-placement="right"--}}
{{--                                                 data-original-title="{{ translate('') }}"><img--}}
{{--                                                   src="{{ my_asset('/assets/admin/img/info-circle.svg') }}"--}}
{{--                                                   alt="{{ translate('messages.customer_varification_toggle') }}">--}}
{{--                                                </span>--}}
                                            <span class="toggle-switch toggle-switch-sm pr-sm-3">
                                                <input type="checkbox" class="status toggle-switch-input"
                                                    name="free_delivery_over_status" id="free_delivery_over_status"
                                                    value="1"
                                                    {{ isset($free_delivery_over_status->value) ? 'checked' : '' }}>
                                                <span class="toggle-switch-label text mb-0"><span
                                                        class="toggle-switch-indicator"></span></span>
                                            </span>
                                        </label>

                                        <input type="number" name="free_delivery_over" class="form-control"
                                            id="free_delivery_over"
                                            value="{{ $free_delivery_over ? $free_delivery_over->value : 0 }}"
                                            min="0" step=".01" required
                                            {{ isset($free_delivery_over_status->value) ? '' : 'readonly' }}>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($minimum_shipping_charge = \App\Models\BusinessSetting::where('key', 'minimum_shipping_charge')->first())
                                    <div class="form-group mb-0">
                                        <label class="form-label text-capitalize"
                                            for="minimum_shipping_charge">{{ translate('messages.minimum_shipping_charge') }}</label>
                                        <input type="number" name="minimum_shipping_charge" class="form-control"
                                            id="minimum_shipping_charge" min="0" step=".01"
                                            value="{{ $minimum_shipping_charge ? $minimum_shipping_charge->value : 0 }}"
                                            required>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($per_km_shipping_charge = \App\Models\BusinessSetting::where('key', 'per_km_shipping_charge')->first())
                                    <div class="form-group mb-0">
                                        <label class="form-label text-capitalize"
                                            for="per_km_shipping_charge">{{ translate('messages.per_km_shipping_charge') }}</label>
                                        <input type="number" name="per_km_shipping_charge" class="form-control"
                                            id="per_km_shipping_charge" min="0" step=".01"
                                            value="{{ $per_km_shipping_charge ? $per_km_shipping_charge->value : 0 }}"
                                            required>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-4">
                                    @php($dm_maximum_orders = \App\Models\BusinessSetting::where('key', 'dm_maximum_orders')->first())
                                    <div class="form-group mb-0">
                                        <label class="form-label text-capitalize"
                                            for="dm_maximum_orders">
                                            <div class="d-flex align-items-center">
                                                <span class="line--limit-1 w-0 flex-grow">{{ translate('messages.dm_maximum_order') }} </span> <small
                                                class="text-danger d-flex align-items-center mt-1">*<span class="form-label-secondary"
                                                    data-toggle="tooltip" data-placement="right"
                                                    data-original-title="{{ translate('messages.dm_maximum_order_hint') }}"><img
                                                        src="{{ my_asset('/assets/admin/img/info-circle.svg') }}"
                                                        alt="{{ translate('messages.dm_maximum_order_hint') }}"></span>
                                                </small>
                                            </div>
                                        </label>
                                        <input type="number" name="dm_maximum_orders" class="form-control"
                                            id="dm_maximum_orders" min="1"
                                            value="{{ $dm_maximum_orders ? $dm_maximum_orders->value : 1 }}" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btn--container justify-content-end mt-3">
                <button type="reset" class="btn btn--reset">{{ translate('messages.reset') }}</button>
                <button type="{{ env('APP_MODE') != 'demo' ? 'submit' : 'button' }}"
                    onclick="{{ env('APP_MODE') != 'demo' ? '' : 'call_demo()' }}"
                    class="btn btn--primary">{{ translate('save_information') }}</button>
            </div>
        </form>
    </div>

@endsection

@push('script_2')
    <script>
        @php($language = \App\Models\BusinessSetting::where('key', 'language')->first())
        @php($language = $language->value ?? null)
        let language = <?php echo $language; ?>;
        $('[id=language]').val(language);

        function maintenance_mode() {
            @if (env('APP_MODE') == 'demo')
                toastr.warning('Sorry! You can not enable maintainance mode in demo!');
            @else
                Swal.fire({
                    title: '{{ translate('messages.Are you sure?') }}',
                    text: '{{ translate('Be careful before you turn on/off maintenance mode') }}',
                    type: 'warning',
                    showCancelButton: true,
                    cancelButtonColor: 'default',
                    confirmButtonColor: '#00868F',
                    cancelButtonText: '{{ translate('messages.no') }}',
                    confirmButtonText: '{{ translate('messages.yes') }}',
                    reverseButtons: true
                }).then((result) => {
                    if (result.value) {
                        $.get({
                            url: '{{ route('admin.maintenance-mode') }}',
                            contentType: false,
                            processData: false,
                            beforeSend: function() {
                                $('#loading').show();
                            },
                            success: function(data) {
                                toastr.success(data.message);
                            },
                            complete: function() {
                                $('#loading').hide();
                            },
                        });
                    } else {
                        location.reload();
                    }
                })
            @endif
        };

        function readURL(input, viewer) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#' + viewer).attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileEg1").change(function() {
            readURL(this, 'viewer');
        });

        $("#favIconUpload").change(function() {
            readURL(this, 'iconViewer');
        });
    </script>
    <script
        src="https://maps.googleapis.com/maps/api/js?key={{ \App\Models\BusinessSetting::where('key', 'map_api_key')->first()->value }}&libraries=places&v=3.45.8">
    </script>
    <script>
        function initAutocomplete() {
            var myLatLng = {
                lat: {{ $default_location ? $default_location['lat'] : '-33.8688' }},
                lng: {{ $default_location ? $default_location['lng'] : '151.2195' }}
            };
            const map = new google.maps.Map(document.getElementById("location_map_canvas"), {
                center: {
                    lat: {{ $default_location ? $default_location['lat'] : '-33.8688' }},
                    lng: {{ $default_location ? $default_location['lng'] : '151.2195' }}
                },
                zoom: 13,
                mapTypeId: "roadmap",
            });

            var marker = new google.maps.Marker({
                position: myLatLng,
                map: map,
            });

            marker.setMap(map);
            var geocoder = geocoder = new google.maps.Geocoder();
            google.maps.event.addListener(map, 'click', function(mapsMouseEvent) {
                var coordinates = JSON.stringify(mapsMouseEvent.latLng.toJSON(), null, 2);
                var coordinates = JSON.parse(coordinates);
                var latlng = new google.maps.LatLng(coordinates['lat'], coordinates['lng']);
                marker.setPosition(latlng);
                map.panTo(latlng);

                document.getElementById('latitude').value = coordinates['lat'];
                document.getElementById('longitude').value = coordinates['lng'];


                geocoder.geocode({
                    'latLng': latlng
                }, function(results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        if (results[1]) {
                            document.getElementById('address').innerHtml = results[1].formatted_address;
                        }
                    }
                });
            });
            // Create the search box and link it to the UI element.
            const input = document.getElementById("pac-input");
            const searchBox = new google.maps.places.SearchBox(input);
            map.controls[google.maps.ControlPosition.TOP_CENTER].push(input);
            // Bias the SearchBox results towards current map's viewport.
            map.addListener("bounds_changed", () => {
                searchBox.setBounds(map.getBounds());
            });
            let markers = [];
            // Listen for the event fired when the user selects a prediction and retrieve
            // more details for that place.
            searchBox.addListener("places_changed", () => {
                const places = searchBox.getPlaces();

                if (places.length == 0) {
                    return;
                }
                // Clear out the old markers.
                markers.forEach((marker) => {
                    marker.setMap(null);
                });
                markers = [];
                // For each place, get the icon, name and location.
                const bounds = new google.maps.LatLngBounds();
                places.forEach((place) => {
                    if (!place.geometry || !place.geometry.location) {
                        console.log("Returned place contains no geometry");
                        return;
                    }
                    var mrkr = new google.maps.Marker({
                        map,
                        title: place.name,
                        position: place.geometry.location,
                    });
                    google.maps.event.addListener(mrkr, "click", function(event) {
                        document.getElementById('latitude').value = this.position.lat();
                        document.getElementById('longitude').value = this.position.lng();
                    });

                    markers.push(mrkr);

                    if (place.geometry.viewport) {
                        // Only geocodes have viewport.
                        bounds.union(place.geometry.viewport);
                    } else {
                        bounds.extend(place.geometry.location);
                    }
                });
                map.fitBounds(bounds);
            });
        };
        $(document).on('ready', function() {
            initAutocomplete();
            @php($country = \App\Models\BusinessSetting::where('key', 'country')->first())

            @if ($country)
                $("#country option[value='{{ $country->value }}']").attr('selected', 'selected').change();
            @endif



            $("#free_delivery_over_status").on('change', function() {
                if ($("#free_delivery_over_status").is(':checked')) {
                    $('#free_delivery_over').removeAttr('readonly');
                } else {
                    $('#free_delivery_over').attr('readonly', true);
                    $('#free_delivery_over').val(null);
                }
            });
        });

        $(document).on("keydown", "input", function(e) {
            if (e.which == 13) e.preventDefault();
        });
    </script>
@endpush
