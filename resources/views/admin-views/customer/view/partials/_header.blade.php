    <!-- Page Header -->
    <div class="page-header pb-0">
        <div class="row align-items-center">
            <div class="col-6">
                <h1 class="page-header-title text-break">
                    <span class="page-header-icon">
                        <img src="{{my_asset('assets/admin/img/store.png')}}" class="w--26" alt="">
                    </span>
                    <span>{{$customer->f_name}} {{$customer->l_name}}</span>
                </h1>
            </div>
        </div>
        <div class="js-nav-scroller hs-nav-scroller-horizontal">
            <span class="hs-nav-scroller-arrow-prev d-none">
                <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                    <i class="tio-chevron-left"></i>
                </a>
            </span>

            <span class="hs-nav-scroller-arrow-next d-none">
                <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                    <i class="tio-chevron-right"></i>
                </a>
            </span>

            <!-- Nav -->
            <ul class="nav nav-tabs page-header-tabs mb-2">
                <li class="nav-item">
                    <a class="nav-link {{request('tab')=='index'?'active':''}}" href="{{route('admin.customer.view', ['index', $customer->id])}}">{{translate('messages.overview')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{request('tab')=='orders'?'active':''}}" href="{{route('admin.customer.view', ['orders', $customer->id])}}"  aria-disabled="true">{{translate('messages.orders')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{request('tab')=='cashback'?'active':''}}" href="{{route('admin.customer.view', ['cashback', $customer->id])}}"  aria-disabled="true">{{translate('messages.cashback')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{request('tab')=='reference_extracted'?'active':''}}" href="{{route('admin.customer.view', ['reference_extracted', $customer->id])}}"  aria-disabled="true">{{translate('messages.reference_extracted')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{request('tab')=='affiliates_extracted'?'active':''}}" href="{{route('admin.customer.view', ['affiliates_extracted', $customer->id])}}"  aria-disabled="true">{{translate('messages.affiliates_extracted')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{request('tab')=='transactions'?'active':''}}" href="{{route('admin.customer.view', ['transactions', $customer->id])}}"  aria-disabled="true">{{translate('messages.transactions')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{request('tab')=='affiliates'?'active':''}}" href="{{route('admin.customer.view', ['affiliates', $customer->id])}}"  aria-disabled="true">{{translate('messages.affiliates')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{request('tab')=='address'?'active':''}}" href="{{route('admin.customer.view', ['address', $customer->id])}}"  aria-disabled="true">{{translate('messages.address')}}</a>
                </li>
            </ul>
            <!-- End Nav -->
        </div>
    </div>
    <!-- End Page Header -->
