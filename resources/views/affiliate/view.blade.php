<!DOCTYPE html>
<html lang="pt">
<head>
    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title -->
    <title>{{translate('messages.admin')}} | {{translate('messages.login')}}</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="{{my_asset('favicon.ico')}}">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="{{my_asset('assets/admin')}}/css/vendor.min.css">
    <link rel="stylesheet" href="{{my_asset('assets/admin')}}/vendor/icon-set/style.css">
    <!-- CSS Front Template -->
    <link rel="stylesheet" href="{{my_asset('assets/admin/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{my_asset('assets/admin/css/theme.minc619.css?v=1.0')}}">
    <link rel="stylesheet" href="{{my_asset('assets/admin/css/style.css')}}">
    <link rel="stylesheet" href="{{my_asset('assets/admin')}}/css/toastr.css">
</head>

<body>
<!-- ========== MAIN CONTENT ========== -->
<main id="content" role="main" class="main">
    <div class="position-fixed top-0 right-0 left-0 bg-img-hero"
         style="height: 100%; background-image: url({{my_asset('assets/admin')}}/svg/components/login-background.png);">
    </div>
    @php($systemlogo = $userReference->image ?? '')
    @php($store_logo = \App\Models\BusinessSetting::where(['key' => 'logo'])->first()->value)
    <!-- Content -->
    <div class="container py-5 py-sm-7">
        <label class="badge badge-soft-success float-right" style="z-index: 9;position: absolute;right: 0.5rem;top: 0.5rem;">
            {{translate('messages.software_version')}} : {{env('SOFTWARE_VERSION')}}
        </label>
        <a class="d-flex justify-content-center mb-5" href="javascript:">
            <img class="z-index-2"
                 onerror="this.src='{{my_asset('storage/app/public/business/'.$store_logo)}}'"
                 src="{{my_asset('storage/app/public/profile/'.$systemlogo)}}"
                 alt="Image Description" style="max-height: 100px; max-width: 300px">
        </a>

        <div class="row justify-content-center">
            @if(isset($userReference))
                <div class="col-md-7 col-lg-5">
                    <!-- Card -->
                    <div class="card card-lg mb-5">
                        <div class="card-body">
                            <!-- Form -->
                            @if($error)
                                <div class="text-center">
                                    <div class="mb-5">
                                        <h2 class="text-capitalize">{{$userReference->f_name}} {{$userReference->l_name}} {{translate('messages.affiliate_already_registered')}}</h2>
                                        <span class="badge badge-soft-info">@lang('messages.enter_with_new_code')</span>
                                    </div>
                                </div>
                            @else
                                <form class="" action="{{route('affiliate-connect', [base64_encode($userReference->id), $ref_code])}}" method="post" id="form-id">
                                    @csrf
                                    <div class="text-center">
                                        <div class="mb-5">
                                            <h2 class="text-capitalize">{{translate('messages.join_me')}}</h2>
                                            <span class="badge badge-soft-info">{{$userReference->f_name}} {{$userReference->l_name}}</span>
                                            <p>{{translate('messages.sign_in_you_account')}}
                                        </div>
                                    </div>

                                    <!-- Form Group -->
                                    <div class="js-form-message form-group">
                                        <label class="input-label text-capitalize" for="phone">{{translate('messages.phone')}}</label>

                                        <input type="text" class="form-control form-control-lg" name="phone" id="phone"
                                               tabindex="1" placeholder="(00) 00000-0000" aria-label="(00) 00000-0000"
                                               required data-msg="@lang('messages.please_enter_a_valid_phone')"
                                               data-hs-mask-options='{
                                           "template": "000.000.000-00"
                                         }'>
                                    </div>
                                    <div class="js-form-message form-group">
                                        <label class="input-label text-capitalize" for="password">{{translate('messages.password')}}</label>

                                        <input type="password" class="form-control form-control-lg" name="password" id="password"
                                               tabindex="1" placeholder="@lang('messages.password')"
                                               required data-msg="@lang('messages.please_enter_a_valid_password')">
                                    </div>
                                    <!-- End Form Group -->


                                    <button type="submit" class="btn btn-lg btn-block btn-primary">{{translate('messages.join_me')}}</button>
                                </form>
                            @endif
                            <!-- End Form -->
                        </div>
                    </div>
                    <!-- End Card -->
                </div>
            @else
                <div class="col-md-7 col-lg-5">
                    <div class="card card-lg mb-5">
                        <div class="card-body">
                            <div class="text-center">
                                <div class="mb-5">
                                    <h2 class="text-capitalize">{{translate('messages.affiliate_not_found')}}</h2>
                                    <span class="badge badge-soft-info">@lang('messages.check_if_the_data_is_correct')</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endif
        </div>
    </div>
    <!-- End Content -->
</main>
<!-- ========== END MAIN CONTENT ========== -->


<!-- JS Implementing Plugins -->
<script src="{{my_asset('assets/admin')}}/js/vendor.min.js"></script>

<!-- JS Front -->
<script src="{{my_asset('assets/admin')}}/js/theme.min.js"></script>
<script src="{{my_asset('assets/admin')}}/js/toastr.js"></script>
{!! Toastr::message() !!}

@if ($errors->any())
    <script>
        @foreach($errors->all() as $error)
        toastr.error('{{$error}}', Error, {
            CloseButton: true,
            ProgressBar: true
        });
        @endforeach
    </script>
@endif

<!-- JS Plugins Init. -->
<script>
    $('#phone').mask('(00) 00000-0000');
    $(document).on('ready', function () {
        // INITIALIZATION OF SHOW PASSWORD
        // =======================================================
        $('.js-toggle-password').each(function () {
            new HSTogglePassword(this).init()
        });

        // INITIALIZATION OF FORM VALIDATION
        // =======================================================
        $('.js-validate').each(function () {
            $.HSCore.components.HSValidation.init($(this));
        });
    });
</script>

{{-- recaptcha scripts start --}}
@if(isset($recaptcha) && $recaptcha['status'] == 1)
    <script type="text/javascript">
        var onloadCallback = function () {
            grecaptcha.render('recaptcha_element', {
                'sitekey': '{{ \App\CentralLogics\Helpers::get_business_settings('recaptcha')['site_key'] }}'
            });
        };
    </script>
    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
    <script>
        $("#form-id").on('submit',function(e) {
            var response = grecaptcha.getResponse();

            if (response.length === 0) {
                e.preventDefault();
                toastr.error("{{translate('messages.Please check the recaptcha')}}");
            }
        });
    </script>
@endif
<!-- IE Support -->
<script>
    if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="{{my_asset('/assets/admin')}}/vendor/babel-polyfill/polyfill.min.js"><\/script>');
</script>
</body>
</html>
