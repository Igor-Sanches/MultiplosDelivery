<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ModuleZone;
use Illuminate\Http\Request;
use App\Models\Zone;
use Brian2694\Toastr\Facades\Toastr;
use Grimzy\LaravelMysqlSpatial\Types\Point;
use Grimzy\LaravelMysqlSpatial\Types\Polygon;
use Grimzy\LaravelMysqlSpatial\Types\LineString;
use App\CentralLogics\Helpers;
use Rap2hpoutre\FastExcel\FastExcel;

class ZoneController extends Controller
{
    public function index()
    {
        $zones = Zone::with('modules')->withCount(['stores','deliverymen'])->latest()->paginate(config('default_pagination'));
        return view('admin-views.zone.index', compact('zones'));
    }

    public function edit_delivery_fee($id){
        $zone=Zone::with('modules')->findOrFail($id);
        $modules = $zone->modules;
        return view('admin-views.zone.edit-delivery-fee', compact('modules'));
    }

    public function update_delivery_fee(Request $request){
        $zone_id = $request->zone_id;
        $module_id = $request->module_id;
        $per_km_shipping_charge = $request->per_km_shipping_charge;
        $minimum_shipping_charge = $request->minimum_shipping_charge;

        $moduleZone = ModuleZone::query()->where('zone_id', $zone_id)->where('module_id', $module_id)->first();
        if(isset($moduleZone)){
            $moduleZone->per_km_shipping_charge = $per_km_shipping_charge;
            $moduleZone->minimum_shipping_charge = $minimum_shipping_charge;
            $moduleZone->save();
            Toastr::success(trans('messages.module_saved_successfully'));
            return back();
        }
        Toastr::error(trans('messages.module_not_fount'));
        return back();
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:zones|max:191',
            'coordinates' => 'required',
            'cash_on_delivery' => 'required',
            'payment_credit_card_offline' => 'required_without:cash_on_delivery,payment_pix_offline,payment_debit_card_offline',
            'payment_debit_card_offline' => 'required_without:cash_on_delivery,payment_credit_card_offline,payment_pix_offline',
            'payment_pix_offline' => 'required_without:cash_on_delivery,payment_credit_card_offline,payment_debit_card_offline',
        ]);

        $value = $request->coordinates;
        foreach(explode('),(',trim($value,'()')) as $index=>$single_array){
            if($index == 0)
            {
                $lastcord = explode(',',$single_array);
            }
            $coords = explode(',',$single_array);
            $polygon[] = new Point($coords[0], $coords[1]);
        }
        $zone_id=Zone::all()->count() + 1;
        $polygon[] = new Point($lastcord[0], $lastcord[1]);
        $zone = new Zone();
        $zone->name = $request->name;
        $zone->coordinates = new Polygon([new LineString($polygon)]);
        $zone->store_wise_topic =  'zone_'.$zone_id.'_store';
        $zone->customer_wise_topic = 'zone_'.$zone_id.'_customer';
        $zone->deliveryman_wise_topic = 'zone_'.$zone_id.'_delivery_man';
        $zone->cash_on_delivery = $request->cash_on_delivery?1:0;
        $zone->payment_credit_card_offline = $request->payment_credit_card_offline?1:0;
        $zone->payment_debit_card_offline = $request->payment_debit_card_offline?1:0;
        $zone->payment_pix_offline = $request->payment_pix_offline?1:0;
        $zone->save();

        Toastr::success(translate('messages.zone_added_successfully'));
        return back();
    }

    public function edit($id)
    {
        if(env('APP_MODE')=='demo' && $id == 1)
        {
            Toastr::warning(translate('messages.you_can_not_edit_this_zone_please_add_a_new_zone_to_edit'));
            return back();
        }
        $zone=Zone::selectRaw("*,ST_AsText(ST_Centroid(`coordinates`)) as center")->findOrFail($id);
        // dd($zone->coordinates);
        return view('admin-views.zone.edit', compact('zone'));
    }

    public function module_setup($id)
    {
        $zone=Zone::with('modules')->findOrFail($id);
        return view('admin-views.zone.module-setup', compact('zone'));
    }

    public function module_update(Request $request, $id)
    {
        $zone=Zone::findOrFail($id);
        $zone->modules()->sync($request->module_data);
        $zone->save();
        Toastr::success(translate('messages.zone_module_updated_successfully'));
        return redirect()->route('admin.zone.home');
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|max:191|unique:zones,name,'.$id,
            'coordinates' => 'required',
        ]);
        $value = $request->coordinates;
        foreach(explode('),(',trim($value,'()')) as $index=>$single_array){
            if($index == 0)
            {
                $lastcord = explode(',',$single_array);
            }
            $coords = explode(',',$single_array);
            $polygon[] = new Point($coords[0], $coords[1]);
        }
        $polygon[] = new Point($lastcord[0], $lastcord[1]);
        $zone=Zone::findOrFail($id);
        $zone->name = $request->name;
        $zone->coordinates = new Polygon([new LineString($polygon)]);
        $zone->store_wise_topic =  'zone_'.$id.'_store';
        $zone->customer_wise_topic = 'zone_'.$id.'_customer';
        $zone->deliveryman_wise_topic = 'zone_'.$id.'_delivery_man';
        $zone->cash_on_delivery = $request->cash_on_delivery?1:0;
        $zone->payment_credit_card_offline = $request->payment_credit_card_offline?1:0;
        $zone->payment_debit_card_offline = $request->payment_debit_card_offline?1:0;
        $zone->payment_pix_offline = $request->payment_pix_offline?1:0;
        $zone->save();
        Toastr::success(translate('messages.zone_updated_successfully'));
        return redirect()->route('admin.zone.home');
    }

    public function destroy(Zone $zone)
    {
        if(env('APP_MODE')=='demo' && $zone->id == 1)
        {
            Toastr::warning(translate('messages.you_can_not_delete_this_zone_please_add_a_new_zone_to_delete'));
            return back();
        }
        $zone->delete();
        Toastr::success(translate('messages.zone_deleted_successfully'));
        return back();
    }

    public function status(Request $request)
    {
        if(env('APP_MODE')=='demo' && $request->id == 1)
        {
            Toastr::warning('Sorry!You can not inactive this zone!');
            return back();
        }
        $zone = Zone::findOrFail($request->id);
        $zone->status = $request->status;
        $zone->save();
        Toastr::success(translate('messages.zone_status_updated'));
        return back();
    }

    public function search(Request $request){
        $key = explode(' ', $request['search']);
        $zones=Zone::withCount(['stores','deliverymen'])->where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('name', 'like', "%{$value}%");
            }
        })->limit(50)->get();
        return response()->json([
            'view'=>view('admin-views.zone.partials._table',compact('zones'))->render(),
            'total'=>$zones->count()
        ]);
    }

    public function get_coordinates($id){
        $zone=Zone::withoutGlobalScopes()->selectRaw("*,ST_AsText(ST_Centroid(`coordinates`)) as center")->findOrFail($id);
        $data = Helpers::format_coordiantes($zone->coordinates[0]);
        $center = (object)['lat'=>(float)trim(explode(' ',$zone->center)[1], 'POINT()'), 'lng'=>(float)trim(explode(' ',$zone->center)[0], 'POINT()')];
        return response()->json(['coordinates'=>$data, 'center'=>$center]);
    }

    public function zone_filter($id)
    {
        if($id == 'all')
        {
            if(session()->has('zone_id')){
                session()->forget('zone_id');
            }
        }
        else{
            session()->put('zone_id', $id);
        }

        return back();
    }

    public function get_all_zone_cordinates($id = 0)
    {
        $zones = Zone::where('id', '<>', $id)->active()->get();
        $data = [];
        foreach($zones as $zone)
        {
            $data[] = Helpers::format_coordiantes($zone->coordinates[0]);
        }
        return response()->json($data,200);
    }

    public function export($type){
        $collection = Zone::withCount(['stores','deliverymen'])->get();

        if($type == 'excel'){
            return (new FastExcel($collection))->download('Zones.xlsx');
        }elseif($type == 'csv'){
            return (new FastExcel($collection))->download('Zones.csv');
        }
    }
}
