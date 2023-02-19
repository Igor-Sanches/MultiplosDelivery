<?php

namespace App\Http\Controllers;

use App\CentralLogics\Helpers;
use App\Models\User;
use App\Models\WalletTransaction;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use PHPUnit\Exception;

class AffiliateController extends Controller
{
    public function affiliate(Request $request){
        $ref_code = $request->ref_code;
        $userReference = User::query()->where('ref_code', $ref_code)->first();
        $error = false;
        if(isset($userReference)){
            if(isset($userReference->affiliate) && !empty($userReference->affiliate)){
                $error = true;
            }
        }

        return view('affiliate.view', compact('userReference', 'error', 'ref_code'));
    }

    public function set_affiliate(Request $request): JsonResponse
    {
        $user = $request->user();
        $codRef = $request->ref_code;
        $userRef = User::query()->where('ref_code', $codRef)->first();
        if(!isset($userRef)){
            return response()->json([
                'error'=>true,
                'message'=>'affiliate_not_exist'
            ], 403);
        }
        if(isset($user->affiliate) && !empty($user->affiliate)){
            return response()->json([
                'error'=>true,
                'message'=>'user_affiliate_exist'
            ], 403);
        }
        if($user->ref_code == $codRef){
            return response()->json([
                'error'=>true,
                'message'=>'you_cannot_add_yourself_as_your_affiliate'
            ], 403);
        }

        return response()->json([
            'error'=>false,
            'data'=>$userRef
        ]);
    }

    public function affiliate_connect($payload, $codRef, Request $request): RedirectResponse
    {
        $id = base64_decode($payload);
        $codRef =
        $validator = Validator::make($request->all(), [
            'phone'=>'required',
            'password'=>'required'
        ], [
            'phone.required'=>'Entre com seu telefone',
            'phone.exists'=>'Telefone não encontrado',
            'password.required'=>'Entre com sua senha',
        ]);
        if ($validator->fails()) {
            return back()
                ->withErrors($validator)
                ->withInput();
        }
        $phone = '+55'.Str::replace('-', '', Str::replace(')', '', Str::replace('(', '', Str::replace(' ', '', $request->phone))));
        $password = $request->password;

        $userReference = User::query()->find($id);
        $data = [
            'phone' => $phone,
            'password' => $password
        ];

        if(auth()->attempt($data)){
            $user = auth()->user();

            if(!isset($userReference)){
                Toastr::error(translate('messages.affiliate_not_found'));
                return back();
            }
            if(!isset($user)){
                Toastr::error(translate('messages.user_not_found'));
                return back();

            }
            if(isset($user->affiliate) && !empty($user->affiliate)){
                Toastr::error('Você jå esta afiliado a outro cliente.');
                return back();
            }
            if($user->ref_code == $codRef){
                Toastr::error('Você não pode adicionar você mesmo como seu afiliado');
                return back();
            }
            $fcm_token=$userReference->cm_firebase_token;
            $user->affiliate = $userReference->ref_code;
            $user->save();
            {
                $data = [
                    'title' =>translate('messages.affiliate_add'),
                    'description' =>$user->f_name.' '.$user->l_name.', '.translate('messages.message_description_affiliate_add'),
                    'order_id' => '',
                    'image' => '',
                    'message' => json_encode(''),
                    'type'=> 'affiliate',
                    'conversation_id'=> 0,
                    'sender_type'=> 'user'
                ];
                Helpers::send_push_notif_to_device($fcm_token, $data);
            }

            Toastr::success($user->f_name.' '.translate('messages.user_affiliate_success'));
        }else{
            Toastr::error('Não foi possível realizar login, dados incorretos.');
        }
        return back();

    }

    public function affiliates(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'limit' => 'required',
            'offset' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }


        $paginator = User::where('affiliate', $request->user()->ref_code)->latest()->paginate($request->limit, ['*'], 'page', $request->offset);

