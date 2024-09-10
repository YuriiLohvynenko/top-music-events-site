<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>.:TOP MUSIC EVENTS:. BETA</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    @yield('styles')
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
    </script>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
    </script>
    <script>
        window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')

    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script>
    $(document).ready(function(){
        $('.carousel').carousel();

    })

    </script>
    @yield('scripts')
</head>

<body>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="/">Home</a>
  <a href="/about">About</a>
  <a href="#">How It Works</a>
  <a href="#">Latest News</a>
  <a href="#">Contact</a>
</div>


<div id="mySidenav2" class="sidenav2">
  <a href="javascript:void(0)" class="closebtn2" onclick="closeNav2()">&times;</a>
  <h4>Search</h4>
  <input class="main_search" placeholder="artists, keywords..." />
   <a href="#"><button class="my_but3">Find Now</button></a>
</div>

<div id="mySidenav3" class="sidenav3">
  <a href="javascript:void(0)" class="closebtn2" onclick="closeNav3()">&times;</a>
  <h4>Contact Us</h4>
  <h6>Call us on:<br>
  0780 9671 303</h6>
  <br>
  <h6>Send Message:</h6>
  <input class="main_search" placeholder="Your Full Name" />
  <input class="main_search" placeholder="Your E-mail" />
  <input class="main_search" placeholder="Your Telephone" />
  <input class="main_search" placeholder="Subject" />
  <textarea class="side_area" placeholder="Your Message"></textarea>
  <a href="#"><button class="my_but3">Send Message</button></a>
</div>



 <nav class="my_navbar fixed-top">
    <div class="row">
      <div class="col-xs-4 col-sm-4 col-md-4 top_left">
        <div class="appbar-item appbar-menu-icon" id="toggle-sidebar-left"><img src="img/menu.png" onclick="openNav()" class="hover" /></div>
       </div>
      <div class="col-xs-4 col-sm-4 col-md-4 top_middle">
        <img src="{{ asset('img/logo.png') }}" class="hover"  />
      </div>
      <div class="col-xs-4 col-sm-4 col-md-4 top_right">
         <img src="img/search.png" class="hover" onclick="openNav2()"  /> &nbsp; &nbsp; <img src="img/contact.png" onclick="openNav3()"  class="hover">
      </div>
    </div>
 </nav>

    <main role="main">
        @yield('content')
    </main>
    @include('layouts.footer')
</body>

</html>
