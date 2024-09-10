@extends('admin.layouts.app')
@section('content')
<!-- BEGIN PAGE CONTAINER-->
<div class="page-content">
    <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
    <div id="portlet-config" class="modal hide">
        <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"></button>
            <h3>Widget Settings</h3>
        </div>
        <div class="modal-body"> Widget settings form goes here </div>
    </div>
    <div class="clearfix"></div>
    <div class="content">
        <div class="page-title">
            <h3>Info </h3>
            <a type="button" class="btn btn-success pull-right" href="{{ route('profiles.edit', ['artist' => $artist->user->id, 'profileid' => $artist->id]) }}">Back</a>
        </div>
        <div class="row">
            <div class="col-md-12">
                <a type="button" class="btn  btn-cons pull-left"
                    href="{{ route('showvideo', ['artist' => $artist->user->id, 'profileid' => $artist->id]) }}">ADD
                    VIDEOS</a> &nbsp; &nbsp;
                <a type="button" class="btn  btn-cons pull-left"
                    href="{{ route('showimage', ['artist' => $artist->user->id, 'profileid' => $artist->id]) }}">ADD
                    IMAGES</a> &nbsp; &nbsp;
                <a type="button" class="btn  btn-cons pull-left"
                    href="{{ route('showmusic', ['artist' => $artist->user->id, 'profileid' => $artist->id]) }}">ADD
                    MUSIC</a> &nbsp; &nbsp;
                <a type="button" class="btn  btn-cons pull-left"
                    href="{{ route('showsocial', ['artist' => $artist->user->id, 'profileid' => $artist->id]) }}">ADD
                    SOCIAL ACCOUNTS</a> &nbsp; &nbsp;
                <a type="button" class="btn  btn-cons pull-left"
                    href="{{ route('showpricing', ['artist' =>  $artist->user->id, 'profileid' => $artist->id]) }}">ADD
                    LOCATION & PRICES</a> &nbsp; &nbsp;
                <a type="button" class="btn  btn-cons pull-left"
                    href="{{ route('showrepertorie', ['artist' =>  $artist->user->id, 'profileid' => $artist->id]) }}">ADD
                    Repertorie</a> &nbsp; &nbsp;
                <a type="button" class="btn  btn-cons pull-left active"
                    href="{{ route('showinfo', ['artist' =>  $artist->user->id, 'profileid' => $artist->id]) }}">ADD
                    Info</a>
                <a type="button" class="btn  btn-cons pull-left " style=""
                   href="{{ route('addReview', ['artist' =>  $artist->user->id, 'profileid' => $artist->id]) }}">REVIEW</a> &nbsp;
            </div>
        </div>
        <!-- ID CONTAINER -->
        <div id="container">
            <!-- MY TABLE -->
            <div class="row-fluid">
                <div class="span12">
                    <div class="grid simple ">
                        <div class="grid-title">
                            <h4>
                                <span class="semi-bold">Info</span>
                            </h4>
                        </div>
                        <div class="grid-body ">
{{--                            Editing by dreamcat--}}
                            <div class="row">
{{--                                <form action="{{ route('addinfo', ['artist' => $artist->user->id, 'profileid' => $artist->id]) }}" method="POST" enctype="multipart/form-data">--}}
{{--                                    @csrf--}}
{{--                                    <div class="col-md-4">--}}
{{--                                        <div class="form-group">--}}
{{--                                            <label for="features">Features</label>--}}
{{--                                            <textarea name="features" id="features" cols="30" rows="3" style="width: 100%"></textarea>--}}
{{--                                        </div>--}}
{{--                                        @error('features')--}}
{{--                                        <span class="error">--}}
{{--                                            <strong>{{ 'This field is requied.' }}</strong>--}}
{{--                                        </span>--}}
{{--                                        @enderror--}}
{{--                                    </div>--}}
{{--                                    <div class="col-md-4">--}}
{{--                                        <div class="form-group">--}}
{{--                                            <label for="about">About</label>--}}
{{--                                            <textarea name="about" id="about" cols="30" rows="3" style="width: 100%"></textarea>--}}
{{--                                        </div>--}}
{{--                                        @error('about')--}}
{{--                                        <span class="error">--}}
{{--                                            <strong>{{ $message }}</strong>--}}
{{--                                        </span>--}}
{{--                                        @enderror--}}
{{--                                    </div>--}}
{{--                                    <div class="clearfix"></div>--}}
{{--                                    <div class="col-md-12">--}}
{{--                                        <p>--}}
{{--                                            <button type="submit" class="btn btn-danger">Add New</button>--}}
{{--                                        </p>--}}
{{--                                    </div>--}}
{{--                                </form>--}}
                            </div>
{{--                            End editing by dreamcat--}}
                            <div class="row">
                                <div class="col-md-12">
                                    <div id="example1" class="list-group col">
                                        <input hidden id="del_artist_id" value="{{$artist->id}}" />
                                        @if(count($info))
                                        <form action="{{ route('updateinfo', ['artist' => $artist->user->id, 'profileid' => $artist->id]) }}" method="POST" enctype="multipart/form-data">
                                            @csrf
                                            @foreach ($info as $infos)
                                            <div class="list-group-item" style="overflow: hidden">
                                                <div class="col-md-4">
                                                    <span class="">
    {{--                                                    CSS Editing by dreamcat--}}
                                                        <textarea name="features" id="infof{{ $infos->id }}" rows="7" style="min-width: 100%; max-width: 100%; height: 300px;">{{ $infos->features }}</textarea>
    {{--                                                    End css editing--}}
                                                    </span>
                                                </div>
                                                <div class="col-md-8">
    {{--                                                Editing by dreamcat--}}
    {{--                                                <span class="">--}}
    {{--                                                    <textarea name="about" id="info{{ $infos->id }}" rows="7" style="min-width: 100%; max-width: 100%">{{ json_encode($infos->about) }}</textarea>--}}
    {{--                                                </span>--}}
                                                        <textarea  class="myeditablediv" name="about" id="info{{ $infos->id }}" rows="7" style="min-width: 100%; max-width: 100%">{{ $infos->about }}</textarea>
                                                        @error('content')
                                                        <span class="error">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                        @enderror
    {{--                                            End editing by dreamcat--}}
                                                </div>
                                                <div class="col-md-3">
                                                    <span class="text-center">
                                                        <button type="submit" class="btn btn-danger">Save</button>
                                                        <button type="button" onclick="deleteaddon({{ $artist->id }}, {{ $infos->id }})" class="btn btn-secondary">Delete</button>
{{--                                                        <a onclick="editaddon({{ $artist->id }}, {{ $infos->id }})" class="btn btn-danger">Save</a>--}}
{{--                                                        <a onclick="deleteaddon({{ $artist->id }}, {{ $infos->id }})" class="btn btn-secondary">Delete</a>--}}
                                                    </span>
                                                </div>
                                            </div>
                                            @endforeach
                                        </form>
                                        @else
                                            <div class="list-group-item" style="overflow: hidden">
                                                <form action="{{ route('addinfo', ['artist' => $artist->user->id, 'profileid' => $artist->id]) }}" method="POST" enctype="multipart/form-data">
                                                    @csrf
                                                <div class="col-md-4">
                                                    <textarea name="features" id="features"  rows="7" style="min-width: 100%; max-width: 100%; height: 300px;"></textarea>
                                                </div>
                                                <div class="col-md-8">
                                                    <textarea  class="myeditablediv" name="about" id="about" rows="7" style="min-width: 100%; max-width: 100%"></textarea>
                                                    @error('content')
                                                    <span class="error">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                    @enderror
                                                </div>
                                                    <div class="col-md-3">
                                                        <button type="submit" class="btn btn-danger">Add New</button>
                                                    </div>
                                                </form>
                                            </div>

                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END OF MY TABLE -->
            <div class="MY LOCK" style="display:none">
                <div id="chart"> </div>
                <div id="world-map" style="height:405px"></div>
                <div id="mini-chart-orders"></div>
                <div id="mini-chart-other"></div>
                <div id="ricksaw"></div>
                <div id="legend"></div>
                <canvas id="wind" width="32" height="32"></canvas>
                <canvas id="rain" width="32" height="32"></canvas>
                <canvas id="partly-cloudy-day" width="120" height="120"></canvas>
            </div>
        </div>
        <!-- END PAGE -->
    </div>
