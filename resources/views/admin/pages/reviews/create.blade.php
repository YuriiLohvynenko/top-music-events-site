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
                                <form action="{{ route('store_clients') }}" method="POST" enctype="multipart/form-data">
                                    <h2>What Our Clients Say </h2>
                                    @csrf
                                    <div class="row">
                                        <div class="form-group col-md-8">
                                            <label class="form-label"> Name / Title</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="title">
                                            </div>
                                            @error('title')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="form-group col-md-8" id="page_content">
                                            <label class="form-label">Review:</label>
                                            <textarea class="form-control" id="content" name="content"
                                                      rows="7"></textarea>
                                            @error('content')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-4">
                                            <label class="main-title">Order</label>
                                            <div class="controls">
                                                <select id="order" name="order" type="text" class="form-control">
                                                    <option>Sort Order</option>
                                                    @for($i=1 ; $i <=100; $i++)
                                                        <option value="{{$i}}">{{ $i }}</option>
                                                    @endfor
                                                </select>
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
                                               href="{{ route('clients_reviews') }}">
                                                <i class="icon-envelope"></i> CANCEL
                                            </a>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div id="example1" class="list-group col">

                                                @foreach ($reviews as $review)
                                                    <div class="list-group-item" style="overflow: hidden">
                                                        <div class="col-md-4">
                                                <span class="">
                                                    <input type="text" name="name" id="name_{{ $review->id }}"
                                                           value="{{ $review->title }}"
                                                           style="min-width: 100%; max-width: 100%">
                                                </span>
                                                        </div>
                                                        <div class="col-md-5">
                                                <span class="">
                                                    <input type="text" name="review" id="review_{{ $review->id }}"
                                                           rows="7" value="{{ $review->review }}"
                                                           style="min-width: 100%; max-width: 100%">
                                                </span>
                                                        </div>
                                                        <div class="col-sm-1">
                                                <span class="">
                                                    <input type="text" name="order" id="order_{{ $review->id }}"
                                                          value="{{ $review->review_order }}"
                                                           style="min-width: 100%; max-width: 100%">
                                                </span>
                                                        </div>
                                                        <div class="col-md-2">
                                                <span class="text-center">
                                                    <a onclick="editReview({{ $review->id }})" class="btn btn-danger">Edit</a>
                                                    <a onclick="deleteReview({{ $review->id }})"
                                                       class="btn btn-secondary">Delete</a>
                                                    </span>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            </div>
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


    <script>
        $('.file').filestyle({
            buttonName: 'btn-danger',
            buttonText: ' Open'
        });

        function deleteReview(reviewId) {
            $.ajax({
                url: "{{ url('admin/reviews/delete') }}",
                type: 'get',
                data: {'id': reviewId},
                success: function () {
                    location.reload();
                }
            });
        }

        function editReview(reviewId) {
            var name = $('#name_' + reviewId).val();
            var review = $('#review_' + reviewId).val();
            var order = $('#order_' + reviewId).val();
            if (name == '') {
                $('#name_' + infoid).addClass('has-error');
                $('#review_' + infoid).addClass('has-error');
                return;
            }

            $.ajax({
                url: "{{ url('admin/reviews/update') }}"
                , type: 'get'
                , dataType: "JSON"
                , data: {
                    "name": name,
                    "review": review,
                    "order": order,
                    'id': reviewId
                }
                , success: function () {
                    location.reload();
                }
            });
        }


    </script>
    <!-- END CORE TEMPLATE JS -->

@endsection

@section('styles')

    <link href="{{ asset('adminn/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css') }}" rel="stylesheet"
          type="text/css"/>
@endsection
