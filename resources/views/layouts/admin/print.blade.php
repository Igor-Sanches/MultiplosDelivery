<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="csrf-token" id="csrf-token" content="{{ csrf_token() }}">
    <!-- Title -->
    <title></title>
    <!-- Favicon -->

    <link rel="shortcut icon" href="">
    <link rel="icon" type="image/x-icon" href="">
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&amp;display=swap" rel="stylesheet">
    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="{{my_asset('assets/admin/css/vendor.min.css')}}">
    <link rel="stylesheet" href="{{my_asset('assets/admin/vendor/icon-set/style.css')}}">
    <link rel="stylesheet" href="{{my_asset('assets/admin/css/custom.css')}}">
    <!-- CSS Front Template -->
    <link rel="stylesheet" href="{{my_asset('assets/admin/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{my_asset('assets/admin/css/theme.minc619.css?v=1.0')}}">
    <link rel="stylesheet" href="{{my_asset('assets/admin/css/style.css')}}">
    @stack('css_or_js')

    <script
        src="{{my_asset('assets/admin')}}/vendor/hs-navbar-vertical-aside/hs-navbar-vertical-aside-mini-cache.js"></script>
    <link rel="stylesheet" href="{{my_asset('assets/admin')}}/css/toastr.css">
</head>

<body class="footer-offset">

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div id="loading" class="initial-hidden">
                <div class="loading-inner">
                    <img width="200" src="{{my_asset('assets/admin/img/loader.gif')}}">
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Builder -->

<!-- End Builder -->

<!-- JS Preview mode only -->

<!-- END ONLY DEV -->

<main id="content" role="main" class="main pointer-event">
    <!-- Content -->
@yield('content')
<!-- End Content -->

<!-- ========== END SECONDARY CONTENTS ========== -->
<script src="{{my_asset('assets/admin')}}/js/custom.js"></script>
<!-- JS Implementing Plugins -->

@stack('script')
<!-- JS Front -->
<script src="{{my_asset('assets/admin')}}/js/vendor.min.js"></script>
<script src="{{my_asset('assets/admin')}}/js/theme.min.js"></script>
<script>
    $(document).on('ready', function () {
        window.print();
        window.onfocus=function(){ window.close();}
    })
</script>
<!-- IE Support -->
<script>
    if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="{{my_asset('assets/admin')}}/vendor/babel-polyfill/polyfill.min.js"><\/script>');
</script>
</body>
</html>
