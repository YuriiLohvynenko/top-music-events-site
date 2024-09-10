$(document).ready(function(){
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $('.carousel').carousel();
    $("#filtering").keyup(function(){
        var key = $(this).val();
        var data = {key:key};
        $.ajax({
           type:'POST',
           url:"{{ route('ajaxRequest.post') }}",
           data:data,
           dataType: "json",
           success:function(data) {
              console.log("response", data.success);
           }
        });
    })
})