</div>
<!-- END CONTAINER -->
@endsection
@section('scripts')
{{--    Editing by dreamcat--}}
    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>

        var countOfFileElements = 0;
        function addNewSection(event) {
            ++countOfFileElements;
            event.preventDefault();
            var element = '<label class="form-label">Section Content</label><textarea class="myeditablediv" id="section_'+countOfFileElements+'" name="content_section[]"></textarea>';
            var removeButton = '<a href="#" style="margin: 5px" onclick="removeElement(event, ' + countOfFileElements + ')" class="btn btn-danger">Remove Section</a>';
            var filesContainerId = $('#section-container');

            filesContainerId.append('<div id="js-content-'+countOfFileElements+'" class="col-sm-12" style="margin: 5px;">' + element  + removeButton + '</div>');
            var useDarkMode = window.matchMedia('(prefers-color-scheme: dark)').matches;

            tinymce.init({
                selector: '.myeditablediv',
                plugins: 'print preview paste importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap quickbars emoticons',
                imagetools_cors_hosts: ['picsum.photos'],
                menubar: 'file edit view insert format tools table help',
                toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl',
                toolbar_sticky: true,
                autosave_ask_before_unload: true,
                autosave_interval: '30s',
                autosave_prefix: '{path}{query}-{id}-',
                autosave_restore_when_empty: false,
                autosave_retention: '2m',
                image_advtab: true,
                link_list: [
                    {title: 'My page 1', value: 'https://www.tiny.cloud'},
                    {title: 'My page 2', value: 'http://www.moxiecode.com'}
                ],
                image_list: [
                    {title: 'My page 1', value: 'https://www.tiny.cloud'},
                    {title: 'My page 2', value: 'http://www.moxiecode.com'}
                ],
                image_class_list: [
                    {title: 'None', value: ''},
                    {title: 'Some class', value: 'class-name'}
                ],
                importcss_append: true,
                file_picker_callback: function (callback, value, meta) {
                    /* Provide file and text for the link dialog */
                    if (meta.filetype === 'file') {
                        callback('https://www.google.com/logos/google.jpg', {text: 'My text'});
                    }

                    /* Provide image and alt text for the image dialog */
                    if (meta.filetype === 'image') {
                        callback('https://www.google.com/logos/google.jpg', {alt: 'My alt text'});
                    }

                    /* Provide alternative source and posted for the media dialog */
                    if (meta.filetype === 'media') {
                        callback('movie.mp4', {source2: 'alt.ogg', poster: 'https://www.google.com/logos/google.jpg'});
                    }
                },
                templates: [
                    {
                        title: 'New Table',
                        description: 'creates a new table',
                        content: '<div class="mceTmpl"><table width="98%%"  border="0" cellspacing="0" cellpadding="0"><tr><th scope="col"> </th><th scope="col"> </th></tr><tr><td> </td><td> </td></tr></table></div>'
                    },
                    {title: 'Starting my story', description: 'A cure for writers block', content: 'Once upon a time...'},
                    {
                        title: 'New list with dates',
                        description: 'New List with dates',
                        content: '<div class="mceTmpl"><span class="cdate">cdate</span><br /><span class="mdate">mdate</span><h2>My List</h2><ul><li></li><li></li></ul></div>'
                    }
                ],
                template_cdate_format: '[Date Created (CDATE): %m/%d/%Y : %H:%M:%S]',
                template_mdate_format: '[Date Modified (MDATE): %m/%d/%Y : %H:%M:%S]',
                height: 600,
                image_caption: true,
                quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
                noneditable_noneditable_class: 'mceNonEditable',
                toolbar_mode: 'sliding',
                contextmenu: 'link image imagetools table',
                skin: useDarkMode ? 'oxide-dark' : 'oxide',
                content_css: useDarkMode ? 'dark' : 'default',
                content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
            });

        }

        function removeElement(event, id) {
            event.preventDefault();
            $('#js-content-'+id).remove();

        }


    </script>

    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

    <script>
        var useDarkMode = window.matchMedia('(prefers-color-scheme: dark)').matches;

        tinymce.init({
            selector: '.myeditablediv',
            plugins: 'print preview paste importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap quickbars emoticons',
            imagetools_cors_hosts: ['picsum.photos'],
            menubar: 'file edit view insert format tools table help',
            toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl',
            toolbar_sticky: true,
            autosave_ask_before_unload: true,
            autosave_interval: '30s',
            autosave_prefix: '{path}{query}-{id}-',
            autosave_restore_when_empty: false,
            autosave_retention: '2m',
            image_advtab: true,
            link_list: [
                {title: 'My page 1', value: 'https://www.tiny.cloud'},
                {title: 'My page 2', value: 'http://www.moxiecode.com'}
            ],
            image_list: [
                {title: 'My page 1', value: 'https://www.tiny.cloud'},
                {title: 'My page 2', value: 'http://www.moxiecode.com'}
            ],
            image_class_list: [
                {title: 'None', value: ''},
                {title: 'Some class', value: 'class-name'}
            ],
            importcss_append: true,
            file_picker_callback: function (callback, value, meta) {
                /* Provide file and text for the link dialog */
                if (meta.filetype === 'file') {
                    callback('https://www.google.com/logos/google.jpg', {text: 'My text'});
                }

                /* Provide image and alt text for the image dialog */
                if (meta.filetype === 'image') {
                    callback('https://www.google.com/logos/google.jpg', {alt: 'My alt text'});
                }

                /* Provide alternative source and posted for the media dialog */
                if (meta.filetype === 'media') {
                    callback('movie.mp4', {source2: 'alt.ogg', poster: 'https://www.google.com/logos/google.jpg'});
                }
            },
            templates: [
                {
                    title: 'New Table',
                    description: 'creates a new table',
                    content: '<div class="mceTmpl"><table width="98%%"  border="0" cellspacing="0" cellpadding="0"><tr><th scope="col"> </th><th scope="col"> </th></tr><tr><td> </td><td> </td></tr></table></div>'
                },
                {title: 'Starting my story', description: 'A cure for writers block', content: 'Once upon a time...'},
                {
                    title: 'New list with dates',
                    description: 'New List with dates',
                    content: '<div class="mceTmpl"><span class="cdate">cdate</span><br /><span class="mdate">mdate</span><h2>My List</h2><ul><li></li><li></li></ul></div>'
                }
            ],
            template_cdate_format: '[Date Created (CDATE): %m/%d/%Y : %H:%M:%S]',
            template_mdate_format: '[Date Modified (MDATE): %m/%d/%Y : %H:%M:%S]',
            height: 600,
            image_caption: true,
            quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
            noneditable_noneditable_class: 'mceNonEditable',
            toolbar_mode: 'sliding',
            contextmenu: 'link image imagetools table',
            skin: useDarkMode ? 'oxide-dark' : 'oxide',
            content_css: useDarkMode ? 'dark' : 'default',
            content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
        });

    </script>
{{--end editing by dreamcat--}}

