<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>.:TOP MUSIC EVENTS:. BETA</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('css/auto-complete.css') }}">
    <link rel="stylesheet" href="{{ asset('css/video_layout.css') }}">
    <style>
        .autocomplete {
            position: relative;
            display: inline-block;
        }

        input {
            border: 1px solid transparent;
            background-color: #f1f1f1;
            padding: 10px;
            font-size: 16px;
        }

        input[type=text] {
            background-color: #f1f1f1;
            width: 100%;
        }

        input[type=submit] {
            background-color: DodgerBlue;
            color: #fff;
            cursor: pointer;
        }

        .autocomplete-items {
            position: absolute;
            border: 1px solid #d4d4d4;
            border-bottom: none;
            border-top: none;
            z-index: 99;
            /*position the autocomplete items to be the same width as the container:*/
            top: 100%;
            left: 0;
            right: 0;
        }

        .autocomplete-items div {
            padding: 10px;
            cursor: pointer;
            background-color: #fff;
            border-bottom: 1px solid #d4d4d4;
        }

        /*when hovering an item:*/
        .autocomplete-items div:hover {
            background-color: #e9e9e9;
        }

        /*when navigating through the items using the arrow keys:*/
        .autocomplete-active {
            background-color: DodgerBlue !important;
            color: #ffffff;
        }
    </style>

    @yield('styles')
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
    </script>

    <script>
        window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')

    </script>
    <script src="{{ asset('js/jquery.paginate.js') }}"></script>
    <script src="{{ asset('js/auto-complete.min.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
            crossorigin="anonymous"></script>
    <script>


        $(document).ready(function () {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            // keyup event start
            $(".main_search").keyup(function () {
                var key = $(this).val();
                if (key == "") $("#artist_id").val("");
                var data = {key: key};
                $.ajax({
                    type: 'POST',
                    url: "{{ route('ajaxRequest.post') }}",
                    data: data,
                    dataType: "json",
                    success: function (data) {

                        $('.filter').html("");
                        var length = Object.keys(data.success).length;
                        var query = "";

                        for (var i = 0; i < length; i++) {

                            query += "<p id='word' class='word' data-id= '" + Object.keys(data.success)[i][i] + "' data-content='" + Object.keys(data.success)[i] + "'>&nbsp;&#119070;&nbsp;&nbsp; " + Object.keys(data.success)[i] + "</p>";
                        }
                        query = "<div style='max-height:115px; overflow-y: scroll;'>" + query + "</div>";
                        $('.filter').html(query);
                        $('.word').click(function () {
                            $('.main_search').val($(this).attr('data-content'));
                            $('#artist_id').val($(this).attr('data-id'));
                            $('.filter').html("");
                        })
                    }
                });
            })
            // keyup event end
            var x = document.getElementById("audio");
            $(".hover").click(function () {

                // console.log($(this).attr("data"));
                $("#audio_player").remove();
                $("#audio").html("<source id='audio_player' src='../uploads/" + $(this).attr("data") + "' type='audio/mpeg'>");


            })

            jQuery('#searchResult').paginate({
                scope: $('div'),
                perPage: 6,
            });


        })

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


    </script>
    @yield('scripts')
</head>
<style>
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

    .filter {

        width: 190px;
        margin-top: -3px;
        margin-left: 32px;
        background-color: white;
    }

    .word {
        margin-bottom: 2px;
        cursor: pointer;
        border-bottom: 1px dotted grey;
    }

    .word:hover {
        background-color: #a3f5be;
    }

    #filter_id {
        max-height: 20px;
        overflow: auto;
    }
</style>
<body>
<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="/">Home</a>
    <a href="about">About</a>
    <a href="#">How It Works</a>
    <a href="#">Latest News</a>
    <a href="#">Contact</a>
</div>


<div id="mySidenav2" class="sidenav2">
    <a href="javascript:void(0)" class="closebtn2" onclick="closeNav2()">&times;</a>
    <h4>Search</h4>
    <form action="{{ route('searchart') }}" method="GET">
        <input class="main_search" autocomplete="off" placeholder="artists, keywords..." name="fullname"
               id="filtering"/>
{{--        <input type="hidden" id="artist_id" name="artist_id">--}}
        <div class="filter"></div>
        <a href="#">
            <button type="submit" class="my_but3" id="find-now">Find Now</button>
        </a>
    </form>
</div>

<div id="mySidenav3" class="sidenav3">
    <a href="javascript:void(0)" class="closebtn2" onclick="closeNav3()">&times;</a>
    <h4>Contact Us</h4>
    <h6>Call us on:<br>
        0780 9671 303</h6>
    <br>
    <h6>Send Message:</h6>
    <form action="{{ route('send_contact') }}" method="POST">
        @csrf
        <input class="main_search" placeholder="Your Full Name" name="name" required/>
        <input class="main_search" placeholder="Your E-mail" name="email" required/>
        <input class="main_search" placeholder="Your Telephone" name="phone" required/>
        <input class="main_search" placeholder="Subject" name="subject" required/>
        <textarea class="side_area" placeholder="Your Message" required></textarea>
        <a href="#">
            <button class="my_but3">Send Message</button>
        </a>
    </form>
</div>


<nav class="my_navbar fixed-top">
    <div class="row">
        <div class="col-xs-4 col-sm-4 col-md-4 top_left">
            <div class="appbar-item appbar-menu-icon" id="toggle-sidebar-left"><img src="{{ asset('img/menu.png') }}"
                                                                                    onclick="openNav()" class="hover">
            </div>
        </div>
        <div class="col-xs-4 col-sm-4 col-md-4 top_middle">
            <a href="{{ route('homepage') }}"><img src="{{asset('img/logo.png')}}" class="hover"/></a>
        </div>
        <div class="col-xs-4 col-sm-4 col-md-4 top_right">
            <img src="{{ asset('img/search.png') }}" class="hover" onclick="openNav2()"/> <img
                src="{{ asset('img/contact.png') }}" onclick="openNav3()" class="hover">
        </div>
    </div>
</nav>

<main role="main">
    @yield('content')
</main>
@include('layouts.footer')

</body>

</html>
