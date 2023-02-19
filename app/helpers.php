<?php

use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;

if (! function_exists('translate')) {
    function translate($key, $replace = [])
    {
        if(strpos($key, 'validation.') === 0 || strpos($key, 'passwords.') === 0 || strpos($key, 'pagination.') === 0 || strpos($key, 'order_texts.') === 0) {
            return trans($key, $replace);
        }

        $key = strpos($key, 'messages.') === 0?substr($key,9):$key;
        $local = Helpers::default_lang();
        App::setLocale($local);
        try {
            $lang_array = include(base_path('resources/lang/' . $local . '/messages.php'));
            $processed_key = ucfirst(str_replace('_', ' ', Helpers::remove_invalid_charcaters($key)));

            if (!array_key_exists($key, $lang_array)) {
                $lang_array[$key] = $processed_key;
                $str = "<?php return " . var_export($lang_array, true) . ";";
                file_put_contents(base_path('resources/lang/' . $local . '/messages.php'), $str);
                $result = $processed_key;
            } else {
                $result = trans('messages.' . $key, $replace);
            }
        } catch (\Exception $exception) {
            info($exception);
            $result = trans('messages.' . $key, $replace);
        }

        return $result;
    }
}

function my_asset($path, bool $image = false): string
{
    $soft = '';
    $softImage = '';
    if(!Str::contains(URL::current(), 'http://127.0.0.1:8000')){
        $soft = 'public/';
        $softImage = '/public/';
    }
//    dd($softImage.$path);
    return $image ? asset($softImage.$path) : asset($soft.$path);
}

function id_order_generator(){
    $orderId = \App\Models\Order::query()->selectRaw('COUNT(id) as length,MAX(id) AS "id_order"')->first();
    if($orderId->length == 0){
        return 1000;
    }
    $id_order = $orderId->id_order;
    $count = strlen($id_order);
    if($count < 4){
        if($count == 3){
            $id_order = intval('1'.$id_order);
        }else if($count == 2){
            $id_order = intval('10'.$id_order);
        }else{
            $id_order = intval('100'.$id_order);
        }
    }
    $oldId = $id_order;
    $newId = $oldId + 1;
    $exist = \App\Models\Order::query()->find($newId);
    if(isset($exist)){
        return $newId + $orderId->length + 1;
    }
    return $newId;
}

function go_name_client(String $f_name, String $l_name): string
{
    if(Str::contains($f_name, ' ')){
        $f_names = explode(' ', $f_name);
        $f_name = $f_names[0];
    }
    if(Str::contains($l_name, ' ')){
        $l_names = explode(' ', $l_name);
        $l_name = $l_names[count($l_names) - 1];
    }
    return $f_name.' '.$l_name;
}

function get_value_in_array($translation_order, $type){
    if(isset($translation_order) && !empty($translation_order)){
        $valueMoney = 0.00;
        foreach ($translation_order as $value){
            if($value['transaction_type'] == $type){
                $valueMoney += $value['credit'];
            }
        }
        return $valueMoney;
    }
    return 0.00;
}

function to_km($metros){
    return $metros / 1000;
}

function to_meters($km){
    return $km * 1000;
}

function has_payment_offline($payment): bool
{
    return $payment == 'cash_on_delivery' || $payment == 'payment_credit_card_offline' || $payment == 'payment_debit_card_offline' || $payment == 'payment_pix_offline';
}

function balance($wallet): array
{
    if($wallet->total_earning == $wallet->money_in_hands){
        return [
            'color'=>'0210DA',
            'value'=>'R$ '.number_format(0.00, 2)
        ];
    }else if($wallet->total_earning > $wallet->money_in_hands){
        return [
            'color'=>'20AB02',
            'value'=>'R$ '.number_format($wallet->total_earning - $wallet->money_in_hands, 2)
        ];
    }else{
        return [
            'color'=>'DA0202',
            'value'=>'- R$ '.number_format($wallet->money_in_hands - $wallet->total_earning, 2)
        ];
    }
}

function invoice_balance($wallet){
    if($wallet->total_earning == $wallet->money_in_hands){
        return 0.00;
    }else if($wallet->total_earning > $wallet->money_in_hands){
        return $wallet->total_earning - $wallet->money_in_hands;
    }else{
        return $wallet->money_in_hands - $wallet->total_earning;
    }
}

function invoice_balance_type($wallet): string
{
    if($wallet->total_earning == $wallet->money_in_hands){
        return 'credit';
    }else if($wallet->total_earning > $wallet->money_in_hands){
        return 'credit';
    }else{
        return 'debit';
    }
}

function type_invoices_status($invoice, $status){
    foreach ($invoice as $value){
        if($value->types == $status){
            return $value->counts;
        }
    }
    return 0;
}

function date_format_code($date): string
{
    IF(!isset($date)){
        return '';
    }
    return now()->setTimeFromTimeString($date)->format('d/m/Y h:i');
}

function color_status_invoice($status): string
{
    if($status == 'paid_out') return '#00aa6d';
    elseif($status == 'processing_payment') return '#ff7f00';
    elseif($status == 'refused_payment') return '#ff0000';
    elseif($status == 'overdue') return '#DA0202';
    else return '#ffb90a';
}

function all_store_for_modules_zone($module_id, $zone_id){
    return \App\Models\Store::query()
        ->where('module_id', $module_id)
        ->where('zone_id', $zone_id)
        ->get();
}
