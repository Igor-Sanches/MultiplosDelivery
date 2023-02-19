@extends('layouts.vendor.app')

@section('title',__('messages.invoices'))

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-pages"></i> {{translate('messages.invoices')}} <span class="badge badge-soft-dark ml-2" id="itemCount">{{$invoices->total()}}</span></h1>
                </div>
            </div>
        </div>

        <div class="card mt-3">
            <div class="card-header py-2">
                <div class="search--button-wrapper">
                    <h5 class="card-title"><span class="card-header-icon">
                        <i class="tio-menu-hamburger"></i>
                    </span> @lang('messages.invoices')</h5>
                </div>
                <div class="ml-4">
                    <div class="d-sm-flex align-items-sm-center">
                        <div class="hs-unfold mr-2">
                            <a class="js-hs-unfold-invoker btn btn-sm btn-white" href="javascript:;"
                               onclick="$('#datatableFilterSidebar,.hs-unfold-overlay').show(500)">
                                <i class="tio-filter-list mr-1"></i> @lang('messages.filters') <span
                                    class="badge badge-success badge-pill ml-1" id="filter_count"></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <ul class="transaction--information text-uppercase">
                <li class="text--info">
                    <i class="tio-document-text-outlined"></i>
                    <div>
                        <span>{{translate('messages.total_invoices_paid')}}</span> <strong>{{type_invoices_status($invoices_status, 'paid_out')}}</strong>
                    </div>
                </li>
                <li class="seperator"></li>
                <li class="text--warning">
                    <i class="tio-checkmark-circle-outlined warning--icon"></i>
                    <div>
                        <span>{{translate('messages.total_invoices_pending')}}</span> <strong>{{type_invoices_status($invoices_status, 'pending')}}</strong>
                    </div>
                </li>
                <li class="seperator"></li>
                <li class="text--danger">
                    <i class="tio-atm"></i>
                    <div>
                        <span>{{translate('messages.total_invoices_overdue')}}</span> <strong>{{type_invoices_status($invoices_status, 'overdue')}}</strong>
                    </div>
                </li>
            </ul>

            <div class="table-responsive datatable-custom">
                <table id="datatable"
                       class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                       style="width: 100%"
                       data-hs-datatables-options='{
                     "columnDefs": [{
                        "targets": [0, 9],
                        "orderable": false
                      }],
                     "order": [],
                     "info": {
                       "totalQty": "#datatableWithPaginationInfoTotalQty"
                     },
                     "search": "#datatableSearch",
                     "entries": "#datatableEntries",
                     "isResponsive": false,
                     "isShowPaging": false,
                     "paging": false
                   }'>
                    <thead class="thead-light">
                    <tr>
                        <th>{{ translate('messages.ID') }}</th>
                        <th>{{ translate('messages.proof') }}</th>
                        <th>{{ translate('messages.initial_date') }}</th>
                        <th>{{ translate('messages.final_date') }}</th>
                        <th>{{ translate('messages.total_gain') }}</th>
                        <th>{{ translate('messages.money_in_hand') }}</th>
                        <th>{{ translate('messages.invoice_balance') }}</th>
                        <th>{{ translate('messages.type_') }}</th>
                        <th>{{ translate('messages.consolidation_date') }}</th>
                        <th>{{ translate('messages.status') }}</th>
                        <th>{{ translate('messages.due_date') }}</th>
                        <th>{{ translate('messages.payment_date') }}</th>
                        <th class="text-cetner w-130px">@lang('messages.action')</th>
                    </tr>
                    </thead>

                    <tbody id="table-div">
                    @foreach($invoices as $invoice)
                        <tr>
                            <td>
                                N°: {{$invoice->id}}
                            </td>
                            <td>
                                @if(isset($invoice->proof))
                                    <div class="row text-center">
                                        <span class="text-success">Disponivel</span>
                                        <a class="ml-3 btn action-btn btn--primary btn-outline-primary"
                                           href="{{route('vendor.invoices.view-proof', [$invoice->id])}}"
                                           title="{{translate('messages.pay_invoice')}}"><i class="tio-visible text-primary"></i>
                                        </a>
                                    </div>
                                @else
                                    <span class="text-danger">N. Recebido</span>
                                @endif
                            </td>
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
                                    {{now()->setTimeFromTimeString($invoice->due_date)->format('d/m/Y H:i')}}
                                @endif
                            </td>
                            <td>
                                @if(isset($invoice->payment_date))
                                    {{now()->setTimeFromTimeString($invoice->payment_date)->format('d/m/Y H:i')}}
                                @endif
                            </td>
                            <td>
                                @if($invoice->status == 'pending' || $invoice->status == 'overdue')
                                    <a class="btn btn--primary btn-outline-success"
                                       onclick="onPayment('{{$invoice->id}}', '{{$invoice->status}}', '{{$invoice->type}}', '{{number_format($invoice->invoice_balance, 2)}}')" title="{{translate('messages.pay_invoice')}}">@lang('messages.pay_invoice')
                                    </a>
                                @endif
                               <a class="btn btn--primary btn-outline-success"
                                  onclick="onInvoiceView('{{$invoice->id}}', '{{$invoice->store->name}}', '{{date_format_code($invoice->initial_date)}} - {{date_format_code($invoice->final_date)}}', '{{date_format_code($invoice->consolidation_date)}}', '{{date_format_code($invoice->due_date)}}', '{{number_format($invoice->total_gain, 2)}}', '{{$invoice->type}}', '{{number_format($invoice->money_in_hand, 2)}}', '{{number_format($invoice->invoice_balance, 2)}}', '{{__('messages.'.$invoice->status)}}', '{{color_status_invoice($invoice->status)}}')" title="{{translate('messages.view_invoice')}}">@lang('messages.view_invoice')
                                </a>
                                @if($invoice->status == 'processing_payment')
                                    <a class="btn btn--primary btn-outline-success"
                                       onclick="onSendProof('{{$invoice->id}}')" title="{{translate('messages.send_Proof_of_payment')}}">@lang('messages.send_Proof_of_payment')
                                    </a>
                                @endif
                           </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
                @if(count($invoices) === 0)
                    <div class="empty--data">
                        <img src="{{my_asset('/assets/admin/svg/illustrations/sorry.svg')}}" alt="public">
                        <h5>
                            {{translate('no_data_found')}}
                        </h5>
                    </div>
                @endif
            </div>
            <div class="card-footer pt-0 border-0">
                <div class="page-area px-4 pb-3">
                    <div class="d-flex align-items-center justify-content-end">
                        <div>
                            {!! $invoices->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div id="datatableFilterSidebar" class="hs-unfold-content_ sidebar sidebar-bordered sidebar-box-shadow"
         style="display: none">
        <div class="card card-lg sidebar-card sidebar-footer-fixed">
            <div class="card-header">
                <h4 class="card-header-title">{{__('messages.filter')}}</h4>

                <!-- Toggle Button -->
                <a class="js-hs-unfold-invoker_ btn btn-icon btn-xs btn-ghost-dark ml-2" href="javascript:;"
                   onclick="$('#datatableFilterSidebar,.hs-unfold-overlay').hide(500)">
                    <i class="tio-clear tio-lg"></i>
                </a>
                <!-- End Toggle Button -->
            </div>
            <?php
            $filter_count = 0;
            if (isset($month_year)) $filter_count += 1;
            if (isset($types) && count($types) > 0) $filter_count += 1;
            if(isset($status) && count($status) > 0) $filter_count += 1;
            if (isset($from_date) && isset($to_date)) $filter_count += 1;

            ?>
                <!-- Body -->

            <form class="card-body sidebar-body sidebar-scrollbar"
                  action="{{route('vendor.invoices.filter')}}"
                  method="POST" id="invoices_filter_form">
                @csrf
                <hr class="my-4">
                <small class="text-cap mb-3">@lang('messages.date')</small>

                <div class="custom-control custom-radio mb-2">
                    <label class="input-label" for="month_year">{{__('messages.month_year')}}</label>
                    <input type="date" name="month_year" class="form-control" id="month_year"
                           value="{{$month_year ?? ''}}">
                </div>


{{--                <hr class="my-4">--}}
{{--                <small class="text-cap mb-3">@lang('messages.categories')</small>--}}
{{--                <div class="custom-control custom-radio mb-2">--}}
{{--                    <select name="categories[]" multiple="multiple" class="form-control js-select2-custom">--}}
{{--                        @foreach(\App\Models\Category::query()->get() as $category)--}}
{{--                            <option {{in_array($category->id, $categories) ? 'selected' : ''}} value="{{$category->id}}">--}}
{{--                                {{$category->name}}--}}
{{--                            </option>--}}
{{--                        @endforeach--}}
{{--                    </select>--}}
{{--                </div>--}}


                <hr class="my-4">
                <small class="text-cap mb-3">@lang('messages.type')</small>

                <div class="custom-control custom-radio mb-2">
                    <input type="checkbox" id="types1" name="types[]"
                           class="custom-control-input"
                           value="credit" {{isset($types)?(in_array('credit', $types)?'checked':''):''}} >
                    <label class="custom-control-label" for="types1">{{__('messages.credit')}}</label>
                </div>
                <div class="custom-control custom-radio mb-2">
                    <input type="checkbox" id="types2" name="types[]"
                           class="custom-control-input"
                           value="debit" {{isset($types)?(in_array('debit', $types)?'checked':''):''}} >
                    <label class="custom-control-label" for="types2">{{__('messages.debit')}}</label>
                </div>

                <hr class="my-4">
                <small class="text-cap mb-3">@lang('messages.status')</small>

                <div class="custom-control custom-radio mb-2">
                    <input type="checkbox" id="status1" name="status[]"
                           class="custom-control-input"
                           value="paid_out" {{isset($types)?(in_array('paid_out', $types)?'checked':''):''}} >
                    <label class="custom-control-label" for="status1">{{__('messages.paid_out')}}</label>
                </div>
                <div class="custom-control custom-radio mb-2">
                    <input type="checkbox" id="status2" name="status[]"
                           class="custom-control-input"
                           value="pending" {{isset($types)?(in_array('pending', $types)?'checked':''):''}} >
                    <label class="custom-control-label" for="status2">{{__('messages.pending')}}</label>
                </div>
                <div class="custom-control custom-radio mb-2">
                    <input type="checkbox" id="status3" name="status[]"
                           class="custom-control-input"
                           value="processing_payment" {{isset($types)?(in_array('processing_payment', $types)?'checked':''):''}} >
                    <label class="custom-control-label" for="status3">{{__('messages.processing_payment')}}</label>
                </div>
                <div class="custom-control custom-radio mb-2">
                    <input type="checkbox" id="status4" name="status[]"
                           class="custom-control-input"
                           value="refused_payment" {{isset($types)?(in_array('refused_payment', $types)?'checked':''):''}} >
                    <label class="custom-control-label" for="status4">{{__('messages.refused_payment')}}</label>
                </div>
                <div class="custom-control custom-radio mb-2">
                    <input type="checkbox" id="status5" name="status[]"
                           class="custom-control-input"
                           value="overdue" {{isset($types)?(in_array('overdue', $types)?'checked':''):''}} >
                    <label class="custom-control-label" for="status5">{{__('messages.overdue')}}</label>
                </div>

                <hr class="my-4">
                <small class="text-cap mb-3">@lang('messages.date_between')</small>

                <div class="row">
                    <div class="col-12">
                        <div class="form-group" style="margin:0;">
                            <input type="date" name="from_date" class="form-control" id="date_from"
                                   value="{{isset($from_date)?$from_date:''}}">
                        </div>
                    </div>
                    <div class="col-12 text-center">----@lang('messages.to')----</div>
                    <div class="col-12">
                        <div class="form-group">
                            <input type="date" name="to_date" class="form-control" id="date_to"
                                   value="{{isset($to_date)?$to_date:''}}">
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <div class="card-footer sidebar-footer">
                    <div class="row gx-2">
                        <div class="col">
                            <button type="reset" class="btn btn-block btn-white"
                                    id="reset">@lang('messages.clear_all_filters')</button>
                        </div>
                        <div class="col">
                            <button type="submit" class="btn btn-block btn-primary">@lang('messages.save')</button>
                        </div>
                    </div>
                </div>
                <!-- End Footer -->
            </form>
        </div>
    </div>

    <div class="modal fade" id="onPayment" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <form action="{{route('vendor.invoices.finish-payment')}}" method="post" id="payment-setup-form" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <input id="id_invoice" name="id_invoice" type="hidden">
                        <ul class="navbar-nav navbar-nav-lg nav-tabs">
                            <li class="navbar-vertical-aside-has-menu ">
                                Status: <span id="type_pay"></span>
                            </li>
                            <li class="navbar-vertical-aside-has-menu ">
                                Valor: R$ <span id="value_pay"></span>
                            </li>
                        </ul>
                        <div class="col-lg-6 mt-6">
                            <div class="h-100 d-flex flex-column">
                                <label class="mt-auto mb-0 d-block text-center">{{translate('messages.payment_voucher')}} <small class="text-danger">* ( Imagem ou PDF )</small></label>
                                <div>
                                    <input type="file" name="proof" id="proof" accept="application/pdf, image/*" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">@lang('messages.close')</button>
                        <button type="button" onclick="Swal.fire({
                                    title: '{{translate("messages.really_want_to_complete_the_payment")}}',
                                    showDenyButton: true,
                                    showCancelButton: true,
                                    confirmButtonColor: '#FC6A57',
                                    cancelButtonColor: '#363636',
                                    confirmButtonText: `{{__('messages.yes')}}`,
                                    cancelButtonText: `{{__('messages.no')}}`,
                                    }).then((result) => {
                                    if (result.value) {
                                     $('#payment-setup-form').submit()
                                    }})" class="btn btn--primary"><i class="tio-open-in-new"></i> {{translate('messages.finish_payment')}}</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <div class="modal fade" id="onSendProof" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalSendLabel"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <form action="{{route('vendor.invoices.send-proof')}}" method="post" id="send-proof-setup-form" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <input id="id_invoice_send" name="id_invoice" type="hidden">
                        <div class="col-lg-6 mt-6">
                            <div class="h-100 d-flex flex-column">
                                <label class="mt-auto mb-0 d-block text-center">{{translate('messages.payment_voucher')}} <small class="text-danger">* ( Imagem ou PDF )</small></label>
                                <div>
                                    <input type="file" name="proof" id="proof" accept="application/pdf, image/*" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">@lang('messages.close')</button>
                        <button type="button" onclick="viewProof(document.getElementById('id_invoice_send').value)" data-dismiss="modal" class="btn btn-soft-success">Ve Comprovante Atual</button>
                        <button type="button" onclick="Swal.fire({
                                    title: '{{translate("messages.really_want_to_complete_the_send")}}',
                                    showDenyButton: true,
                                    showCancelButton: true,
                                    confirmButtonColor: '#FC6A57',
                                    cancelButtonColor: '#363636',
                                    confirmButtonText: `{{__('messages.yes')}}`,
                                    cancelButtonText: `{{__('messages.no')}}`,
                                    }).then((result) => {
                                    if (result.value) {
                                     $('#send-proof-setup-form').submit()
                                    }})" class="btn btn--primary"><i class="tio-open-in-new"></i>Enviar</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <div class="modal fade" id="onInvoiceView" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalViewLabel"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <form action="{{route('vendor.invoices.send-proof')}}" method="post" id="send-proof-setup-form" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <input id="id_invoice_view" name="id_invoice" type="hidden">
                        <div class="col-lg-6 mt-6">
                            <div class="h-100 d-flex flex-column">
                                <div>
                                    <ul class="navbar-nav navbar-nav-lg nav-tabs">
                                        <li class="navbar-vertical-aside-has-menu mb-4">
                                            Loja: <span id="store_name"></span>
                                        </li>
                                        <li class="navbar-vertical-aside-has-menu mt-3">
                                            N°: <span id="id_i"></span>
                                        </li>
                                        <li class="navbar-vertical-aside-has-menu ">
                                            PERÍODO: <span id="data_entre"></span>
                                        </li>
                                        <li class="navbar-vertical-aside-has-menu ">
                                            DATA FECHAMENTO: <span id="closing_date"></span>
                                        </li>
                                        <li class="navbar-vertical-aside-has-menu mb-3">
                                            DATA VENCIMENTO: <span id="due_date"></span>
                                        </li>
                                        <li class="navbar-vertical-aside-has-menu mt-3">
                                            GANHO LOJA: <span style="color: #026FDA; font-weight: bold" id="i_win_store"></span>
                                        </li>
                                        <li class="navbar-vertical-aside-has-menu">
                                            DINHEIRO EM MÃOS LOJA: <span style="color: #026FDA; font-weight: bold" id="money_in_hands_shop"></span>
                                        </li>
                                        <li class="navbar-vertical-aside-has-menu">
                                            VALOR FATURA: <span id="value_invoice"></span>
                                        </li>
                                        <li class="navbar-vertical-aside-has-menu">
                                            STATUS DA FATURA: <span id="status_invoice"></span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">@lang('messages.close')</button>
                        <button type="button" onclick="viewPrint()" data-dismiss="modal" class="btn btn-soft-success">Imprimir</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