        $data = [
            'total_size' => $paginator->total(),
            'limit' => $request->limit,
            'offset' => $request->offset,
            'data' => $paginator->items()
        ];
        return response()->json($data, 200);
    }

    public function pay_friend(Request $request): JsonResponse
    {
        $value = $request->value;
        $id = $request->id;
        $msg = $request->message ?? '';
        $user = $request->user();
        $friend = User::query()->find($id);

        $valueInBalance = $user->wallet_balance;
        if($valueInBalance < $value){
            return response()->json([
                'error'=>true,
                'message'=>'insufficient_value_in_portfolio'
            ], 200);
        }
        if($value <= 0.00){
            return response()->json([
                'error'=>true,
                'message'=>'insufficient_value_permission'
            ], 200);
        }
        $user->wallet_balance -= $value;
        $friend->wallet_balance += $value;
        $friend->wallet_balance_received += $value;
        $friend->save();
        $user->save();

        $current_balance = $user->wallet_balance;
        $wallet_transaction = new WalletTransaction();
        $wallet_transaction->user_id = $user->id;
        $wallet_transaction->transaction_id = \Str::uuid();
        $wallet_transaction->description = isset($msg) && !empty($msg) ? 'Voce pagou '.go_name_client($user->f_name, $user->l_name).', msg: '.$msg : 'Voce pagou '.go_name_client($user->f_name, $user->l_name);
        $wallet_transaction->transaction_type = 'payment_sent';
        $wallet_transaction->input = false;
        $wallet_transaction->reference = '...';
        $wallet_transaction->credit = 0.00;
        $wallet_transaction->debit = $value;
        $wallet_transaction->balance = $current_balance;
        $wallet_transaction->created_at = now();
        $wallet_transaction->updated_at = now();
        $wallet_transaction->save();


        $current_balance_friend = $friend->wallet_balance;
        $wallet_transaction_friend = new WalletTransaction();
        $wallet_transaction_friend->user_id = $friend->id;
        $wallet_transaction_friend->transaction_id = \Str::uuid();
        $wallet_transaction_friend->description = isset($msg) && !empty($msg) ? 'Você recebeu de '.go_name_client($user->f_name, $user->l_name).', msg: '.$msg : 'Você recebeu de '.go_name_client($user->f_name, $user->l_name);
        $wallet_transaction_friend->transaction_type = 'payment_received';
        $wallet_transaction_friend->input = true;
        $wallet_transaction_friend->reference = '...';
        $wallet_transaction_friend->credit = $value;
        $wallet_transaction_friend->debit = 0.00;
        $wallet_transaction_friend->balance = $current_balance_friend;
        $wallet_transaction_friend->created_at = now();
        $wallet_transaction_friend->updated_at = now();
        $wallet_transaction_friend->save();

        try{
            $fcm_token = $friend->cm_firebase_token;
            $data = [
                'title' =>translate('messages.payment_receiver'),
                'description' =>$user->f_name.' '.$user->l_name.', '.translate('messages.send_payment'),
                'order_id' => '',
                'image' => '',
                'message' => json_encode(''),
                'type'=> 'affiliate',
                'conversation_id'=> 0,
                'sender_type'=> 'user'
            ];
            Helpers::send_push_notif_to_device($fcm_token, $data);
        }catch (Exception $exception){}

        return response()->json([
            'error'=>false
        ], 200);
    }

    public function affiliate_info(Request $request): JsonResponse
    {
        $user = $request->user();
        $affiliateCode = $user->affiliate;
        if(!isset($affiliateCode)){
            return response()->json(null);
        }
        $affiliate = User::query()->where('ref_code', $affiliateCode)->first();

        return response()->json($affiliate);
    }

    public function search(Request $request): JsonResponse
    {
        $limit = $request['limit']??10;
        $offset = $request['offset']??1;
        $user = $request->user();
        $key = explode(' ', $request['search']);
        $users = User::query();
        $customers = $users
            ->where(function ($q) use ($key) {
                foreach ($key as $value){
                    $q->orWhere('f_name', 'like', "%{$value}%")
                        ->orWhere('l_name', 'like', "%{$value}%")
                        ->orWhere('ref_code', 'like', "%{$value}%");
                }
        });
        $customers = $customers->where('ref_code', '!=', $user->ref_code)->paginate($limit, ['*'], 'page', $offset);
        $data = [
            'total_size' => $customers->total(),
            'limit' => $request->limit,
            'offset' => $request->offset,
            'data' => $customers->items()
        ];
        return response()->json($data);
    }

    public function put_affiliate(Request $request){
        $user = $request->user();
        $codRef = $request->ref_code;
        $userRef = User::query()->where('ref_code', $codRef)->first();
        if(!isset($userRef)){
            return response()->json([
                'error'=>true,
                'message'=>'affiliate_not_exist'
            ], 403);
        }
        if(isset($user->affiliate) && !empty($user->affiliate)){
            return response()->json([
                'error'=>true,
                'message'=>'user_affiliate_exist'
            ], 403);
        }
        if($user->ref_code == $codRef){
            return response()->json([
                'error'=>true,
                'message'=>'you_cannot_add_yourself_as_your_affiliate'
            ], 403);
        }
        $user->affiliate = $codRef;
        $user->save();

        try{
            $fcm_token=$userRef->cm_firebase_token;
            $data = [
                'title' =>translate('messages.affiliate_add'),
                'description' =>$user->f_name.' '.$user->l_name.', '.translate('messages.message_description_affiliate_add'),
                'order_id' => '',
                'image' => '',
                'message' => json_encode(''),
                'type'=> 'affiliate',
                'conversation_id'=> 0,
                'sender_type'=> 'user'
            ];
            Helpers::send_push_notif_to_device($fcm_token, $data);
        }catch (Exception $exception){}

        return response()->json([
            'error'=>false,
            'data'=>$userRef
        ]);
    }

}
