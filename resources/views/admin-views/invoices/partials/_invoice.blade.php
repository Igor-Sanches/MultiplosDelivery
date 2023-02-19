<div class="content container-fluid invoice-page">
    <div class="ff-emoji" id="printableArea">
        <div>
            <center>
                <input type="button" class="btn btn-primary non-printable" onclick="printDiv('printableArea')"
                        value="Imprimir"/>
                <a href="{{url()->previous()}}" class="btn btn-danger non-printable">{{translate('messages.back')}}</a>
            </center>
            <hr class="non-printable">
        </div>
        <div class="print--invoice">
            @if($invoice->store)
            <div class="text-center pt-4 mb-3">
                <img class="invoice-logo" src="{{my_asset('/assets/admin/img/invoice-logo.png')}}" alt="">
                <div class="top-info">
                    <h2 class="store-name">{{$invoice->store->name}}</h2>
                    <div>
                        {{$invoice->store->address}}
                    </div>
                    <div class="mt-1">
                        {{translate('messages.phone')}} : {{$invoice->store->phone}}
                    </div>
                </div>
            </div>
            @endif
            <div class="top-info">
                <img src="{{my_asset('/assets/admin/img/invoice-star.png')}}" alt="" class="w-100">
                <div class="text-uppercase text-center">Recibo</div>
                <img src="{{my_asset('/assets/admin/img/invoice-star.png')}}" alt="" class="w-100">
            </div>
            <div class="order-info-id text-center">
                <h5>N° da Fatura : {{$invoice['id']}}</h5>
            </div>
            <div class="order-info-details">

                <div class="checkout--info">
                    <dl class="row text-right">
                        <dt class="col-6">{{translate('messages.initial_date')}}:</dt>
                        <dd class="col-6">
                            {{date_format_code($invoice->initial_date)}}</dd>
                        <dt class="col-6">{{translate('messages.final_date')}}:</dt>
                        <dd class="col-6">
                            {{date_format_code($invoice->final_date)}}</dd>
                        <dt class="col-6">{{translate('messages.consolidation_date')}}:</dt>
                        <dd class="col-6">
                            {{date_format_code($invoice->consolidation_date)}}</dd>
                        <dt class="col-6">{{translate('messages.due_date')}}:</dt>
                        <dd class="col-6"> {{date_format_code($invoice->due_date)}}</dd>
                        <dt class="col-6">{{ translate('messages.payment_date') }}:</dt>
                        <dd class="col-6"> {{isset($invoice->payment_date) ? date_format_code($invoice->payment_date) : 'Não Pago'}}</dd>


                        <dt class="col-6">{{translate('messages.total_gain')}}:</dt>
                        <dd class="col-6"> R$ {{number_format($invoice->total_gain, 2)}}</dd>
                        <dt class="col-6">{{translate('messages.money_in_hand')}}:</dt>
                        <dd class="col-6"> R$ {{number_format($invoice->money_in_hand, 2)}}</dd>
                        <dt class="col-6">{{translate('messages.type')}}:</dt>
                        <dd class="col-6"> {{$invoice->type == 'credit' ? 'Crédito' : 'Débito'}}</dd>
                        <dt class="col-6">{{translate('messages.invoice_balance')}}:</dt>
                        <dd class="col-6"> R$ {{number_format($invoice->invoice_balance, 2)}}</dd>
                        <dt class="col-6">{{translate('messages.status')}}:</dt>
                        <dd class="col-6"> {{trans('messages.'.$invoice->status)}}</dd>
                    </dl>
                </div>
            </div>
            <div class="top-info mt-2">
                <img src="{{my_asset('/assets/admin/img/invoice-star.png')}}" alt="" class="w-100">
                <div class="text-uppercase text-center">{{translate('THANK YOU')}}</div>
                <img src="{{my_asset('/assets/admin/img/invoice-star.png')}}" alt="" class="w-100">
                <div class="copyright">
                    &copy; {{\App\Models\BusinessSetting::where(['key'=>'business_name'])->first()->value}}. <span
                    class="d-none d-sm-inline-block">{{\App\Models\BusinessSetting::where(['key'=>'footer_text'])->first()->value}}</span>
                </div>
            </div>
        </div>
    </div>
</div>
