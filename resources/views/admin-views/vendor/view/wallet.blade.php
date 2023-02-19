@extends('layouts.admin.app')

@section('title',$store->name)

@push('css_or_js')
    <!-- Custom styles for this page -->
    <link href="{{my_asset('assets/admin/css/croppie.css')}}" rel="stylesheet">
@endpush

@section('content')
<div class="content container-fluid">

    @include('admin-views.vendor.view.partials._header',['store'=>$store])

    <div class="card mt-4">
        <div class="card-header">
            <h5 class="card-title m-0 d-flex align-items-center">
                <span class="card-header-icon mr-2">
                    <i class="tio-shop-outlined"></i>
                </span>
                <span class="ml-1">{{translate('messages.total_consolidated')}}</span>
            </h5>
        </div>
        <div class="card-body">
            <div class="row g-3">
                <div class="col-sm-6 col-xl-4">
                    <div class="resturant-card resturant-card-2 card--bg-3">
                        <h4 class="title">R$ {{number_format($total_gain, 2)}}</h4>
                        <span class="subtitle">{{ translate('messages.total_gain') }}</span>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-4">
                    <div class="resturant-card resturant-card-2 card--bg-2">
                        <h4 class="title">R$ {{number_format($money_in_hand, 2)}}</h4>
                        <span class="subtitle">{{ translate('messages.total_received') }}</span>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-4">
                    <div class="resturant-card resturant-card-2 card--bg-4">
                        <h4 class="title">R$ {{number_format($total_paid, 2)}}</h4>
                        <span class="subtitle">{{ translate('messages.total_paid') }}</span>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="resturant-card resturant-card-2 card--bg-1">
                        <h4 class="title">R$ {{number_format($credit_balance, 2)}}</h4>
                        <span class="subtitle">{{ translate('messages.pending_credit') }}</span>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="resturant-card resturant-card-2 card--bg-4">
                        <h4 class="title">- R$ {{number_format($debit_balance, 2)}}</h4>
                        <span class="subtitle">{{ translate('messages.pending_debit') }}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-header">
            <h5 class="card-title m-0 d-flex align-items-center">
                <span class="card-header-icon mr-2">
                    <i class="tio-shop-outlined"></i>
                </span>
                <span class="ml-1">{{translate('messages.current_cycle_starts_in')}} {{now()->setTimeFromTimeString($wallet->current_cycle)->format('d/m/Y H:i')}})</span>
            </h5>
        </div>
        <div class="card-body">
            <form action="{{route('admin.store.consolidate-cycle',[$store['id']])}}" method="post" id="discount-form">
                @csrf
                <div class="row g-3">
                    <div class="col-sm-6 col-xl-4">
                        <div class="resturant-card resturant-card-2 card--bg-3">
                            <h4 class="title">R$ {{number_format($wallet->total_earning, 2)}}</h4>
                            <span class="subtitle">{{ translate('messages.total_gain') }}</span>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-4">
                        <div class="resturant-card resturant-card-2 card--bg-2">
                            <h4 class="title">R$ {{number_format($wallet->money_in_hands, 2)}}</h4>
                            <span class="subtitle">{{ translate('messages.money_in_hand') }}</span>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-4">
                        @php($balanceData = balance($wallet))
                        <div class="resturant-card resturant-card-2 card--bg-4">
                            <h4 class="title" style="color: '#{{$balanceData['color']}}'">{{$balanceData['value']}}</h4>
                            <span class="subtitle">{{ translate('messages.balance_') }}</span>
                        </div>
                    </div>
                </div>
                <div class="btn--container justify-content-end mt-4">
                    <div class="form-group mb-0 mr-4" id="default">
                        <label class="input-label" for="date_due">Data Vencimento</label>
                        <input type="datetime-local" value="{{now()->format('d/m/Y H:i')}}" id="date_due" name="date_due" class="form-control mb-4" required placeholder="xx/xx/xxxx xx:xx">
                        <button type="submit" class="btn btn--primary"><i class="tio-open-in-new"></i> {{translate('messages.consolidate_cycle')}}</button>
                    </div>
                </div>

            </form>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-header">
            <h5 class="card-title m-0 d-flex align-items-center">
                <span class="card-header-icon mr-2">
                    <i class="tio-menu-hamburger"></i>
                </span>
                <span class="ml-1">{{translate('messages.invoices')}}</span>
            </h5>
        </div>
        <div class="card-body">
            <!-- Body -->
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table id="datatable" class="table table-thead-bordered table-align-middle card-table">
                        <thead class="thead-light">
                        <tr>
                            <th class="border-0">{{ translate('messages.initial_date') }}</th>
                            <th class="border-0">{{ translate('messages.final_date') }}</th>
                            <th class="border-0">{{ translate('messages.total_gain') }}</th>
                            <th class="border-0">{{ translate('messages.money_in_hand') }}</th>
                            <th class="border-0">{{ translate('messages.invoice_balance') }}</th>
                            <th class="border-0">{{ translate('messages.type_') }}</th>
                            <th class="border-0">{{ translate('messages.consolidation_date') }}</th>
                            <th class="border-0">{{ translate('messages.status') }}</th>
                            <th class="border-0">{{ translate('messages.due_date') }}</th>
                            <th class="border-0">{{ translate('messages.payment_date') }}</th>
                        </tr>
                        </thead>
                        <tbody id="set-rows">
                        @foreach ($invoices as $invoice)
                            <tr>
                                <td>
                                    {{now()->setTimeFromTimeString($invoice->initial_date)->format('d/m/Y H:i')}}
                                </td>
                                <td>
                                    {{now()->setTimeFromTimeString($invoice->final_date)->format('d/m/Y H:i')}}
                                </td>
                                <td>
                                    <span style="font-weight: bold">R$ {{number_format($invoice->total_gain, 2)}}</span>
                                </td>
                                <td>
                                    <span style="font-weight: bold">R$ {{number_format($invoice->money_in_hand, 2)}}</span>
                                </td>
                                <td>
                                    @if($invoice->type == 'credit')
                                        <span class="text-success">R$ {{$invoice->invoice_balance}}</span>
                                    @else
                                        <span class="text-danger">R$ {{$invoice->invoice_balance}}</span>
                                    @endif
                                </td>
                                <td>
                                    @if($invoice->type == 'credit')
                                        <span class="text-success">C LOJA</span>
                                    @else
                                        <span class="text-danger">D LOJA</span>
                                    @endif
                                </td>
                                <td>
                                    {{now()->setTimeFromTimeString($invoice->consolidation_date)->format('d/m/Y H:i')}}
                                </td>
                                <td>
                                    @if($invoice->status == 'paid_out')
                                        <span style="
                                            color: #1aff00;
                                           background-color: #0a1123;
                                            padding: 10px;
                                            border-radius: 20px;
                                            font-weight: bold;
                                             ">@lang('messages.paid_out')</span>
                                    @elseif($invoice->status == 'processing_payment')
                                        <span style="
                                            color: #0065c9;
                                             background-color: #0a1123;
                                            padding: 10px;
                                            border-radius: 20px;
                                            font-weight: bold;
                                             ">@lang('messages.processing_payment')</span>
                                    @elseif($invoice->status == 'refused_payment')
                                        <span style="
                                            color: #ffbb30;
                                           background-color: #0a1123;
                                            padding: 10px;
                                            border-radius: 20px;
                                            font-weight: bold;
                                             ">@lang('messages.refused_payment')</span>
                                    @elseif($invoice->status == 'overdue')
                                        <span style="
                                            color: #ff0000;
                                           background-color: #0a1123;
                                            padding: 10px;
                                            border-radius: 20px;
                                            font-weight: bold;
                                             ">@lang('messages.overdue')</span>
                                    @else
                                        <span style="
                                            color: #ffffff;
                                            background-color: #0a1123;
                                            padding: 10px;
                                            border-radius: 20px;
                                            font-weight: bold;
                                            ">@lang('messages.pending')</span>
                                    @endif
                                </td>
                                <td>
                                    @if(isset($invoice->due_date))
                                        {{now()->setTimeFromTimeString($invoice->consolidation_date)->format('d/m/Y H:i')}}
                                    @endif
                                </td>
                                <td>
                                    @if(isset($invoice->payment_date))
                                        {{now()->setTimeFromTimeString($invoice->payment_date)->format('d/m/Y H:i')}}
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- End Body -->
            @if (count($invoices) !== 0)
                <hr>
            @endif
            <div class="page-area">
                {!! $invoices->links() !!}
            </div>
            @if (count($invoices) === 0)
                <div class="empty--data">
                    <img src="{{ my_asset('/assets/admin/svg/illustrations/sorry.svg') }}" alt="public">
                    <h5>
                        {{ translate('no_data_found') }}
                    </h5>
                </div>
            @endif
        </div>
    </div>
</div>
@endsection

@push('script_2')
    <!-- Page level plugins -->
    <script>
        // Call the dataTables jQuery plugin
        $(document).ready(function () {
            $('#dataTable').DataTable();
        });
    </script>

@endpush
