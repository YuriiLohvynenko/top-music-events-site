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
                            <div class="row-fluid">
                                <form action="{{ route('store_footer') }}" method="POST" enctype="multipart/form-data">
                                    <h2>Footer </h2>
                                    @csrf
                                    <div class="row">
                                        <div class="form-group col-md-8">
                                            <label class="form-label"> Copyrights</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="copyrights" required>
                                            </div>
                                            @error('title')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-8">
                                            <label class="form-label"> Facebook</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="facebook" >
                                            </div>
                                            @error('title')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-8">
                                            <label class="form-label"> Twitter</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="twitter" >
                                            </div>
                                            @error('title')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-8">
                                            <label class="form-label"> Youtube</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="youtube" >
                                            </div>
                                            @error('title')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-8">
                                            <label class="form-label"> Instagram</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="instagram" >
                                            </div>
                                            @error('title')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-8">
                                            <label class="form-label"> Google+</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="google" >
                                            </div>
                                            @error('title')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-8">
                                            <label class="form-label"> LinkedIn</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="linkedin" >
                                            </div>
                                            @error('title')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-8">
                                            <label class="form-label"> Pinterest</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="pinterest" >
                                            </div>
                                            @error('title')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="row" style="margin-top: 40px">
                                        <div class="col-md-12 pull-right">
                                            <button class="btn btn-danger btn-cons btn-add" type="submit">
                                                <i class="icon-envelope"></i> SAVE PAGE
                                            </button>
                                            <a class="btn btn-danger btn-cons btn-add"
                                               href="{{ route('add_footer') }}">
                                                <i class="icon-envelope"></i> CANCEL
                                            </a>
                                        </div>
                                    </div>


                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- END PAGE -->
@endsection

@section('scripts')
    {{--    <script src="{{ asset('adminn/assets/plugins/jquery-1.8.3.min.js') }}" type="text/javascript"></script>--}}




    <script src="{{ asset('adminn/assets/plugins/data-tables/datatables.min.js') }}" type="text/javascript"></script>
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

    <link href="{{ asset('adminn/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css') }}" rel="stylesheet"
          type="text/css"/>
@endsection
