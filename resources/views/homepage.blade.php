@extends('layouts.app')
@section('content')
    <main role="main">


        <div class="top_section">



            <div class="row" style="margin:0">

                <div class="col-md-12 top_box">
                    @if(Session::has('error'))
                        <div style="margin-top: -128px">
                            <div class="alert alert-danger">
                                <strong>Error: </strong>{{ Session::get('error') }}
                            </div>
                        </div>
                    @endif
                    <h1 @if(Session::has('error'))
                    style="    margin-top: 93px;"
                        @endif
                    >Find & Hire<br>Bands DJS AND MUSICIANS<br>FOR YOUR EVENTS</h1>
                    <h5><em>We Cover Party Weddings and Coorporate</em></h5>
                </div>
            </div>
        </div>

        <div class="top_section2">
            <h4>THE UK&#39;S MOST FAVORITE MUSICIAN AGENCY</h4>
        </div>


        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2 class="center">Welcome to<br/>TOP MUSIC EVENTS</h2>
                    <br/>
                    <p>
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                        but also the leap into electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
                        and more recently with desktop publishing software like Aldus PageMaker including versions of
                        Lorem Ipsum.
                    </p>

                    <p>
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                        but also the leap into electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
                        and more recently with desktop publishing software like Aldus PageMaker including versions of
                        Lorem Ipsum.
                    </p>

                    <p>
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                        but also the leap into electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
                        and more recently with desktop publishing software like Aldus PageMaker including versions of
                        Lorem Ipsum.
                    </p>
                </div>

                <div class="col-md-6 center">
                    <br/><br/>
                    <img src="img/trustpilot.jpg"/>
                    <br/>

                    <div class="my_box">
                        <div class="my_box_head">QUICK SEARCH</div>

                        <form action="{{route('filtering')}}" method="POST" class="search_form">
                            @csrf
                            <select class="my_select" name="event" required>
                                <option value="">Select Event Type</option>
                                @foreach ($events as $event)
                                    <option value="{{ $event->id }}">{{ $event->name }}</option>
                                @endforeach
                            </select>
                            <select class="my_select" name="location" required>
                                <option value="">Select Location</option>
                                @foreach ($countries as $country)
                                    <optgroup label="{{ $country->name }}">
                                        @foreach ($country->location as $item)
                                            <option value="{{ $item->id }}">{{ $item->name }}</option>
                                        @endforeach
                                    </optgroup>
                                @endforeach
                            </select>

                            <div class="input-group date pay_input" id="eventdatetimepicker" data-target-input="nearest" style="

    width: 80%;
    margin-left: 41px;
    margin-top: 10px;
    margin-bottom: 10px;


">
                                <input  type="text" name="eventdate" placeholder="Event Date" class="form-control datetimepicker-input" data-target="#eventdatetimepicker" data-toggle="datetimepicker" style="height: 45px; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border: 1px solid #fff"/>
                                <div class="input-group-append" data-target="#eventdatetimepicker" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>

