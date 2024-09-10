@extends('admin.layouts.app-message')
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
@section('content')
    <div class="page-content">

        <div class="content">
            @if(Session::has('success'))
                <div class="alert alert-success">
                    <strong>Success: </strong>{{ Session::get('success') }}
                </div>
            @elseif(Session::has('error'))
                <div class="alert alert-danger">
                    <strong>Error: </strong>{{ Session::get('error') }}
                </div>
            @endif
            <div class="page-title"><a href="{{ route('email') }}" id="btn-back"><i class="icon-custom-left"></i></a>
                <h3>Back- <span class="semi-bold">Inbox</span></h3>
                <a href="{{ action('admin\MessageController@forward', ['id' => $message->id]) }}"
                   data-target="#forward_modal" class="btn btn-info bg-green pull-right btn-show">FORWARD</a>
                <a data-toggle="modal" data-target="#print_modal" class="btn btn-info bg-green pull-right btn-show">PRINT</a>
                <a href="{{ action('admin\MessageController@reply', ['id' => $message->id]) }}"
                   data-target="#reply_modal" class="btn btn-info bg-green pull-right btn-show">REPLY</a>
                @if(!App\Models\User::where('email', $message->from)->exists())
                    <a data-toggle="modal" data-target="#quote_modal" class="btn btn-dark bg-dark pull-right btn-show">SEND
                        QUOTE REQUEST</a>
                @endif


            </div>
            <div class="row" id="inbox-wrapper">
                <div class="col-md-12" id="preview-email-wrapper">
                    <div class="grid simple">
                        <div class="grid-body no-border" style="min-height: 850px;">
                            <div class="">
                                <h1 id="emailheading" class="pull-left">{{ $message->subject }}</h1>

                                <br>
                                <div class="clearfix"></div>
                                <div class="control">
                                    <div class="pull-left">
                                        <div class="btn-group">
                                            <a href="#" data-toggle="dropdown" class="btn btn-mini dropdown-toggle">
                                                {{ $message->from }}
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu">
                                                @if($message->trashed == 0)
                                                    @if($message->from != Auth::user()->email)
                                                        <li><a
                                                                href="{{ action('admin\MessageController@reply', ['id' => $message->id]) }}">Reply</a>
                                                        </li>
                                                        <li><a
                                                                href="{{ action('admin\MessageController@forward', ['id' => $message->id]) }}">Forward</a>
                                                        </li>
                                                    @endif
                                                    <li><a
                                                            href="{{ action('admin\MessageController@singletrash', ['id' => $message->id]) }}">Move
                                                            to Trash</a></li>
                                                @else
                                                    <li><a
                                                            href="{{ action('admin\MessageController@singlerecover', ['id' => $message->id]) }}">Recover</a>
                                                    </li>
                                                    <li><a
                                                            href="{{ action('admin\MessageController@singledelete', ['id' => $message->id]) }}">Forever
                                                            Delete</a></li>
                                                @endif
                                            </ul>
                                        </div>
                                        <label class="inline"><span class="muted">&nbsp;&nbsp;to</span> <span
                                                class="bold small-text">{{ $message->to }}</span></label>
                                    </div>
                                    <div class="pull-right">
                                    <span class="muted small-text">{{ $message->event_date }}</span>


                                    </div>
                                    <div class="clearfix"></div>
                                    <br/>
                                </div>
                                <br>
                                <div class="email-body">
                                    <div class="clearfix content-area">
                                        <span class="label label-info">{{ $message->name }}</span>
                                        <span class="label label-info">{{ $message->tel }}</span>
                                        <span class="label label-info">{{ $message->from }}</span>
                                        {!! $message->content !!}

                                    </div>
                                    <br/>
                                    @if($message->file != NUll)
                                        <a href="{{ public_path('uploads\\' . $message->file)  }}" download>
                                            <i class="fa fa-file"></i>
                                            Download</a>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="quote_modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body text-center" style="height: 500px">
                    <div id="first-section">
                        <h1>Send Quotes To Artists</h1>
                        <p>1. Method - Send Quotes Requests to Individual Artists</p>
                        <a class="btn btn-secondary" id="ind_art">SEND TO INDIVIDUAL ARTISTS</a>
                        <br/><br/>
                        <p>2. Method - Send Quotes Requests to Selected Artists Only</p>
                        <a class="btn btn-secondary" id="sel_art">SEND TO SELECTED ARTISTS</a>
                        <br/><br/>
                        <p>3. Method - Send Quotes Requests to Artists by Attributes</p>
                        <a class="btn btn-secondary" id="att_art">SEND TO ARTISTS BY ATTRIBUTES</a>
                    </div>
                    <div id="second-section" style="display: none;">
                        <form action="{{ action('admin\MessageController@send') }}" method="post">
                            @csrf
                            <h1>Send Quotes to Individual Artists</h1>
                            <br>
                            <label for="multi">Select Artists</label>

                            <div class="input-group mb-3" style="display: flex;">
                                <input type="text" id="artist" class="form-control" placeholder="Artist"
                                       aria-label="Recipient's username" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-info bg-green"
                                            onclick="addArtistToList(event, $('#artist').val())" type="button">ADD
                                        ARTIST
                                    </button>
                                </div>
                                <div id="artistList"></div>
                            </div>
                            <div id="list">
                            </div>

                            <input type="text" class="form-control" name="subject" value="Quote" style="display: none;">
                            <textarea placeholder="Enter text ..." class="form-control text-area" rows="25"
                                      name="content"
                                      style="display: none;"></textarea>
                            <br/><br/>
                            <button class="btn btn-success" type="submit" style="position: absolute;
    bottom: 5%;
    right: 42%;">Send To Artists Now
                            </button>
                            <button class="btn btn-secondary prev-event" type="button" style="position: absolute;
    bottom: 5%;
    right: 31%;">Back
                            </button>
                        </form>
                    </div>
                    <div id="third-section" style="display: none;">
                        <form action="{{ action('admin\MessageController@send') }}" method="post">
                            @csrf
                            <h1>Send Quotes to Selected Artists</h1>
                            <br>
                            <div>
                                <label for="">Select Artists</label>
                            </div>
                            <div class="form-group text-left" style="height: 200px; margin-top: 60px;   flex-direction: column;
  flex-wrap: wrap;
  display: flex;">
                                @foreach (App\Models\Artist::where('role_id', 1)->where('status_id', 1)->get() as $item)
                                    <div class="checkbox check-success col-md-4" style=" flex: 1 0 25%;">
                                        <input name="check_artist[]" type="checkbox" value="{{ $item->id }}"
                                               id="checkbox{{ $loop->index }}">
                                        <label for="checkbox{{ $loop->index }}"><a
                                                href="{{ route('artists.detail', ['artist' => $item->id, 'profileid' => $item->id]) }}"
                                                target="_blank">{{ $item->fullname }}</a></label>
                                    </div>
                                @endforeach
                            </div>

                            @if(App\Models\Artist::where('role_id', 1)->where('status_id', 1)->count() > 0)
                                <div class="checkbox check-success col-md-12" style=" flex: 1 0 25%;">
                                    <input type="checkbox" id="checkbox" onClick="toggle(this)" name="to" value="">
                                    <label for="checkbox"><a target="_blank">Select All</a></label>
                                </div>
                            @endif
                            <input type="text" class="form-control" name="subject" value="Quote" style="display: none;">
                            <textarea placeholder="Enter text ..." class="form-control text-area" rows="25"
                                      name="content"
                                      style="display: none;"></textarea>
                            <br/><br/>
                            <button class="btn btn-success" type="submit" style="position: absolute;
    bottom: 5%;
    right: 42%;">Send To Artists Now
                            </button>
                            <button class="btn btn-secondary prev-event" type="button" style="position: absolute;
    bottom: 5%;
    right: 31%;">Back
                            </button>
                        </form>
                    </div>
                    <div id="firth-section" style="display: none;">
                        <form action="{{ action('admin\MessageController@send') }}" method="post">
                            @csrf
                            <h1>Send Quotes to Selected By These Attributes</h1>
                            <div class="form-group text-left">
                                <label for="event">Event</label>
                                <select class="pay_input form-control" name="event" required>
                                    @foreach (App\Models\Event::all() as $event)
                                        <option value="{{ $event->id }}">{{ $event->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group text-left">
                                <label for="act">Act Type</label>
                                <select class="pay_input form-control" name="act" required>

                                    @foreach (App\Models\Act::all() as $act)
                                        <option value="{{ $act->id }}">{{ $act->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group text-left">
                                <label for="location">Llocation</label>
                                <select class="pay_input form-control" name="location" required>
                                    @foreach (App\Models\Country::all() as $country)
                                        <optgroup label="{{ $country->name }}">
                                            @foreach ($country->location as $item)
                                                <option value="{{ $item->id }}">{{ $item->name }}</option>
                                            @endforeach
                                        </optgroup>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group text-left">
                                <label for="date">Event Date</label>
                                <div class="input-append success date" id="date-modal-form">
                                    <input type="text" name="date" id="date" placeholder="Date From" value="@if($message->created_at != null) {{with($message->created_at)->format('d/m/y') }} @endif">
                                    <span class="add-on"><span class="arrow"></span><i class="fa fa-th"></i></span>
                                </div>
                            </div>
                            <input type="text" class="form-control" name="subject" value="Quote" style="display: none;">
                            <textarea placeholder="Enter text ..." class="form-control text-area" rows="25"
                                      name="content"
                                      style="display: none;"></textarea>
                            <button class="btn btn-success" type="submit">Send To Artists Now</button>
                            <button class="btn btn-secondary prev-event" type="button">Back</button>
                        </form>
                    </div>
                    <div id="fifth-section" style="display: none;">
                        <h1>Send Quote To Artists By These Attributes</h1>
                        <br>
                        <img src="{{ asset('img/success.png') }}" alt="" style="width: 100%">
                        <br>
                        <button class="btn btn-success" type="button">Continue</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('scripts')

    <script src="{{ asset('adminn/assets/plugins/bootstrap-select2/select2.min.js') }}" type="text/javascript"></script>
    <script>

        // $(function() {
        //     $('#date').datetimepicker({
        //         format : "DD/MM/YYYY"
        //     });
        // });
        function toggle(source) {

            checkboxes = document.getElementsByName('check_artist[]');
            for (var i = 0, n = checkboxes.length; i < n; i++) {
                checkboxes[i].checked = source.checked;
            }
        }

        var emails = [];

        function addArtistToList(event, input) {

            event.preventDefault();

            var artistsWithEmail = {!! json_encode($artistsWithEmail->toArray()) !!};

console.log(artistsWithEmail);
// input = name  value = email
            for (var key in artistsWithEmail) {
                 var value = artistsWithEmail[key];
//                 console.log(value);
// console.log(value);
                if (input == key) {

                    if (emails.includes(value)) {
                        var element = '';
                    } else {

                        emails.push(value);

                        var element = '<div id="'+value+'" class="row"><label for="artist"  style="margin-top: 15px" class="col-md-10"><input type="hidden"  name="artist_individual_email[]" value="' + value + '"> ' + input + '-' + value + ' </label><a id="'+value+'"  href="#" style="padding: 0px; height: 4%; width: 4%;margin-top: 15px" onclick="removeEmail(event, this.id)" class="small-btn btn-danger col-md-2">x</a></div>';
                    }
                }

            }



            var listContainer = $('#list');
            if (element) {
                listContainer.append('<div>' + element + '</div>');

            }


        }

        function removeEmail(event, id) {

            event.preventDefault();
            document.getElementById(id).remove();
            emails.splice(id,1);
        }




        var artists = {!! json_encode($artists->toArray()) !!};

        function autocomplete(inp, arr) {

            var currentFocus;
            /*execute a function when someone writes in the text field:*/
            inp.addEventListener("input", function (e) {
                var a, b, i, val = $.trim(this.value);
                /*close any already open lists of autocompleted values*/
                closeAllLists();
                if (!val) {
                    return false;
                }

                currentFocus = -1;
                /*create a DIV element that will contain the items (values):*/
                a = document.createElement("DIV");
                a.setAttribute("id", this.id + "autocomplete-list");
                a.setAttribute("class", "autocomplete-items");
                /*append the DIV element as a child of the autocomplete container:*/
                this.parentNode.appendChild(a);
                /*for each item in the array...*/
                for (i = 0; i < arr.length; i++) {
                    /*check if the item starts with the same letters as the text field value:*/
                    if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                        /*create a DIV element for each matching element:*/
                        b = document.createElement("DIV");
                        /*make the matching letters bold:*/
                        b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                        b.innerHTML += arr[i].substr(val.length);
                        /*insert a input field that will hold the current array item's value:*/
                        b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                        /*execute a function when someone clicks on the item value (DIV element):*/
                        b.addEventListener("click", function (e) {
                            /*insert the value for the autocomplete text field:*/
                            inp.value = this.getElementsByTagName("input")[0].value;
                            /*close the list of autocompleted values,
                            (or any other open lists of autocompleted values:*/
                            closeAllLists();
                        });
                        a.appendChild(b);
                    }
                }
            });
            /*execute a function presses a key on the keyboard:*/
            inp.addEventListener("keydown", function (e) {
                var x = document.getElementById(this.id + "autocomplete-list");
                if (x) x = x.getElementsByTagName("div");
                if (e.keyCode == 40) {
                    /*If the arrow DOWN key is pressed,
                    increase the currentFocus variable:*/
                    currentFocus++;
                    /*and and make the current item more visible:*/
                    addActive(x);
                } else if (e.keyCode == 38) { //up
                    /*If the arrow UP key is pressed,
                    decrease the currentFocus variable:*/
                    currentFocus--;
                    /*and and make the current item more visible:*/
                    addActive(x);
                } else if (e.keyCode == 13) {
                    /*If the ENTER key is pressed, prevent the form from being submitted,*/
                    e.preventDefault();
                    if (currentFocus > -1) {
                        /*and simulate a click on the "active" item:*/
                        if (x) x[currentFocus].click();
                    }
                }
            });

            function addActive(x) {
                /*a function to classify an item as "active":*/
                if (!x) return false;
                /*start by removing the "active" class on all items:*/
                removeActive(x);
                if (currentFocus >= x.length) currentFocus = 0;
                if (currentFocus < 0) currentFocus = (x.length - 1);
                /*add class "autocomplete-active":*/
                x[currentFocus].classList.add("autocomplete-active");
            }

            function removeActive(x) {
                /*a function to remove the "active" class from all autocomplete items:*/
                for (var i = 0; i < x.length; i++) {
                    x[i].classList.remove("autocomplete-active");
                }
            }

            function closeAllLists(elmnt) {
                /*close all autocomplete lists in the document,
                except the one passed as an argument:*/
                var x = document.getElementsByClassName("autocomplete-items");
                for (var i = 0; i < x.length; i++) {
                    if (elmnt != x[i] && elmnt != inp) {
                        x[i].parentNode.removeChild(x[i]);
                    }
                }
            }

            /*execute a function when someone clicks in the document:*/
            document.addEventListener("click", function (e) {
                closeAllLists(e.target);
            });
        }

       var inputSearch = document.getElementById("artist");

      autocomplete(inputSearch, artists);


        $('#ind_art').on('click', function () {
            $('#first-section').hide();
            $('#second-section').show();
        });
        $('#sel_art').on('click', function () {
            $('#first-section').hide();
            $('#third-section').show();
        });
        $('#att_art').on('click', function () {
            $('#first-section').hide();
            $('#firth-section').show();
        });
        $('.prev-event').click(function () {
            $('#first-section').show();
            $('#second-section').hide();
            $('#third-section').hide();
            $('#firth-section').hide();
        })


    </script>
    <script src="{{asset('adminn/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js')}}"
            type="text/javascript">
    </script>
    <script>
        $('.input-append.date').datepicker({
            format: 'dd/mm/yyyy',
            autoclose: true,
            todayHighlight: true,
        });

        $('.message-tab li:nth-child(1)').addClass('active');
        $(document).ready(function () {
            $('.text-area').text($('.content-area span:last-child').text());
        })
    </script>

@endsection
@section('styles')

    <link href="{{ asset('adminn/assets/plugins/bootstrap-select2/select2.css') }}" rel="stylesheet" type="text/css"
          media="screen"/>
    <style>
        #date-modal-form {
            display: flex;

        }

        #date-modal-form span {
            right: 20px;
        }

        .page-title h3 {
            width: initial !important;
        }
    </style>
@endsection
