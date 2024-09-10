@extends('layouts.app')
@section('content')
    <div class="top_section3" style="background-image:url(<?php foreach ($artist_top_image as $artist_pro_image) {
        echo "../uploads/".$artist_pro_image->url;
    }    ?>)">
        <div class="row" style="margin:0">
            <div class="col-md-12 top_box">
                @foreach ($artist_info as $artist_name)
                    <h1>{{ $artist_name->fullname }}</h1>
                @endforeach
                @foreach ($artist_price as $artist_prices)
                    <h5>FROM £{{$artist_prices->price}}</h5>
                @endforeach
                <button href="#achor_booking" id="book_anch_down" class="my_but3" style="outline: none; padding:10px 25px; text-decoration: none;">Book Now</button>
            </div>
        </div>
    </div>
{{--dreamcat--}}
    <div class="top_section22">
        @if($scroll_to != "")
            <input hidden id="scroll_to" value="{{$scroll_to}}">
        @else
            <input hidden id="scroll_to" value="none">
        @endif
    </div>
{{--end editing--}}

    <div class="black_box">
{{--        dreamcat--}}
        <div class="container" id="achor_video">
            <h2 class="video_head">WATCH<br/>
                @foreach ($artist_info as $artist_name)
                    <span class="f600">{{ $artist_name->fullname }}</span></h2>
            @endforeach
            <div class="youtube_container">
                <div class="vid-container">
                    <?php
                    $n_v_count = 0;
                    foreach ($artist_video as $artist_videos) {
                        if($n_v_count == 0)
                            {
                                $url = explode("=", $artist_videos->url);
                                echo "<iframe id='vid_frame' src='https://www.youtube.com/embed/".$url[1]."' ng-show='showvideo' frameborder='0' allowfullscreen></iframe>";
                                $n_v_count++;
                            }
                    }
                    ?>
                </div>
                <div class="vid-list-container">
                    <div class="vid-list">
                        <?php
                        $n_thumb_count = 0;
                        foreach ($artist_video as $artist_videos) {
                            $url = explode("=", $artist_videos->url);

//                            $y_url = "http://gdata.youtube.com/feeds/api/videos/". $url[1];
//                            $doc = new DOMDocument;
//                            $doc->load($y_url);
//                            $title = $doc->getElementsByTagName("title")->item(0)->nodeValue;
//                            echo "<div class='vid-item' onClick='document.getElementById(vid_frame).src='https://www.youtube.com/embed/".$url[1]."'>";
                            echo "<div class='vid-item' onClick='clickThum(\"".$url[1]."\")'>";
                            echo "<div class='thumb'><img src='http://img.youtube.com/vi/".$url[1]."/0.jpg'></div>";
                            echo "<div class='desc'>". "title" ."</div>";
                            echo "</div>";
                        }
                        ?>
                    </div>
                </div>

            </div>
        </div>
{{--        end editing--}}
    </div>

    <div class="soft_bg whole_box">
{{--        dreamcat--}}
        <div class="container  mb20" id="achor_music">
{{--            end editing--}}
            <h2 class="listen_head">LISTEN TO<br/>
                @foreach ($artist_info as $artist_name)
                    <span class="f600">{{ $artist_name->fullname }}</span></h2>
            @endforeach
            <div class="mt20 mb20">
                <div class="row my_inner">
                    <div class="col-md-12 tracks center" style="column-count:2">
                        <?php
                        $music_flag = 0;
                        foreach ($artist_music as $artist_musics) {
                            echo "<p class='hover' data='".$artist_musics->url."' style='display: list-item;list-style: none;text-align: left;
              padding-left: 32%;'><img src='img/player.png' style='margin-right: 5px;'/>".$artist_musics->title."</p>";
                        }
                        ?>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="player_box">
        <div class="row container center">
            <div class="col-md-12">
                <audio id="audio" controls autoplay style="width:80%">
                    <source id="audio_player" src="" type="audio/mpeg">
                </audio>
            </div>
        </div>
    </div>

    <div class="row container center">
        <div class="col-md-4 left my_pad">
            @foreach ($artist_info as $artist_name)
                <h3 class="artist_head">{{$artist_name->fullname}}<br>our features:</h3>
            @endforeach
            <ul class="features_list">
                <?php
                foreach ($artist_infos as $artist_inf) {
                    $features = $artist_inf->features;
                    $featu    = explode("\n", $features);
                    for ($k = 0; $k < count($featu); $k++) {
                        echo "<li style='list-style:none;'> <i class='fas fa-circle'></i>".$featu[$k]."</li>";
                    }
                }
                ?>
            </ul>
        </div>

        <div class="col-md-8 gray_bg left my_pad">
            @foreach ($artist_info as $artist_name)
                <h3 class="artist_head">ABOUT<br>{{$artist_name->fullname}}</h3>
            @endforeach

            <div class="artist_about">
                <?php
                foreach ($artist_infos as $artist_inf) {
                    echo "<p>".$artist_inf->about."</p>";
                }
                ?>
            </div>
        </div>
    </div>



    <div class="black_box">
        <div class="container">
            <h2 class="video_head f600">BROWSE<br>OUR GALLERY</h2>

            <!-- SLIDER START -->
            <div id="carouselExampleIndicators" class="carousel slide my_gallery" data-ride="carousel">
                <ol class="carousel-indicators">
                    <?php
                    $i = 0;
                    foreach ($artist_gallery_image as $artist_gallery_images) {
                        if ($i == 0) {
                            echo "<li data-target='#carouselExampleIndicators' data-slide-to='".$i."' class='active'></li>";
                            $i++;
                        } else {
                            echo "<li data-target='#carouselExampleIndicators' data-slide-to='".$i."'></li>";
                            $i++;
                        }

                    }

                    ?>
                </ol>
                <div class="carousel-inner">
                    <?php
                    $i = 0;
                    foreach ($artist_gallery_image as $artist_gallery_images) {
                        if ($i == 0) {
                            echo "<div class='carousel-item active'><img src='../uploads/".$artist_gallery_images->url."' style='width:100%; max-height:600px; object-fit: contain;'/></div>";
                            $i++;
                        } else {
                            echo "<div class='carousel-item'><img src='../uploads/".$artist_gallery_images->url."'  style='width:100%; max-height:600px; object-fit: contain;'/></div>";
                            $i++;
                        }

                    }

                    ?>
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

    <div class="bg_box">
    </div>

    <div class="songs_box" style="background-image:url(<?php foreach ($artist_rep_image as $artist_reper_image) {
        echo "../uploads/".$artist_reper_image->url;
    }    ?>)">
        @foreach ($artist_info as $artist_name)
            <h2 class="songs_head">{{$artist_name->fullname}}<br>Repertoire</h2>
        @endforeach
        <div class="container">
            <div class="row pb70">
                <div class="col-md-4">
                    <ul class="song_cats">
                        @foreach ($artist_repertories as $artist_repertory)
                            <li><a href="#">{{$artist_repertory->janre}}</a></li>
                        @endforeach
{{--                        <li><a href="#">HARD ROCK</a></li>--}}
{{--                        <li><a href="#">SOFT ROCK</a></li>--}}
{{--                        <li><a href="#">RELAXING</a></li>--}}
{{--                        <li><a href="#">TOP HITS</a></li>--}}
{{--                        <li><a href="#">CLASS HISTS</a></li>--}}
{{--                        <li><a href="#">EXPERIMENTAL</a></li>--}}
                    </ul>
                </div>

                <div class="col-md-8 song_list">
                    <h3 class="song_cat_head">HARD ROCK</h3>
                    <div class="row">
                        <?php
                        $tmpStr = "";
                        $tmpRep = "";
                        $rep_arry = [];
                        foreach($artist_repertories as $artist_repertory)
                        {

                            $tmpStr .= $artist_repertory->content;
                        }

                        $tmpRep = str_replace('"', "", $tmpStr);

                        $tmpRep = str_replace('""', '\r\n', $tmpRep);
                        $rep_arry = explode('\r\n', $tmpRep);
                        $nTmp = 0;
                        foreach ($rep_arry as $rep){
                            if($nTmp == 0)
                            {
                                echo"<div class='col-md-6'>";
                                echo"<ul>";
                                echo"<li><a href='#'>$rep</a></li>";

                            }
                            elseif($nTmp % 16 == 0)
                            {
                                echo"</div>";
                                echo"</ul>";
                                echo"<div class='col-md-6'>";
                                echo"<ul>";
                                echo"<li><a href='#'>$rep</a></li>";

                            }
                            else{
                                echo"<li><a href='#'>$rep</a></li>";

                            }
                            $nTmp ++;

                        }



                                echo"</ul>";
                            echo"</div>";
                        ?>
                    </div>
                </div>
            </div>
        </div>


    </div>



    <div class="booking_box">
        <div class="container center" id="achor_booking">
            @foreach ($artist_info as $artist_name)
                <h2 class="booking_head"><span class="f600">{{$artist_name->fullname}}</span><br>ENQUIRY & BOOKING</h2>
            @endforeach

            <form action="{{ route('send_booking') }}" method="post">
                @csrf
                <div class="row">

                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <img src="img/box1.png" class="head_box"/>
                        <div class="my_box2">

                            <div class="my_box_head3">SELECT LOCATION</div>


                            <select class="my_select3" name="location" required>
                                <option value="">Select Location</option>
                                @foreach (App\Models\Artist::find($get_data)->pricelocation as $item)
                                    <option value="{{ $item->id }}">{{ $item->location->name }}</option>
                                @endforeach
                            </select>

                            <h4 class="booking_head2">PRICE FROM: <span class="bigger">£1250</span></h4>

                            <p class="small_font">
                                5 Piece Band: Male Lead Vocals and Keys, Male Lead Vocals and Guitar, Sax, Double
                                Bass &
                                Drums
                            </p>

                            <p class="small_font">
                                Prices are based on a 5pm or later arrival and Mindnight finish, including 2x60 or
                                3x40
                                minute
                                sets of live performance. Approximately 75-90 minutes are required for the act to
                                set up
                                and sound check (depending on access to the performance area).
                            </p>


                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <img src="img/box2.png" class="head_box"/>
                        <div class="my_box2">

                            <div class="my_box_head3">EXTRAS</div>


                            <p class="small_font">
                                THIS ACT OFFERS ADD-ONS TO THEIR SET PACKAGE PRICE. IF YOU WOULD LIKE TO ENQUIRE
                                ABOUT
                                THESE OPTIONS PLEASE SELECT BELOW:
                            </p>
                            @foreach (App\Models\Artist::find($get_data)->priceaddon as $item)

                                <div class="holder">
                                    <input type="checkbox" value="{{ $item->id }}" name="add_on[]"
                                           class="my_checkbox"/> {{ $item->type }}<br>
                                    <span class="left_push f600">+ FROM £{{ $item->price }}</span>
                                </div>
                            @endforeach

                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <img src="img/box3.png" class="head_box"/>
                        <div class="my_box2">

                            <div class="my_box_head3">YOUR DETAILS</div>


                            <p class="small_font">
                                PLEASE ENTER YOUR DETAILS BELOW SO WE CAN CONTACT YOU WITH FULL QUOTE:
                            </p>

                            <input class="my_input" type="input" placeholder="NAME*" name="name" required/>
                            <br><br>
                            <input class="my_input" type="input" placeholder="E-MAIL*" name="email" required/>
                            <br><br>
                            <input class="my_input" type="input" placeholder="TELEPHONE*" name="tel" required/>


                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <img src="img/box4.png" class="head_box"/>
                        <div class="my_box2">

                            <div class="my_box_head3">BOOKING</div>


                            <p class="small_font">
                                PLEASE ADD YOUR EVENT INFORMATION:
                            </p>

                            <select class="my_select3" name="event">
                                <option>EVENT TYPE</option>
                                @foreach (App\Models\Event::all() as $event)
                                    <option value="{{ $event->id }}">{{ $event->name }}</option>
                                @endforeach
                            </select>


                            <textarea class="my_textarea" placeholder="VENUE" name="venue"></textarea>

                            <div class="input-group date pay_input" id="eventdatetimepicker"
                                 data-target-input="nearest">
                                <input type="text" name="time" placeholder="Event Date"
                                       class="form-control datetimepicker-input"
                                       data-target="#eventdatetimepicker" data-toggle="datetimepicker"/>
                                <div class="input-group-append" data-target="#eventdatetimepicker"
                                     data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $('#eventdatetimepicker').datetimepicker({
                                    format : "DD/MM/YYYY"
                                });

                            </script>
                            <textarea class="my_textarea" placeholder="OTHER DETAILS" name="otherdetail"></textarea>
                            <div class="mt20 center">
                                <button class="my_but5">BOOK NOW</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="my_divider">&nbsp;</div>



    <div class="review_box" style="background-image:url(<?php foreach ($artist_review_image as $artist_rev_image) {
        echo "../uploads/".$artist_rev_image->url;
    }    ?>)">
        @foreach ($artist_info as $artist_name)
            <h2 class="review_head">{{$artist_name->fullname}}<br>REVIEWS</h2>
        @endforeach
        <div class="container">
            <div class="pb70 center">
                <img src="img/trustpilot.jpg" class="trustp">
            </div>
            <div class="row">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">

                    <ol class="carousel-indicators">
                        @foreach(\App\Models\Review::select('*')->where('artist_id', $artist_info[0]->user_id )->get() as $review)
                            <?php $nCount = 0; $nIndex = 0; ?>
                            @if( $nCount % 3 == 0)
                               <li data-target="#carouselExampleIndicators" data-slide-to="{{$nIndex}}" class="{{ $nIndex==0 ? 'active' : '' }}"></li>
                               <?php $nIndex++; ?>
                            @endif
                            <?php $nCount++; ?>
                        @endforeach
                    </ol>

                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-inner">
                            <?php
                             $reviewCount = 0;
                                foreach($artist_reviews as $review)
                                    {

                                        if($reviewCount == 0)
                                        {
                                            echo "<div class='carousel-item active'>";
                                            echo "<div class='row'>";
                                            echo "<div class='col-md-4 review2'>".$review->review."<p class='author'>".$review->title."</p></div>";

                                        }
                                        elseif($reviewCount % 3 == 0)
                                        {

                                            echo "</div>";
                                            echo "</div>";
                                            echo "<div class='carousel-item'>";
                                            echo "<div class='row'>";
                                            echo "<div class='col-md-4 review2'>".$review->review."<p class='author'>".$review->title."</p></div>";
                                        }
                                        else{
                                            echo "<div class='col-md-4 review2'>".$review->review."<p class='author'>".$review->title."</p></div>";
                                        }

                                        $reviewCount++;
                                    }

                                ?>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <!-- End Mine -->
            </div>
        </div>
    </div>





    </div>



    <div class="dark_box">


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
    {{--     <script src="{{ asset('js/jquery.min.js') }}"></script>--}}
    {{--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>--}}
    {{--     <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>--}}
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // dreamcat
            $("#book_anch_down").click(function(e){

                var $anchor = $(this);
                $('html, body').stop().animate({
                    scrollTop: $($anchor.attr('href')).offset().top
                }, 1500);
                e.preventDefault(); //this is the important line.
            });


            var scroll_to = $("#scroll_to").val();

            if(scroll_to != "none")
            {
                if(scroll_to=="music")
                {
                    $('html, body').stop().animate({
                        scrollTop: $("#achor_music").offset().top
                    }, 1500);
                    e.preventDefault();
                }
                else if(scroll_to == "video")
                {
                    $('html, body').stop().animate({
                        scrollTop: $("#achor_video").offset().top
                    }, 1500);
                    e.preventDefault();
                }
            }
            // end editing
        });
        function clickThum(url)
        {
            document.getElementById('vid_frame').src='https://www.youtube.com/embed/' + url;
        }
    </script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/js/tempusdominus-bootstrap-4.min.js">
        <script >

        $(document).ready(function () {

            $('.carousel').carousel();
        })
        var MusicCarousel = document.querySelector('#MusicCarousel');
        var carousel = new bootstrap.Carousel(MusicCarousel, {
            interval: 2000,
            wrap: false
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
    </script>
@endsection
@section('styles')
    <link rel="stylesheet" href="{{ asset('css/music2.css') }}">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css"/>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/css/tempusdominus-bootstrap-4.min.css"/>

    <style>
        .date {
            padding: 0;
            border: none;
        }

        .invalid-feedback {
            display: initial;
        }

    </style>
@endsection