{{--                            <input  type="date" name="begin"  required placeholder="dd-mm-yyyy" data-date-format="DD MMMM YYYY"--}}
{{--                                   style="width: 80%; border: none; height: 45px;border-radius: 10px;font-size: 18px; padding-left: 20px;"--}}
{{--                                   value=""/>--}}
                            <select class="my_select" name="acttype" required>
                                <option value="">Select Act Type</option>
                                @foreach($acts as $act)
                                    <option value="{{$act->id}}">{{$act->name}}</option>
                                @endforeach
                            </select>
                            <button type="submit" class="my_but">FIND NOW</button>

                        </form>
                    </div>


                </div>
            </div>
        </div>


        <div class="container mt20 mb20">
            <div class="row">

                <div class="col-md-7">
                    <img src="img/artists.jpg" class="resize"/>
                </div>

                <div class="col-md-5 features">

                    <h2 class="mob_sp">WHY CHOOSE US?</h2>

                    <ul class="feature_list">
                        <li> We are expert entertainment agents</li>

                        <li> Convenient opening hours: 10am to 10pm, 7 days a week</li>

                        <li> Find a band from a wide range of genres whose style suits your event</li>

                        <li> Hire a band to suit your budget</li>

                        <li> We have strong relationships with professional musicians, bands and performers</li>

                        <li> We get to know you so we can help you find a band to match your event</li>

                        <li> Our friendly staff are specialists in music and event planning</li>

                        <li> A trusted entertainment agency offers protection that gives you peace of mind</li>
                    </ul>
                </div>

            </div>
        </div>

        <div class="mt20 mb20 gray_box">

            <div class="container">
                <h3 class="center">EVENT CATEGORIES</h3>

                <div class="row mt20 mb20 categories">
                    <div class="col-md-3 center"><img class="mob_sp" src="img/cat1.jpg"/></div>
                    <div class="col-md-3 center"><img class="mob_sp" src="img/cat2.jpg"/></div>
                    <div class="col-md-3 center"><img class="mob_sp" src="img/cat3.jpg"/></div>
                    <div class="col-md-3 center"><img class="mob_sp" src="img/cat4.jpg"/></div>
                </div>
                <div class="row mt20 mb20 categories">
                    <div class="col-md-3 center"><img class="mob_sp" src="img/cat5.jpg"/></div>
                    <div class="col-md-3 center"><img class="mob_sp" src="img/cat6.jpg"/></div>
                    <div class="col-md-3 center"><img class="mob_sp" src="img/cat7.jpg"/></div>
                    <div class="col-md-3 center"><img class="mob_sp" src="img/cat8.jpg"/></div>
                </div>
                <div class="row mt20 mb20 categories">
                    <div class="col-md-3 center"><img class="mob_sp" src="img/cat9.jpg"/></div>
                    <div class="col-md-3 center"><img class="mob_sp" src="img/cat10.jpg"/></div>
                    <div class="col-md-3 center"><img class="mob_sp" src="img/cat11.jpg"/></div>
                    <div class="col-md-3 center"><img class="mob_sp" src="img/cat12.jpg"/></div>
                </div>
            </div>

        </div>


        <div class="container mt20 mb20">

            <br>
            @if(isset($top_acts))
            <h3 class="center">TOP ACTS</h3>
            <br>

                @foreach($top_acts as $item)
            <div class="row top_acts center mt20">
                <div class="col-sm-6 col-md-2 center mob_sp"><img class="mob_sp resize" src="img/act1.jpg"/><h4>{{ $item->name }}</h4>
                    <button class="my_but2">View Details</button>
                </div>
                    @endforeach

{{--                <div class="col-sm-12 col-sm-6 col-md-2 center mob_sp"><img class="mob_sp resize" src="img/act2.jpg"/>--}}
{{--                    <h4>NME100</h4>--}}
{{--                    <button class="my_but2">View Details</button>--}}
{{--                </div>--}}

{{--                <div class="col-sm-12 col-sm-6 col-md-2 center mob_sp"><img class="mob_sp resize" src="img/act3.jpg"/>--}}
{{--                    <h4>GOLDEN STRINGS</h4>--}}
{{--                    <button class="my_but2">View Details</button>--}}
{{--                </div>--}}

{{--                <div class="col-sm-12 col-sm-6 col-md-2 center mob_sp"><img class="mob_sp resize" src="img/act4.jpg"/>--}}
{{--                    <h4>MAYA</h4>--}}
{{--                    <button class="my_but2">View Details</button>--}}
{{--                </div>--}}

{{--                <div class="col-sm-12 col-sm-6 col-md-2 center mob_sp"><img class="mob_sp resize" src="img/act5.jpg"/>--}}
{{--                    <h4>RAY LEOTEN</h4>--}}
{{--                    <button class="my_but2">View Details</button>--}}
{{--                </div>--}}

