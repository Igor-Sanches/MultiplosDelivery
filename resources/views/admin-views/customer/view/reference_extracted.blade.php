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
                   href="{{route('admin.customer.edit-customer',[$customer['id']-1])}}"
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

        <div class="card">
            <div class="card-header border-0 py-2">
                <div class="search--button-wrapper">
                    <h5 class="card-title"> {{translate('extracted_list')}} <span class="badge badge-soft-secondary">{{ $reference_extracted->total() }}</span></h5>
                    <div hidden class="min--260">
                        <div class="input--group input-group">
                            <input type="text" id="column1_search" class="form-control form-control-sm" placeholder="{{translate('messages.order_id')}}">
                            <button type="button" class="btn btn--secondary">
                                <i class="tio-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Table -->
            <div class="table-responsive datatable-custom">
                <table id="columnSearchDatatable"
                       class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                       data-hs-datatables-options='{
                                 "order": [],
                                 "orderCellsTop": true,
                                 "paging":false
                               }'>
                    <thead class="thead-light">
                    <tr>
                        <th class="border-0 pl-4">{{translate('messages.description')}}</th>
                        <th class="border-0">{{translate('messages.order_id')}}</th>
                        <th class="border-0">{{translate('messages.value')}}</th>
                        <th class="border-0">{{translate('messages.balance')}}</th>
                        <th class="border-0">{{translate('messages.date')}}</th>
                    </tr>
                    </thead>

                    <tbody>
                    @foreach($reference_extracted as $key=>$reference)
                        <tr>
                            <td>
                                {{$reference->description}}
                            </td>
                            <td>
                                #{{$reference->reference}}
                            </td>
                            <td>
                                R$ {{number_format($reference->credit, 2)}}
                            </td>
                            <td>
                                R$ {{number_format($reference->balance, 2)}}
                            </td>
                            <td>
                                {{now()->setTimeFromTimeString($reference->created_at)->format('d/m/Y H:m')}}
                            </td>

                        </tr>
                    @endforeach
                    </tbody>
                </table>
                @if(count($reference_extracted) !== 0)
                    <hr>
                @endif
                <div class="page-area">
                    {!! $reference_extracted->links() !!}
                </div>
                @if(count($reference_extracted) === 0)
                    <div class="empty--data">
                        <img src="{{my_asset('/assets/admin/svg/illustrations/sorry.svg')}}" alt="public">
                        <h5>
                            {{translate('no_data_found')}}
                        </h5>
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection

@push('script_2')

    <script>
        $(document).on('ready', function () {
            // INITIALIZATION OF DATATABLES
            // =======================================================
            var datatable = $.HSCore.components.HSDatatables.init($('#columnSearchDatatable'));

            $('#column1_search').on('keyup', function () {
                datatable
                    .columns(1)
                    .search(this.value)
                    .draw();
            });


            $('#column3_search').on('change', function () {
                datatable
                    .columns(2)
                    .search(this.value)
                    .draw();
            });


            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function () {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });
    </script>
@endpush
