@extends('layouts.admin.app')

@section('title',translate('messages.config_zone'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-header-title">
                <span class="page-header-icon">
                    <img src="{{my_asset('assets/admin/img/zone.png')}}" class="w--26" alt="">
                </span>
                <span>
                    {{translate('messages.config_zone')}}
                </span>
            </h1>
        </div>
        <!-- End Page Header -->
        <div class="row g-3">
            <div class="col-12">
                <div class="card">
                    <div class="card-header py-2 border-0">
                        <div class="search--button-wrapper">
                            <h5 class="card-title">
                                {{translate('messages.zone')}} {{translate('messages.list')}}<span class="badge badge-soft-dark ml-2" id="itemCount">{{$modules->count()}}</span>
                            </h5>
                            <form action="javascript:" id="search-form"  class="search-form">
                                <!-- Search -->
                                @csrf
                                <div class="input-group input--group">
                                    <input id="datatableSearch_" type="search" name="search" class="form-control"
                                           placeholder="{{translate('messages.ex_search_name')}}" aria-label="{{translate('messages.search')}}" required>
                                    <button type="submit" class="btn btn--secondary"><i class="tio-search"></i></button>

                                </div>
                                <!-- End Search -->
                            </form>
                            <!-- Unfold -->
                            <div class="hs-unfold mr-2">
                                <a class="js-hs-unfold-invoker btn btn-sm btn-white dropdown-toggle min-height-40" href="javascript:;"
                                   data-hs-unfold-options='{
                                            "target": "#usersExportDropdown",
                                            "type": "css-animation"
                                        }'>
                                    <i class="tio-download-to mr-1"></i> {{ translate('messages.export') }}
                                </a>

                                <div id="usersExportDropdown"
                                     class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-sm-right">
                                    {{-- <span class="dropdown-header">{{ translate('messages.options') }}</span>
                                    <a id="export-copy" class="dropdown-item" href="javascript:;">
                                        <img class="avatar avatar-xss avatar-4by3 mr-2"
                                            src="{{ my_asset('assets/admin') }}/svg/illustrations/copy.svg"
                                            alt="Image Description">
                                        {{ translate('messages.copy') }}
                                    </a>
                                    <a id="export-print" class="dropdown-item" href="javascript:;">
                                        <img class="avatar avatar-xss avatar-4by3 mr-2"
                                            src="{{ my_asset('assets/admin') }}/svg/illustrations/print.svg"
                                            alt="Image Description">
                                        {{ translate('messages.print') }}
                                    </a>
                                    <div class="dropdown-divider"></div> --}}
                                    <span class="dropdown-header">{{ translate('messages.download') }}
                                        {{ translate('messages.options') }}</span>
                                    <a id="export-excel" class="dropdown-item" href="{{route('admin.zone.export', ['type'=>'excel'])}}">
                                        <img class="avatar avatar-xss avatar-4by3 mr-2"
                                             src="{{ my_asset('assets/admin') }}/svg/components/excel.svg"
                                             alt="Image Description">
                                        {{ translate('messages.excel') }}
                                    </a>
                                    <a id="export-csv" class="dropdown-item" href="{{route('admin.zone.export', ['type'=>'csv'])}}">
                                        <img class="avatar avatar-xss avatar-4by3 mr-2"
                                             src="{{ my_asset('assets/admin') }}/svg/components/placeholder-csv-format.svg"
                                             alt="Image Description">
                                        .{{ translate('messages.csv') }}
                                    </a>
                                    {{-- <a id="export-pdf" class="dropdown-item" href="javascript:;">
                                        <img class="avatar avatar-xss avatar-4by3 mr-2"
                                            src="{{ my_asset('assets/admin') }}/svg/components/pdf.svg"
                                            alt="Image Description">
                                        {{ translate('messages.pdf') }}
                                    </a> --}}
                                </div>
                            </div>
                            <!-- End Unfold -->
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
                                <th class="border-0">{{translate('messages.id')}}</th>
                                <th class="border-0" >{{translate('messages.name')}}</th>
                                <th class="border-0" >{{translate('messages.type')}}</th>
                                <th class="border-0" >{{translate('messages.per_km_shipping_charge')}}</th>
                                <th class="border-0" >{{translate('messages.minimum_shipping_charge')}}</th>
                                <th class="border-0 text-center" >{{translate('messages.action')}}</th>
                            </tr>
                            </thead>

                            <tbody id="set-rows">
                            @foreach($modules as $key=>$module)
                                <tr>
                                    <td>{{$module->id}}</td>
                                    <td>
                                    <span class="d-block font-size-sm text-body">
                                        {{$module['module_name']}}
                                    </span>
                                    </td>
                                    <td>
                                        <span class="d-block font-size-sm text-body">
                                        {{$module['module_type']}}
                                    </span>

                                    </td>
                                    <td>
                                        R$ {{number_format($module->pivot->per_km_shipping_charge, 2)}}
                                    </td>
                                    <td>
                                        R$ {{number_format($module->pivot->minimum_shipping_charge, 2)}}
                                    </td>
                                    <td>
                                        <a class="btn action-btn btn--primary btn-outline-primary"
                                           onclick="openDialog('{{$module->pivot->module_id}}', '{{$module->pivot->zone_id}}', '{{$module->pivot->per_km_shipping_charge}}', '{{$module->pivot->minimum_shipping_charge}}')" title="{{translate('messages.edit')}} {{translate('messages.zone')}}"><i class="tio-edit"></i>
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                        @if(count($modules) !== 0)
                            <hr>
                        @endif
                        @if(count($modules) === 0)
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
            <!-- End Table -->
        </div>
    </div>

    <div class="modal fade" id="update-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="h3 mb-0">{{ translate('messages.edit_bank_info') }}</h1>
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true" class="btn btn--circle btn-soft-danger text-danger"><ti class="tio-clear"></ti></span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{route('admin.zone.update-delivery-fee')}}" method="post"
                          enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" id="zone_id" name="zone_id">
                        <input type="hidden" id="module_id" name="module_id">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="per_km_shipping_charge">{{translate('messages.per_km_shipping_charge')}}<span class="text-danger">*</span></label>
                                    <input type="text" name="per_km_shipping_charge" class="form-control"
                                           id="per_km_shipping_charge"
                                           required maxlength="191">
                                </div>
                                <div class="col-md-6">
                                    <label for="minimum_shipping_charge">{{translate('messages.minimum_shipping_charge')}}<span class="text-danger">*</span></label>
                                    <input type="text" name="minimum_shipping_charge" class="form-control"
                                           id="minimum_shipping_charge"
                                           required maxlength="191">
                                </div>
                            </div>
                        </div>
                        <div class="btn--container justify-content-end">
                            <button type="reset" class="btn btn--reset">{{translate('messages.reset')}}</button>
                            <button type="submit" class="btn btn--primary" id="btn_update">{{translate('messages.update')}}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script_2')
    <script>

        function openDialog(module_id, zone_id, per_km_shipping_charge, minimum_shipping_charge){
            const modal = $('#update-modal');
            const module_id_input = document.getElementById('module_id')
            module_id_input.value = module_id;
            const zone_id_input = document.getElementById('zone_id')
            zone_id_input.value = zone_id;
            const per_km_shipping_charge_input = document.getElementById('per_km_shipping_charge')
            per_km_shipping_charge_input.value = per_km_shipping_charge;
            const minimum_shipping_charge_input = document.getElementById('minimum_shipping_charge')
            minimum_shipping_charge_input.value = minimum_shipping_charge;
            modal.modal('show');

        }

        function status_form_alert(id, message, e) {
            e.preventDefault();
            Swal.fire({
                title: '{{translate('messages.are_you_sure')}}',
                text: message,
                type: 'warning',
                showCancelButton: true,
                cancelButtonColor: 'default',
                confirmButtonColor: '#FC6A57',
                cancelButtonText: '{{ translate('messages.no') }}',
                confirmButtonText: '{{ translate('messages.Yes') }}',
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    $('#'+id).submit()
                }
            })
        }
        auto_grow();
        function auto_grow() {
            let element = document.getElementById("coordinates");
            element.style.height = "5px";
            element.style.height = (element.scrollHeight)+"px";
        }

    </script>
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

            $("#zone_form").on('keydown', function(e){
                if (e.keyCode === 13) {
                    e.preventDefault();
                }
            })
        });
    </script>

    <script async defer src="https://maps.googleapis.com/maps/api/js?key={{\App\Models\BusinessSetting::where('key', 'map_api_key')->first()->value}}&callback=initialize&libraries=drawing,places&v=3.49"></script>

    <script>
        var map; // Global declaration of the map
        var drawingManager;
        var lastpolygon = null;
        var polygons = [];

        function resetMap(controlDiv) {
            // Set CSS for the control border.
            const controlUI = document.createElement("div");
            controlUI.style.backgroundColor = "#fff";
            controlUI.style.border = "2px solid #fff";
            controlUI.style.borderRadius = "3px";
            controlUI.style.boxShadow = "0 2px 6px rgba(0,0,0,.3)";
            controlUI.style.cursor = "pointer";
            controlUI.style.marginTop = "8px";
            controlUI.style.marginBottom = "22px";
            controlUI.style.textAlign = "center";
            controlUI.title = "Reset map";
            controlDiv.appendChild(controlUI);
            // Set CSS for the control interior.
            const controlText = document.createElement("div");
            controlText.style.color = "rgb(25,25,25)";
            controlText.style.fontFamily = "Roboto,Arial,sans-serif";
            controlText.style.fontSize = "10px";
            controlText.style.lineHeight = "16px";
            controlText.style.paddingLeft = "2px";
            controlText.style.paddingRight = "2px";
            controlText.innerHTML = "X";
            controlUI.appendChild(controlText);
            // Setup the click event listeners: simply set the map to Chicago.
            controlUI.addEventListener("click", () => {
                lastpolygon.setMap(null);
                $('#coordinates').val('');

            });
        }

        function initialize() {
            @php($default_location=\App\Models\BusinessSetting::where('key','default_location')->first())
            @php($default_location=$default_location->value?json_decode($default_location->value, true):0)
            var myLatlng = { lat: {{$default_location?$default_location['lat']:'23.757989'}}, lng: {{$default_location?$default_location['lng']:'90.360587'}} };


            var myOptions = {
                zoom: 13,
                center: myLatlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);
            drawingManager = new google.maps.drawing.DrawingManager({
                drawingMode: google.maps.drawing.OverlayType.POLYGON,
                drawingControl: true,
                drawingControlOptions: {
                    position: google.maps.ControlPosition.TOP_CENTER,
                    drawingModes: [google.maps.drawing.OverlayType.POLYGON]
                },
                polygonOptions: {
                    editable: true
                }
            });
            drawingManager.setMap(map);


            //get current location block
            // infoWindow = new google.maps.InfoWindow();
            // Try HTML5 geolocation.
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    (position) => {
                        const pos = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude,
                        };
                        map.setCenter(pos);
                    });
            }

            drawingManager.addListener("overlaycomplete", function(event) {
                if(lastpolygon)
                {
                    lastpolygon.setMap(null);
                }
                $('#coordinates').val(event.overlay.getPath().getArray());
                lastpolygon = event.overlay;
                auto_grow();
            });

            const resetDiv = document.createElement("div");
            resetMap(resetDiv, lastpolygon);
            map.controls[google.maps.ControlPosition.TOP_CENTER].push(resetDiv);

            // Create the search box and link it to the UI element.
            const input = document.getElementById("pac-input");
            const searchBox = new google.maps.places.SearchBox(input);
            map.controls[google.maps.ControlPosition.TOP_CENTER].push(input);
            // Bias the SearchBox results towards current map's viewport.
            map.addListener("bounds_changed", () => {
                searchBox.setBounds(map.getBounds());
            });
            let markers = [];
            // Listen for the event fired when the user selects a prediction and retrieve
            // more details for that place.
            searchBox.addListener("places_changed", () => {
                const places = searchBox.getPlaces();

                if (places.length == 0) {
                    return;
                }
                // Clear out the old markers.
                markers.forEach((marker) => {
                    marker.setMap(null);
                });
                markers = [];
                // For each place, get the icon, name and location.
                const bounds = new google.maps.LatLngBounds();
                places.forEach((place) => {
                    if (!place.geometry || !place.geometry.location) {
                        console.log("Returned place contains no geometry");
                        return;
                    }
                    const icon = {
                        url: place.icon,
                        size: new google.maps.Size(71, 71),
                        origin: new google.maps.Point(0, 0),
                        anchor: new google.maps.Point(17, 34),
                        scaledSize: new google.maps.Size(25, 25),
                    };
                    // Create a marker for each place.
                    markers.push(
                        new google.maps.Marker({
                            map,
                            icon,
                            title: place.name,
                            position: place.geometry.location,
                        })
                    );

                    if (place.geometry.viewport) {
                        // Only geocodes have viewport.
                        bounds.union(place.geometry.viewport);
                    } else {
                        bounds.extend(place.geometry.location);
                    }
                });
                map.fitBounds(bounds);
            });
        }

        // initialize();


        function set_all_zones()
        {
            $.get({
                url: '{{route('admin.zone.zoneCoordinates')}}',
                dataType: 'json',
                success: function (data) {
                    for(var i=0; i<data.length;i++)
                    {
                        polygons.push(new google.maps.Polygon({
                            paths: data[i],
                            strokeColor: "#FF0000",
                            strokeOpacity: 0.8,
                            strokeWeight: 2,
                            fillColor: "#FF0000",
                            fillOpacity: 0.1,
                        }));
                        polygons[i].setMap(map);
                    }

                },
            });
        }
        $(document).on('ready', function(){
            set_all_zones();
        });

    </script>
    <script>
        $('#search-form').on('submit', function () {
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{route('admin.zone.search')}}',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('#set-rows').html(data.view);
                    $('#itemCount').html(data.total);
                    $('.page-area').hide();
                },
                complete: function () {
                    $('#loading').hide();
                },
            });
        });
    </script>
    <script>
        $('#reset_btn').click(function(){
            $('#name').val(null);
            $('#minimum_delivery_charge').val(null);
            $('#delivery_charge_per_km').val(null);

            lastpolygon.setMap(null);
            $('#coordinates').val(null);
        })
    </script>
@endpush