{{--                <div class="col-sm-12 col-sm-6 col-md-2 center mob_sp"><img class="mob_sp resize" src="img/act6.jpg"/>--}}
{{--                    <h4>MARK McDEAN</h4>--}}
{{--                    <button class="my_but2">View Details</button>--}}
{{--                </div>--}}
{{--            </div>--}}
            <br>
            <div class="row mb20">
                <div class="col-md12 center">
                   <a href="{{ route('explore-more') }}"> <button class="my_but">EXPLORE MORE</button></a>

                </div>
            </div>
                @endif
        </div>


        <div class="testi_box center">

            <div class="container center">
                <h1 class="testi_head">What Our Clients Say</h1>


                <!-- SLIDER START -->
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="testimonial center">
                                &#8221;Im Impressed with TOP MUSIC EVENTS agency. They are very professional and have
                                plenty to offer. Whatever your event type or size is just try to use TOP MUSIC EVENTS
                                and you wont be disappointed. Great service and affordalbe pricing. You can select the
                                desired style or musician that will suite your upcoming event.&#8221;
                                <br><br>
                                <p class="user">Sabina from Selmart</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="testimonial center">
                                &#8221;Im Impressed with TOP MUSIC EVENTS agency. They are very professional and have
                                plenty to offer. Whatever your event type or size is just try to use TOP MUSIC EVENTS
                                and you wont be disappointed. Great service and affordalbe pricing. You can select the
                                desired style or musician that will suite your upcoming event.&#8221;
                                <br><br>
                                <p class="user">Sabina from Selmart</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="testimonial center">
                                &#8221;Im Impressed with TOP MUSIC EVENTS agency. They are very professional and have
                                plenty to offer. Whatever your event type or size is just try to use TOP MUSIC EVENTS
                                and you wont be disappointed. Great service and affordalbe pricing. You can select the
                                desired style or musician that will suite your upcoming event.&#8221;
                                <br><br>
                                <p class="user">Sabina from Selmart</p>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <!-- SLIDER END -->


            </div>
        </div>
        <br>


        <div class="container mt20 mb20 center">

            <br>
            <h3 class="center sep">LATEST NEWS</h3>
            <br>

            <p class="bigger">Stay in touch with latest trends, updates and developments in music world.<br>
                Find out more about our new features and special offers we have ready for you.</p>
            <br>

            <div class="row news center mt20">
                <div class="col-md-4 center"><img class="resize mob_sp" src="img/news1.jpg"/></div>

                <div class="col-md-4 center"><img class="resize mob_sp" src="img/news2.jpg"/></div>

                <div class="col-md-4 center"><img class="resize mob_sp" src="img/news3.jpg"/></div>

            </div>


        </div>


        <br>
        <div class="site_bottom mt20">
            <div class="container">

                <div class="row">
                    <div class="col-md-3 mob_sp">
                        <h3>More Info:</h3>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Wedding Events</a></li>
                            <li><a href="#">Corporate Events</a></li>
                            <li><a href="#">Paty Events</a></li>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">Latest News</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <h3 class="hide">Hidden</h3>
                        <ul>
                            <li><a href="#">For Musicians</a></li>
                            <li><a href="#">Support</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                            <li><a href="#">Sitemap</a></li>
                            <li><a href="#">Contact Us</a></li>
                        </ul>

                    </div>
                    <div class="col-md-3 mob_sp">
                        <h3>Subscribe:</h3>
                        <div>
                            Subscribe to our newsletter to have access to the latest news, updates and offers.
                        </div>
                        <input class="subscribe" placeholder="Your e-mail address"/>
                        <br/>
                        <button class="my_but3">Subscribe Now</button>


                    </div>
                    <div class="col-md-3 mob_sp">
                        <h3>Contact Us:</h3>

                        <div>
                            <strong>Tel:</strong> 0780 9671 303<br>
                            <strong>E-mail:</strong> <a href="mailto:info@topmusicevents.uk">info@topmusicevents.uk</a>
                            <br>
                            <br>
                            <img src="img/logo.png"/>
                        </div>

                    </div>

                </div>
            </div>

        </div>
        </div>

    </main>
