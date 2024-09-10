@extends('admin.layouts.app')
@section('content')
    <!-- BEGIN PAGE -->

    <div class="page-content">
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="grid simple">
                        <div class="grid-body no-border" style="min-height: 850px;">
                            <br>
                            <form action="{{ route('store_quote') }}" method="POST" enctype="multipart/form-data">
                                @csrf

                                <div class="row-fluid">

                                    <h2>Quote </h2>
                                    <div class="row">
                                        <form
                                            action="{{ route('store_quote') }}"
                                            method="POST" enctype="multipart/form-data">
                                            @csrf
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="galleryimage">You can only upload jpg, png file.</label>
                                                    <input type="file" id="galleryimage" name="galleryimage"
                                                           accept="image/png, image/jpeg" class="file">
                                                    @error('galleryimage')
                                                    <span class="error">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="gallerytitle">Title</label>
                                                    <textarea rows="5" type="text" id="title" name="title"
                                                              style="width: 100%"></textarea>
                                                    @error('gallerytitle')
                                                    <span class="error">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="clearfix"></div>
                                            <div class="col-md-12">

                                                <button type="submit" class="btn btn-danger">Upload Image</button>
                                            </div>
                                        </form>
                                    </div>
                                    <br/>
                                    <div class="row">

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div id="example1" class="list-group col">

                                                    @foreach ($quotes as $quote)
                                                        <div class="list-group-item" style="overflow: hidden">
                                                            <div class="col-md-4">
                                                <span class="">
                                                    <input type="text" name="name" id="name_{{ $quote->id }}"
                                                           value="{{ $quote->title }}"
                                                           style="min-width: 100%; max-width: 100%">
                                                </span>
                                                            </div>
                                                            <div class="col-md-5">
                                                                <a href="{{ url('uploads') . '/' . $quote->url }}"
                                                                   target="_blank">
                                                                    <div class="thumbnail">
                                                                        <img
                                                                            src="{{ url('uploads') . '/' . $quote->url }}"
                                                                            alt=""
                                                                            width="200">
                                                                        <?php list($width, $height) = getimagesize(public_path('uploads/'.$quote->url)); ?>
                                                                        <div class="caption text-center">
                                                                            Dimention: {{ $width.' X '.$height }}</div>
                                                                    </div>
                                                                </a>
                                                            </div>

                                                            <div class="col-md-2">
                                                <span class="text-center">
{{--                                                    <a onclick="editReview({{ $quote->id }})" class="btn btn-danger">Edit</a>--}}
{{--                                                    <a onclick="deleteReview({{ $quote->id }})"--}}
{{--                                                       class="btn btn-secondary">Delete</a>--}}
                                                    </span>
                                                            </div>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <br/>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- END PAGE -->
        @endsection

        @section('scripts')
            {{--    <script src="{{ asset('adminn/assets/plugins/jquery-1.8.3.min.js') }}" type="text/javascript"></script>--}}

            <script src="{{ asset('adminn/assets/js/bootstrap-filestyle.min.js') }}"></script>
            <script>
                $('.file').filestyle({
                    buttonName: 'btn-danger',
                    buttonText: ' Open'
                });
            </script>


            <script src="{{ asset('adminn/assets/plugins/data-tables/datatables.min.js') }}"
                    type="text/javascript"></script>
            <script src="{{ asset('adminn/assets/plugins/data-tables/datatables.bootstrap.js') }}"
                    type="text/javascript"></script>
            <script src="{{ asset('adminn/assets/js/table-datatables-responsive.js') }}"></script>

            <script src="{{ asset('adminn/assets/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js') }}"
                    type="text/javascript"></script>
            <script src="{{ asset('adminn/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js') }}"></script>
            {{--            type="text/javascript">--}}
            {{--    </script>--}}
            <script src="{{ asset('adminn/assets/js/bootstrap-filestyle.min.js') }}"></script>
            @if ($msg = Session::get('success'))
                <script>
                    $(document).ready(function () {
                        Messenger().post({
                            message: "{{$msg}}",
                            type: 'success',
                            showCloseButton: true
                        });
                    });
                </script>
            @endif



        @endsection

        @section('styles')

            <link href="{{ asset('adminn/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css') }}"
                  rel="stylesheet"
                  type="text/css"/>
@endsection
