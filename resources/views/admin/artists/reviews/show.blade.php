@extends('admin.layouts.app')
@section('content')
    <!-- BEGIN PAGE CONTAINER-->
    <div class="page-content">
        <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
        <div id="portlet-config" class="modal hide">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"></button>
                <h3>Widget Settings</h3>
            </div>
            <div class="modal-body"> Widget settings form goes here </div>
        </div>
        <div class="clearfix"></div>
        <div class="content">
            <div class="page-title">
                <h3>Review </h3>
                <a type="button" class="btn btn-success pull-right" href="{{ route('profiles.edit', ['artist' => $artist->user->id, 'profileid' => $artist->id]) }}">Back</a>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <a type="button" class="btn  btn-cons pull-left"
                       href="{{ route('showvideo', ['artist' => $artist->user->id, 'profileid' => $artist->id]) }}">ADD
                        VIDEOS</a> &nbsp; &nbsp;
                    <a type="button" class="btn  btn-cons pull-left"
                       href="{{ route('showimage', ['artist' => $artist->user->id, 'profileid' => $artist->id]) }}">ADD
                        IMAGES</a> &nbsp; &nbsp;
                    <a type="button" class="btn  btn-cons pull-left"
                       href="{{ route('showmusic', ['artist' => $artist->user->id, 'profileid' => $artist->id]) }}">ADD
                        MUSIC</a> &nbsp; &nbsp;
                    <a type="button" class="btn  btn-cons pull-left"
                       href="{{ route('showsocial', ['artist' => $artist->user->id, 'profileid' => $artist->id]) }}">ADD
                        SOCIAL ACCOUNTS</a> &nbsp; &nbsp;
                    <a type="button" class="btn  btn-cons pull-left"
                       href="{{ route('showpricing', ['artist' =>  $artist->user->id, 'profileid' => $artist->id]) }}">ADD
                        LOCATION & PRICES</a> &nbsp; &nbsp;
                    <a type="button" class="btn  btn-cons pull-left"
                       href="{{ route('showrepertorie', ['artist' =>  $artist->user->id, 'profileid' => $artist->id]) }}">ADD
                        Repertorie</a> &nbsp; &nbsp;
                    <a type="button" class="btn  btn-cons pull-left"
                       href="{{ route('showinfo', ['artist' =>  $artist->user->id, 'profileid' => $artist->id]) }}">ADD
                        Info</a> &nbsp; &nbsp;
                    <a type="button" class="btn  btn-cons pull-left active" style=""
                       href="{{ route('addReview', ['artist' =>  $artist->user->id, 'profileid' => $artist->id]) }}">REVIEW</a> &nbsp; &nbsp;
                </div>
            </div>
            <!-- ID CONTAINER -->
            <div id="container">
                <!-- MY TABLE -->
                <div class="row-fluid">
                    <div class="span12">
                        <div class="grid simple ">
                            <div class="grid-title">
                                <h4>
                                    <span class="semi-bold">Reviews</span>
                                </h4>
                            </div>
                            <div class="grid-body ">
                                <div class="row">
                                    <form action="{{ route('storeReview', ['artist' => $artist->user->id, 'profileid' => $artist->id]) }}" method="POST" enctype="multipart/form-data">
                                        @csrf
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label for="about">Title</label>
                                                <input type="text" name="title" id="title" cols="30" rows="3" style="width: 100%">
                                            </div>
                                            <div class="form-group">
                                                <label for="review">Review</label>
                                                <textarea name="review" id="review" cols="30" rows="3" style="width: 100%"></textarea>
                                            </div>
                                            @error('features')
                                            <span class="error">
                                            <strong>{{ 'This field is requied.' }}</strong>
                                        </span>
                                            @enderror
                                        </div>

                                        <div class="clearfix"></div>
                                        <div class="col-md-12">
                                            <p>
                                                <button type="submit" class="btn btn-danger">Add Review</button>
                                            </p>
                                        </div>
                                    </form>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div id="example1" class="list-group col">

                                            @foreach ($info as $infos)
                                                <div class="list-group-item" style="overflow: hidden">
                                                    <div class="col-md-4">
                                                <span class="">
                                                    <textarea name="features" id="infof{{ $infos->id }}" rows="7" style="min-width: 100%; max-width: 100%">{{ $infos->title }}</textarea>
                                                </span>
                                                    </div>
                                                    <div class="col-md-5">
                                                <span class="">
                                                    <textarea name="about" id="info{{ $infos->id }}" rows="7" style="min-width: 100%; max-width: 100%">{{ $infos->review }}</textarea>
                                                </span>
                                                    </div>
                                                    <div class="col-md-3">
                                                <span class="text-center">
                                                    <a onclick="editaddon({{ $artist->id }}, {{ $infos->id }})" class="btn btn-danger">Save</a>
                                                    <a onclick="deleteaddon({{ $artist->id }}, {{ $infos->id }})" class="btn btn-secondary">Delete</a>
                                                    <span>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END OF MY TABLE -->
                <div class="MY LOCK" style="display:none">
                    <div id="chart"> </div>
                    <div id="world-map" style="height:405px"></div>
                    <div id="mini-chart-orders"></div>
                    <div id="mini-chart-other"></div>
                    <div id="ricksaw"></div>
                    <div id="legend"></div>
                    <canvas id="wind" width="32" height="32"></canvas>
                    <canvas id="rain" width="32" height="32"></canvas>
                    <canvas id="partly-cloudy-day" width="120" height="120"></canvas>
                </div>
            </div>
            <!-- END PAGE -->
        </div>
    </div>
    <!-- END CONTAINER -->
