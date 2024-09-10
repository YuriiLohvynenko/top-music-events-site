@extends('layouts.app')
@section('content')

<div class="top_section4">
    <div class="row" style="margin:0">
      <div class="col-md-12 top_box">
        <h1>ABOUT US</h1>
      </div>
    </div>
  </div>

  <div class="top_section22">
    
  </div>


<div class="container">
   <h2 class="about_head">OUR HISTORY</h2>
  <div class="row">
    <div class="col-md-6 about">
     
       <p>
      Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
      </p>
       <p>
      Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
      </p>
       <p>
      Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
      </p>
    </div>
    <div class="col-md-6">
      <img src="img/about.jpg" class="my_img" />
    </div>
  </div>
</div>

  <div class="soft_bg">
    <div class="container">
      <div class="row">
        <div class="col-md-5">
          <img class="my_img" src="img/about2.jpg" />
        </div>

        <div class="col-md-7 about">
          <h2 class="about_head2">OUR HISTORY</h2>
           <p>
          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
          </p>
           <p>
          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
          </p>
          <p>
          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
          </p>
        </div>
    </div>
  </div>









</div>

 
  

<div class="dark_box">

         
      <div class="bigger_txt white">Haven’t found what you are looking for?<br />
Contact our team now for help and more information.</div>
      
          <div class="row">
            <div class="col-md12 center"><button class="my_but4">SEND US MESSAGE</button></div>
          </div>

  </div>

    @include('layouts.bottom')
@endsection
@section('scripts')
{{-- <script src="js/jquery.min.js"></script>
<script src="js/simpler-sidebar.min.js"></script> --}}
</script>
<script>
$(document).ready(function(){
 $('.carousel').carousel();
})
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