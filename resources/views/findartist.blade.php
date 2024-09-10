@extends('layouts.app')
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/css/tempusdominus-bootstrap-4.min.css"/>

@section('content')
    <div class="top_section">
        <div class="row" style="margin:0">
            <div class="col-md-12 top_box">
                <h1>HIRE THE BEST WEDDING COVER BANDS</h1>
                <h5>FIND AND BOOK AMAZING WEDDING COVER BANDS</h5>
            </div>
        </div>
    </div>

    <div class="top_section22">

    </div>




    <div class="container">
        <div class="row">


            <div class="col-md-3 side_box">

                <div class="find_box">
                    <div class="my_box_head2">FIND ARTIST</div>
                    <form class="side_search">
                        <select class="my_select2" id="event_type" value="{{$v_event}}">
                            <option>Event Type</option>
                            <?php
                            foreach ($g_event as $event)
                                if ($event->id == $v_event) {
                                    echo "<option value='".$event->id."' selected>".$event->name."</option>";
                                } else {
                                    echo "<option value='".$event->id."'>".$event->name."</option>";
                                }
                            ?>
                        </select>

                        <select class="my_select2" id="location" value="{{$v_location}}">
                            <option>Event Location</option>
                            @foreach ($g_country as $country)
                                <optgroup label="{{ $country->name }}">
                                    <?php
                                    foreach ($country->location as $item)
                                        if ($item->id == $v_location) {
                                            echo "<option value='".$item->id."' selected>".$item->name."</option>";
                                        } else {
                                            echo "<option value='".$item->id."'>".$item->name."</option>";
                                        }
                                    ?>
                                </optgroup>
                            @endforeach
                        </select>

                        {{--            <div class="input-group date pay_input" id="eventdatetimepicker" data-target-input="nearest" style="--}}


                        {{--    margin-left: 41px;--}}
                        {{--    margin-top: 10px;--}}
                        {{--    margin-bottom: 10px;--}}


                        {{--">--}}
                        {{--                <input  type="text" name="eventdate" placeholder="Event Date" class="form-control datepicker" data-target="#eventdatetimepicker" data-toggle="datetimepicker" style="height: 45px; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border: 1px solid #fff"/>--}}
                        {{--                <div class="input-group-append" data-target="#eventdatetimepicker" data-toggle="datetimepicker">--}}
                        {{--                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>--}}
                        {{--                </div>--}}
                        {{--            </div>--}}
                        <div class="input-group date pay_input " id="eventdatetimepicker" data-target-input="nearest">
                            {{--                    <input type="text" name="eventdate" placeholder="Event Date" class="form-control datetimepicker-input " data-target="#eventdatetimepicker" />--}}

                            <input name="eventdate" type="text" id="date_from" name="docDateFrom" value=""
                                   class="form-control datepicker " autocomplete="off"
                                   data-target="#eventdatetimepicker" data-toggle="datetimepicker">
                            <div class="input-group-append" data-target="#eventdatetimepicker"
                                 data-toggle="datetimepicker">
                            </div>
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                        <script type="text/javascript">
                            $(function () {
                                $('#eventdatetimepicker').datetimepicker({
                                    format: "DD/MM/YYYY"
                                });
                            });

                        </script>


                        {{--              <input type="text" name="date" id="date" placeholder="Select Event Date" style="width: 100%; border: none; height: 45px;border-radius: 10px;font-size: 18px; padding-left: 20px;" value=""/>--}}

                        <div class="available_artist" style="margin-top:10px;">
                            <input class="my_checkbox" type="checkbox" id="" name="" value=""/> Show only available
                            artists
                        </div>
                    </form>
                </div>

                <div class="side_categories">
                    <div class="side_title">
                        What type of act are you looking for?
                    </div>


                    <h5><b id="show_all">SHOW ALL</b></h5>

                    @foreach($g_cate as $g_category)
                        <h5><i class="parent_act"
                               style="font-size: 14px;font-weight: 100px;font-style: normal;">{{$g_category->name}}</i>
                        </h5>
                        <?php foreach ($g_category->act as $acttype) {
                            if ($acttype->id == $v_acttype)
                                echo "<i class='parent_act' id='".$acttype->id."' style='font-size: 15px;font-weight: 400;font-style:normal; line-height:3.1'>".strtoupper($acttype->name)."</i><br />";
                            else
                                echo "<i class='parent_act' id='".$acttype->id."' style='font-size: 17px;font-weight: 400;font-style:normal; line-height:3.1'>".strtoupper($acttype->name)."</i><br />";
                        }
                        ?>
                    @endforeach


                </div>

            </div>

            <div class="col-md-9 main_box nopadding">
                <div class="search_top">
                    Sort by: &nbsp;
                    <select class="my_select33" id="sort">
                        <option>Popularity</option>
                        <option value="AZ">A~Z</option>
                        <option value="ZA">Z~A</option>
                    </select>
                    &nbsp;
                    &nbsp;
                    &nbsp;
                    &nbsp;
                    <select class="my_select33" id="budget">
                        <option>Budget</option>
                        <option value="1">&#65505;0 ~ &#65505;1000</option>
                        <option value="2">&#65505;1000 ~ &#65505;2000</option>
                        <option value="3">&#65505;2000 ~ &#65505;3000</option>
                        <option value="4">&#65505;3000 +</option>
                    </select>
                    &nbsp;
                    &nbsp;
                    &nbsp;
                    &nbsp;
                </div>
                @if($result_status == '0')
                    <br>
                    <center>
                        <div style='color: red;'>There are currently no results for your search attributes</div>
                        <br>
                        <div>Here are some other artists:</div>
                    </center>
                @endif
                <div class="row nopadding" id="searchResult">

                    @if(isset($info))
                        @foreach($info as $infomation)
                            <div class="col-md-4 listing_box nopadding2">

                                <input type="hidden" name="img" value="eman" id="">
{{--                                dreamcat--}}
                                <form action="{{ route('searchart') }}" method="GET" target="_blank">
                                    <input hidden name="fullname" value="{{$infomation->fullname}}" />
                                    <button type="submit" style="outline: none; border: none; padding: 0px;">
                                        <img src='../uploads/{{$infomation->url}}' class='listing_img hover'/>
                                    </button>
                                </form>


                                <div class="row nopadding">
                                    <div class="col-md-4 artist_but hover">
                                        <form action="{{ route('searchart') }}" method="GET" target="_blank">
                                            <input hidden name="fullname" value="{{$infomation->fullname}}" />
                                            <button type="submit" style="outline: none; border: none; padding: 0px; background-color: #C7C7C7;">
                                                <img src="{{ asset('img/artist_but1.png') }}"/>
                                            </button>
                                        </form>
{{--                                        <a href="{{ url('searching') }}/{{ $infomation->id }}" target="_blank"> --}}
{{--                                            --}}
{{--                                        </a>--}}
                                    </div>
                                    <div class="col-md-4 artist_but hover">
                                        <form action="{{ route('searchart') }}" method="GET" target="_blank">
                                            <input hidden name="fullname" value="{{$infomation->fullname}}" />
                                            <input hidden name="scroll_to" value="music" />
                                            <button type="submit" style="outline: none; border: none; padding: 0px; background-color: #C7C7C7;">
                                                <img src="{{ asset('img/artist_but2.png') }}"/>
                                            </button>
                                        </form>
                                    </div>
                                    <div class="col-md-4 artist_but hover">
                                        <form action="{{ route('searchart') }}" method="GET" target="_blank">
                                            <input hidden name="fullname" value="{{$infomation->fullname}}" />
                                            <input hidden name="scroll_to" value="video" />
                                            <button type="submit" style="outline: none; border: none; padding: 0px; background-color: #C7C7C7; ">
                                                <img src="{{ asset('img/artist_but3.png') }}"/>
                                            </button>
                                        </form>

                                    </div>

                                    <div class="artist_title">
                                        <form action="{{ route('searchart') }}" method="GET" target="_blank">
                                            <input hidden name="fullname" value="{{$infomation->fullname}}" />
                                            <button type="submit" style="outline: none; border: none; padding: 0px; font-weight: 500; color:#ce019e; text-transform: uppercase;">
                                                <img src="{{ asset('img/arrow.jpg') }}" class="arrow"/>{{$infomation->fullname}}
                                            </button>
                                        </form>
                                    </div>
{{--                                    end editing--}}

                                    <ul class="artist_features">
                                        <?php
                                        $features = $infomation->features;
                                        $featu = explode("/", $features);
                                        for ($k = 0; $k < count($featu) - 1; $k++) {
                                            echo "<li>".$featu[$k]."</li>";
                                        }
                                        ?>
                                    </ul>
                                </div>
                            </div>
                        @endforeach
                    @endif

                    <div class="paginationBox">
                        <div class="pagination">
                        </div>
                    </div>

                </div>
            </div>


        </div>

        <div class="mt20 mb20">
            <br><br>
            <div class="container">
                <h2 class="center grey">WHY BOOK WITH TOP MUSIC EVENTS?</h3>
                    <br><br>
                    <div class="row mt20 mb20 center">
                        <div class="col-md-3 center why_box">
                            <img src="img/list_icon1.png"/>
                            <h3>Direct contact with music artists & professionals</h3>
                            <p>
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum
                                has been the industry's standard dummy text ever since the 1500s, when an unknown
                                printer took a galley of type and scrambled it to make a type specimen book. It has
                                survived not only five centuries, but also the leap into electronic typesetting,
                                remaining essentially unchanged.
                            </p>
                        </div>

                        <div class="col-md-3 center why_box">
                            <img src="img/list_icon2.png"/>
                            <h3>Our top service & experienced staff, music specialist</h3>
                            <p>
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum
                                has been the industry's standard dummy text ever since the 1500s, when an unknown
                                printer took a galley of type and scrambled it to make a type specimen book. It has
                                survived not only five centuries, but also the leap into electronic typesetting,
                                remaining essentially unchanged.
                            </p>
                        </div>


                        <div class="col-md-3 center why_box">
                            <img src="img/list_icon3.png"/>
                            <h3>Genuine content real videos & music files</h3>
                            <p>
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum
                                has been the industry's standard dummy text ever since the 1500s, when an unknown
                                printer took a galley of type and scrambled it to make a type specimen book. It has
                                survived not only five centuries, but also the leap into electronic typesetting,
                                remaining essentially unchanged.
                            </p>
                        </div>


                        <div class="col-md-3 center why_box">
                            <img src="img/list_icon4.png"/>
                            <h3>Fast & repliable service and customer protection</h3>
                            <p>
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum
                                has been the industry's standard dummy text ever since the 1500s, when an unknown
                                printer took a galley of type and scrambled it to make a type specimen book. It has
                                survived not only five centuries, but also the leap into electronic typesetting,
                                remaining essentially unchanged.
                            </p>
                        </div>

                    </div>
            </div>

        </div>


    </div>



    <div class="mt20 dark_box">


        <div class="bigger_txt white">Haven’t found what you are looking for?<br/>
            Contact our team now for help and more information.
        </div>

        <div class="row">
            <div class="col-md12 center">
                <button class="my_but4">SEND US MESSAGE</button>
            </div>
        </div>

    </div>

    @include('layouts.bottom')
@endsection

@section('scripts')

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/js/tempusdominus-bootstrap-4.min.js"></script>
    {{--    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>--}}

    {{--    <script src="{{asset('adminn/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js')}}"--}}
    {{--            type="text/javascript">--}}
    {{--    </script>--}}
    {{--    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--}}
    {{--    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>--}}
    {{-- <script src="js/jquery.min.js"></script>
    <script src="js/simpler-sidebar.min.js"></script> --}}
    <script>
        function openPM3(input) {
            w = window.open("{{ url('searching') }}/" + input);
            setTimeout(function () {
                w.scrollTo(0, 1150)
            }, 100);
        }

        function openVideo(input) {
            w = window.open("{{ url('searching') }}/" + input);
            setTimeout(function () {
                w.scrollTo(0, 700)
            }, 200);
        }

        $(function () {
            $('#eventdatetimepicker').datetimepicker({
                format: "DD/MM/YYYY"
            });
        });


        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }

        function openNav2() {
            document.getElementById("mySidenav2").style.width = "250px";
        }

        function closeNav2() {
            document.getElementById("mySidenav2").style.width = "0";
        }

        function openNav3() {
            document.getElementById("mySidenav3").style.width = "250px";
        }

        function closeNav3() {
            document.getElementById("mySidenav3").style.width = "0";
        }


        function getPageList(totalPages, page, maxLength) {
            if (maxLength < 5) throw "maxLength must be at least 5";

            function range(start, end) {
                return Array.from(Array(end - start + 1), (_, i) => i + start);
            }

            var sideWidth = maxLength < 9 ? 1 : 2;
            var leftWidth = (maxLength - sideWidth * 2 - 3) >> 1;
            var rightWidth = (maxLength - sideWidth * 2 - 2) >> 1;
            if (totalPages <= maxLength) {
                // no breaks in list
                return range(1, totalPages);
            }
            if (page <= maxLength - sideWidth - 1 - rightWidth) {
                // no break on left of page
                return range(1, maxLength - sideWidth - 1)
                    .concat(0, range(totalPages - sideWidth + 1, totalPages));
            }
            if (page >= totalPages - sideWidth - 1 - rightWidth) {
                // no break on right of page
                return range(1, sideWidth)
                    .concat(0, range(totalPages - sideWidth - 1 - rightWidth - leftWidth, totalPages));
            }
// Breaks on both sides
            return range(1, sideWidth)
                .concat(0, range(page - leftWidth, page + rightWidth),
                    0, range(totalPages - sideWidth + 1, totalPages));
        }

        // Below is an example use of the above function.
        jQuery(function () {
// Number of items and limits the number of items per page
            var numberOfItems = jQuery("#searchResult .listing_box").length;
            var limitPerPage = 15;
// Total pages rounded upwards
            var totalPages = Math.ceil(numberOfItems / limitPerPage);
// Number of buttons at the top, not counting prev/next,
// but including the dotted buttons.
// Must be at least 5:
            var paginationSize = 7;
            var currentPage;

            function showPage(whichPage) {
                if (whichPage < 1 || whichPage > totalPages) return false;
                currentPage = whichPage;
                jQuery("#searchResult .listing_box").hide()
                    .slice((currentPage - 1) * limitPerPage,
                        currentPage * limitPerPage).show();
                // Replace the navigation items (not prev/next):
                jQuery(".pagination li").slice(1, -1).remove();
                getPageList(totalPages, currentPage, paginationSize).forEach(item => {
                    jQuery("<li>").addClass("page-item")
                        .addClass(item ? "current-page" : "disabled")
                        .toggleClass("active", item === currentPage).append(
                        jQuery("<a>").addClass("page-link").attr({
                            href: "javascript:void(0)"
                        }).text(item || "...")
                    ).insertBefore("#next-page");
                });
                // Disable prev/next when at first/last page:
                jQuery("#previous-page").toggleClass("disabled", currentPage === 1);
                jQuery("#next-page").toggleClass("disabled", currentPage === totalPages);
                return true;
            }

// Include the prev/next buttons:
            jQuery(".pagination").append(
                jQuery("<li>").addClass("page-item").attr({id: "previous-page"}).append(
                    jQuery("<a>").addClass("page-link").attr({
                        href: "javascript:void(0)"
                    }).text("Prev")
                ),
                jQuery("<li>").addClass("page-item").attr({id: "next-page"}).append(
                    jQuery("<a>").addClass("page-link").attr({
                        href: "javascript:void(0)"
                    }).text("Next")
                )
            );
// Show the page links
            jQuery("#searchResult").show();
            showPage(1);

// Use event delegation, as these items are recreated later
            jQuery(document).on("click", ".pagination li.current-page:not(.active)", function () {
                return showPage(+jQuery(this).text());
            });
            jQuery("#next-page").on("click", function () {
                return showPage(currentPage + 1);
            });

            jQuery("#previous-page").on("click", function () {
                return showPage(currentPage - 1);
            });
        });
    </script>
@endsection
@section('styles')
    <link rel="stylesheet" href="{{ asset('css/music2.css') }}">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/css/tempusdominus-bootstrap-4.min.css"/>
    <style>
        .act:hover {
            cursor: pointer;
            background-color: black;
            color: white;
        }

        .date {
            padding: 0;
            border: none;
        }

        .action {
            color: #e00772 !important;
        }

        .invalid-feedback {
            display: initial;
        }

        .paginate-pagination {
            background-color: #D1D1D1;
        }

        .paginate-pagination ul {
            list-style: none;
            text-align: center;
            padding: 0px;
        }

        .paginate-pagination ul li {
            display: inline-block;
        }

        .paginate-pagination ul li a {
            color: #CE019E;
            background: #fff;
            font-size: 24px;
            padding: 10px 15px;
            display: inline-block;
            margin: 0 1px;
        }

        .paginate-pagination ul li a.active {
            color: #fff;
            background: #CE019E;
        }

        .paginationBox, .paginationTop {
            background-color: #D1D1D1;
            width: 100%;
        }

        .pagination, .paginationTop ul {
            list-style: none;
            text-align: center;
            padding: 0px;
            width: 40%;
            margin: 0 auto;
            text-align: center;
        }

        .pagination li, .paginationTop ul li {
            display: inline-block;
        }

        .pagination li a, .paginationTop ul li a {
            color: #CE019E;
            background: #fff;
            font-size: 24px;
            padding: 10px 15px;
            display: inline-block;
            margin: 0 1px;
        }

        .pagination li a.active, .paginationTop ul li a.active {
            color: #fff;
            background: #CE019E;
        }

    </style>
@endsection