@endsection
@section('scripts')
    <script src="{{ asset('adminn/assets/js/Sortable.js') }}" type="text/javascript"></script>
    <script>
        var example1 = document.getElementById('example1');

        new Sortable(example1, {
            animation: 150
            , ghostClass: 'blue-background-class',
            handle: '.handle',
        });

    </script>
{{--    <script>--}}
{{--        function editaddon(artistid, infoid) {--}}
{{--            info = $('#info' + infoid).val();--}}
{{--            infof = $('#infof' + infoid).val();--}}
{{--            if (info == '') {--}}
{{--                $('#info' + infoid).addClass('has-error');--}}
{{--                $('#infof' + infoid).addClass('has-error');--}}
{{--                return;--}}
{{--            }--}}
{{--            $.ajax({--}}
{{--                url: "editinfo"--}}
{{--                , type: 'get'--}}
{{--                , dataType: "JSON"--}}
{{--                , data: {--}}
{{--                    "infof":infof,--}}
{{--                    "info": info--}}
{{--                    , 'artistid': artistid--}}
{{--                    , 'infoid': infoid--}}
{{--                    , }--}}
{{--                , success: function() {--}}
{{--                    location.reload();--}}
{{--                }--}}
{{--            });--}}
{{--        }--}}

{{--        function deleteaddon(artistid, infoid) {--}}
{{--            info = $('#info' + infoid).val();--}}
{{--            infof = $('#infof' + infoid).val();--}}
{{--            $.ajax({--}}
{{--                url: "deleteinfo"--}}
{{--                , type: 'get'--}}
{{--                , dataType: "JSON"--}}
{{--                , data: {--}}
{{--                    "infof":infof,--}}
{{--                    "info": info--}}
{{--                    , 'artistid': artistid--}}
{{--                    , 'infoid': infoid--}}
{{--                    , }--}}
{{--                , success: function() {--}}
{{--                    location.reload();--}}
{{--                }--}}
{{--            });--}}
{{--        }--}}

{{--    </script>--}}
    <script>
        $(document).ready(function () {
            @if ($msg = Session::get('success'))
            Messenger().post({
                message: "{{$msg}}",
                type: 'success',
                showCloseButton: true
            });
            @elseif($msg = Session::get('error'))
            Messenger().post({
                message: "{{$msg}}",
                type: 'error',
                showCloseButton: true
            });
            @endif
        });

    </script>

@endsection
@section('styles')
    <link rel="stylesheet" href="{{ asset('adminn/assets/css/sotable.css') }}">
    <style>
        .has-error {
            border: 1px solid red !important;
        }

    </style>
@endsection