@endsection

@push('script_2')
    <script>

        function onInvoiceView(id, store_name, data_entre, closing_date, due_date, i_win_store, type, money_in_hands_shop, value_invoice, status, color_status){
            const myModalLabel = document.getElementById('myModalViewLabel')
            const id_invoice = document.getElementById('id_invoice_view')
            const id_i = document.getElementById('id_i')
            const data_entre_span = document.getElementById('data_entre')
            const closing_date_span = document.getElementById('closing_date')
            const due_date_span = document.getElementById('due_date')
            const i_win_store_span = document.getElementById('i_win_store')
            const money_in_hands_shop_span = document.getElementById('money_in_hands_shop')
            const value_invoice_span = document.getElementById('value_invoice')
            const status_invoice_span = document.getElementById('status_invoice')
            const store_name_span = document.getElementById('store_name')
            id_invoice.value = id
            id_i.textContent = id
            data_entre_span.textContent = data_entre
            closing_date_span.textContent = closing_date
            due_date_span.textContent = due_date
            value_invoice_span.setAttribute('style', type === 'credit' ? 'color: #6FD002; font-weight: bold' : 'color: #DA0202; font-weight: bold')
            status_invoice_span.setAttribute('style', 'color:' + color_status)
            i_win_store_span.textContent = 'R$ ' + i_win_store
            money_in_hands_shop_span.textContent = 'R$ ' + money_in_hands_shop
            const s = type === 'credit' ? 'C' : 'D'
            value_invoice_span.textContent = 'R$ ' + value_invoice + ' ' + s
            status_invoice_span.textContent = status
            store_name_span.textContent = store_name
            myModalLabel.textContent = 'Fatura'
            $('#onInvoiceView').modal('show')
        }

        function viewProof(id){
            location.href = '{{url('/')}}/vendor-panel/invoices/view-proof/'+id;
        }

        function viewPrint(){
            const id = document.getElementById('id_invoice_view').value
            location.href = '{{url('/')}}/vendor-panel/invoices/print-invoice/'+id;
        }

        function onSendProof(id){
            const myModalLabel = document.getElementById('myModalSendLabel')
            const id_invoice = document.getElementById('id_invoice_send')
            id_invoice.value = id
            myModalLabel.textContent = 'Comprovante'
            $('#onSendProof').modal('show')
        }

        function onPayment(id, status, type, invoice_balance){
            const myModalLabel = document.getElementById('myModalLabel')
            const type_pay = document.getElementById('type_pay')
            const value_pay = document.getElementById('value_pay')
            const id_invoice = document.getElementById('id_invoice')
            id_invoice.value = id
            myModalLabel.textContent = 'Pagar Fatura'
            type_pay.textContent = status === 'credit' ? 'Crédito' : 'Débito'
            value_pay.textContent = invoice_balance
            $('#onPayment').modal('show')
        }

        function openMenuDialog(id){
            $('#modal_info').modal('show')
            const myModalLabel = document.getElementById('myModalLabel')
            const date_due = document.getElementById('date_due')
        }

        $('#reset').on('click', function () {
            // e.preventDefault();
            location.href = '{{url('/')}}/vendor-panel/invoices/filter/reset';
        });


        function route_dialog_alert(url, message, e) {
            e.preventDefault();
            Swal.fire({
                title: '{{__('messages.are_you_sure')}}',
                text: message,
                type: 'warning',
                showCancelButton: true,
                cancelButtonColor: 'default',
                confirmButtonColor: '#FC6A57',
                cancelButtonText: '{{__('messages.no')}}',
                confirmButtonText: '{{__('messages.yes')}}',
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    location.href = url;
                }
            })
        }

        $(document).on('ready', function () {
            var datatable = $.HSCore.components.HSDatatables.init($('#datatable'));


            @if($filter_count>0)
            $('#filter_count').html({{$filter_count}});
            @endif
            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function () {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });


            $('#datatableSearch').on('mouseup', function (e) {
                var $input = $(this),
                    oldValue = $input.val();

                if (oldValue == "") return;

                setTimeout(function () {
                    var newValue = $input.val();

                    if (newValue == "") {
                        // Gotcha
                        datatable.search('').draw();
                    }
                }, 1);
            });


            // INITIALIZATION OF TAGIFY
            // =======================================================
            $('.js-tagify').each(function () {
                var tagify = $.HSCore.components.HSTagify.init($(this));
            });

            $("#date_from").on("change", function () {
                $('#date_to').attr('min', $(this).val());
            });

            $("#date_to").on("change", function () {
                $('#date_from').attr('max', $(this).val());
            });
        });

        $('#reset_btn').click(function () {
            $('#name').val(null);
        })

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#proof").change(function () {
            readURL(this);
        });

    </script>
@endpush
