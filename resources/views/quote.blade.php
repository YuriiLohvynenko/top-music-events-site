@extends('layouts.app')
@section('content')
<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="top_section6">
    <div class="row" style="margin:0">
        <div class="col-md-12 top_box">
            <h1>SUBMIT QUOTE</h1>
        </div>
    </div>
</div>
<div class="top_section22">
</div>
<div class="container">
    <form name="RegForm" action="{{ route('sendquote') }}" method="POST" onsubmit="return validateForm()">
        @csrf
        <h2 class="quote_head center">Fill the form below and receive quotes from available artists who are
            available at your provided date.<br />
            Our friendly team will help you to find the most suitable acts for your event.</h2>
        <div class="row">
            <div class="col-md-12 center">
                <select class="pay_input" name="event">
                    <option style="display: none" value="">Select Your Event Type  </option>
                    @foreach ($events as $event)
                    <option value="{{ $event->name }}">{{ $event->name }}</option>
                    @endforeach
                </select> <span style="color: red ;">*</span>
                <br />
                @error('event')
                <span class="error">
                    <strong>{{ $message }}</strong>
                </span><br />
                @enderror
                <select class="pay_input" name="act">
                    <option style="display: none" value="">Select Your Act Type</option>
                    @foreach ($acts as $act)
                    <option value="{{ $act->name }}">{{ $act->name }}</option>
                    @endforeach
                </select> <span style="color: red ;">*</span>
                <br />
                @error('act')
                <span class="error">
                    <strong>{{ $message }}</strong>
                </span>
                <br />
                @enderror
                <select class="pay_input" name="location">
                    <option style="display: none" value="">Select Your Location</option>
                    @foreach ($countries as $country)
                    <optgroup label="{{ $country->name }}">
                        @foreach ($country->location as $item)
                        <option value="{{ $item->name }}">{{ $item->name }}</option>
                        @endforeach
                    </optgroup>
                    @endforeach
                </select> <span style="color: red ;">*</span>
                <br />
                @error('location')
                <span class="error">
                    <strong>{{ $message }}</strong>
                </span>
                <br />
                @enderror
                <div class="input-group date pay_input " id="eventdatetimepicker" data-target-input="nearest">
{{--                    <input type="text" name="eventdate" placeholder="Event Date" class="form-control datetimepicker-input " data-target="#eventdatetimepicker" />--}}

                    <input name="eventdate" type="text" id="date_from" name="docDateFrom" value=""
                           class="form-control datepicker " autocomplete="off" data-target="#eventdatetimepicker" data-toggle="datetimepicker" style="margin-left: -6px">
                    <div class="input-group-append" data-target="#eventdatetimepicker" data-toggle="datetimepicker">
                    </div>
                    <div class="input-group-text" ><i class="fa fa-calendar"></i> </div>
                </div>
                <script type="text/javascript">
                    $(function() {
                        $('#eventdatetimepicker').datetimepicker({
                            format : "DD/MM/YYYY"
                        });
                    });

                </script>
                @error('eventdate')
                <span class="error">
                    <strong>{{ $message }}</strong>
                </span>
                <br />
                @enderror
                <label>
{{--                    dreamcat--}}
                    <textarea id="comment_id" class="pay_input" type="text" placeholder="Your Requirements & Comments" style="min-height:280px; margin-bottom:0px; margin-left: -5px;" name="content"></textarea>
                    <div class="pay_input" style="font-size: 14px; border:none; text-align: right; padding:0; margin-top:-5px; margin-bottom: 0px; font-weight: 400;">
                        {{--                        <span id="star_default" style="color: red ;">*</span>--}}
                        <span id="star_warn" style="color: red ;">Maximum allowed characters is 2000 *</span>
                    </div>
{{--                    end editing--}}
                </label>
                @error('content')
                <br />
                <span class="error">
                    <strong>{{ $message }}</strong>
                </span>
                <br />
                @enderror
                <h2 class="quote_head center">Please provide your contact details:</h2>
                <input class="pay_input" type="text" placeholder="Your Name" name="name" /> <span style="color: red ;">*</span>
                <br />
                @error('name')
                <span class="error">
                    <strong>{{ $message }}</strong>
                </span>
                <br />
                @enderror
                <input class="pay_input" type="text" placeholder="Your Telephone" name="tel" /> <span style="color: red ;">*</span>
                <br />
                @error('tel')
                <span class="error">
                    <strong>{{ $message }}</strong>
                </span>
                <br />
                @enderror
                <input class="pay_input" type="email" placeholder="Your E-mail Address" name="email" /> <span style="color: red ;">*</span>
                <br />
                @error('email')
                <span class="error">
                    <strong>{{ $message }}</strong>
                </span>
                <br />
                @enderror
            </div>
        </div>
        <div class="pay_now">
            <button class="my_but4" type="submit">SUBMIT YOUR QUOTE</button>
        </div>
    </form>
</div>
@include('layouts.bottom')
@endsection
@section('scripts')
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="//cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
<script>
$(document).ready(function(){
 $('.carousel').carousel();
})


function validateForm() {
    var event = document.forms["RegForm"]["event"];
    var act = document.forms["RegForm"]["act"];
    var location = document.forms["RegForm"]["location"];
    var eventdatetimepicker = document.forms["RegForm"]["eventdate"];
    var val =  document.getElementById("comment_id").value;
    var name = document.forms["RegForm"]["name"];
    var email = document.forms["RegForm"]["email"];
    var tel = document.forms["RegForm"]["tel"];


    if (val.length > 2000  ) {

        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'The content may not be greater than 2000 character',

        })
        return false;

     } if (val.length <= 0) {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'The content may not be empty',

        })
        return false;
    }

    if (event.value == ""){
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Please select your event type',

        })
        return false;

    }
    if (act.value == ""){
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Please select your act type',

        })
        return false;

    }
    if (name.value == ""){
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Please select your name',

        })
        return false;

    }
    if (tel.value == ""){
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Please select your telephone',

        })
        return false;

    }
    if (email.value == ""){
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Please select your email',

        })
        return false;

    }
    if (eventdatetimepicker.value == ""){
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Please select your date',

        })
        return false;

    }
    if (location.value == ""){
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Please select your location type',

        })
        return false;

    }
    return true;



}

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
<link rel="stylesheet" href="{{ asset('css/music2.css') }}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href="sweetalert2.min.css">

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
