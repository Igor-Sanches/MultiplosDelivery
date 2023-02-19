@extends('layouts.vendor.app')

@section('title','')


@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <style type="text/css" media="print">
        @page {
            size: auto;   /* auto is the initial value */
            margin: 0;  /* this affects the margin in the printer settings */
        }

    </style>
@endpush


@section('content')

@include('vendor-views.invoices.partials._invoice')

@endsection

@push('script')
    <script>
        function printDiv(divName) {
            // var printContents = document.getElementById(divName).innerHTML;
            // var originalContents = document.body.innerHTML;
            // document.body.innerHTML = printContents;
            // window.print();
            // document.body.innerHTML = originalContents;
            window.open('{{route("vendor.invoices.print-invoice",["id" => $invoice->id])}}', '_blank');
        }
    </script>
@endpush