<script src="{{ asset('adminn/assets/js/Sortable.js') }}" type="text/javascript"></script>
<script>
    var example1 = document.getElementById('example1');

    new Sortable(example1, {
        animation: 150
        , ghostClass: 'blue-background-class',
        handle: '.handle',
    });

</script>
<script>
    function editaddon(artistid, infoid) {
        alert("hello");
        info = $('#info' + infoid).val();
        infof = $('#infof' + infoid).val();
        if (info == '') {
            $('#info' + infoid).addClass('has-error');
            $('#infof' + infoid).addClass('has-error');
            return;
        }
        $.ajax({
            url: "editinfo"
            , type: 'get'
            , dataType: "JSON"
            , data: {
                "infof":infof,
                "info": info
                , 'artistid': artistid
                , 'infoid': infoid
            , }
            , success: function() {
                location.reload();
            }
        });
    }

    function deleteaddon(artistid, infoid) {

        info = $('#del_artist_id').val();
        $.ajax({
            url: "deleteinfo"
            , type: 'get'
            , dataType: "JSON"
            , data: {
                "artist_id":info
            }
            ,success(){
                location.reload();
            }
        });
    }

</script>
<script>
    $(document).ready(function () {
        @if ($msg = Session::get('success'))
            Messenger().post({
                message: "{{$msg}}",
                type: 'success',
                showCloseButton: true
            });
        @endif
    });

</script>

@endsection
@section('styles')
<link rel="stylesheet" href="{{ asset('adminn/assets/css/sotable.css') }}">
<style>
    .has-error {
        border: 1px solid red !important;
    }

</style>
@endsection