@endsection
@section('scripts')
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/js/tempusdominus-bootstrap-4.min.js"></script>
    {{-- <script src="js/jquery.min.js"></script>
    <script src="js/simpler-sidebar.min.js"></script> --}}
    <script>
        $(document).ready(function () {
            $('.carousel').carousel();
        })



        $(function() {
            $('#eventdatetimepicker').datetimepicker({
                format : "DD/MM/YYYY"
            });
        });
        var MusicCarousel = document.querySelector('#MusicCarousel')
        var carousel = new bootstrap.Carousel(MusicCarousel, {
            interval: 2000,
            wrap: false
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
@endsection
@section('styles')
    <link rel="stylesheet" href="{{ asset('css/music.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/css/tempusdominus-bootstrap-4.min.css" />

    <style>

        .sidenav {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 9999;
            top: 0;
            left: 0;
            background: rgba(0, 0, 0, 0.88);
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
            font-family: 'Roboto', sans-serif;
            margin-top: 1px;
        }

        .sidenav2,
        .sidenav3 {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 9999;
            top: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.88);
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
            font-family: 'Roboto', sans-serif;
            margin-top: 1px;
        }


        .sidenav a,
        .sidenav2 a,
        .sidenav3 a {
            padding: 8px 8px 8px 32px;
            text-decoration: none;
            font-size: 18px;
            text-transform: uppercase;
            font-weight: 300;
            color: #fff;
            display: block;
            transition: 0.3s;
        }

        .sidenav a:hover,
        .sidenav2 a:hover,
        .sidenav3 a:hover {
            color: #ccc;
        }

        .sidenav .closebtn {
            position: absolute;
            top: 0;
            right: 10px;
            font-size: 36px;
            margin-left: 50px;
        }

        .sidenav2 .closebtn2,
        .sidenav3 .closebtn2 {
            position: absolute;
            top: 0;
            left: -15px;
            font-size: 36px;
        }

        .sidenav2 h4,
        .sidenav3 h4 {
            font-size: 25px;
            font-weight: 300;
            color: #fff !important;
            padding-top: 20px;
            margin: 5px 0 15px 0;
            padding-left: 32px !important;
        }

        .sidenav3 h6 {
            font-size: 19px;
            font-weight: 300;
            color: #fff !important;
            text-align: left;
            margin: 5px 0 15px 0;
            padding-left: 32px !important;
        }

        .main_search,
        .side_area {
            width: 100%;
            max-width: 190px;
            margin: 4px 0 4px 32px;
            padding: 10px 15px;
            color: #666;
            background: #fff;
            border: none;
        }

        .side_area {
            min-height: 200px;
        }

        .resize {
            width: 100%;
        }

        .foot_right {
            text-align: left;
        }


        @media screen and (max-width: 900px) {
            .carousel-control-prev,
            .carousel-control-next {
                display: none;
            }

            .testi_box {
                min-height: 690px !important;
            }

            .my_but2 {
                font-size: 13px;
                padding: 4px 6px 2px 6px;
                margin: 10px auto 8px auto;
                width: 90px;
            }

            .top_acts h4 {
                min-height: 36px;
            }


        }


        @media screen and (max-width: 770px) {
            .mob_sp {
                margin-top: 20px;
            }

            .top_acts h4 {
                min-height: 15px;
            }


        }

        @media screen and (max-width: 585px) {

            .top_left {
                width: 18%;
                text-align: center;
                margin: 2px auto;
            }

            .top_middle {
                width: 32%;
                text-align: center;
                margin: 2px auto;
            }

            .top_right {
                width: 50%;
                text-align: center;
                margin: 2px auto;
            }


        }


        @media screen and (max-height: 450px) {
            .sidenav {
                padding-top: 15px;
            }

            .sidenav a {
                font-size: 18px;
            }

            .sidenav2 {
                padding-top: 15px;
            }

            .sidenav2 a {
                font-size: 18px;
            }

            .sidenav3 {
                padding-top: 15px;
            }

            .sidenav3 a {
                font-size: 18px;
            }
        }

    </style>
@endsection
