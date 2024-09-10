@extends('admin.layouts.app')
@section('content')
    <!-- BEGIN PAGE -->



    <div class="page-content">
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="grid simple">
                        <div class="grid-body no-border" style="min-height: 850px;">
                            <br>
                            <div class="row-fluid">
                                <form action="{{ route('pages.store') }}" method="POST" enctype="multipart/form-data">
                                    <h2>Create New Web Page </h2>
                                    @csrf
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label class="form-label">Page Title</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="title">
                                            </div>
                                            @error('title')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label class="main-title">Content Page</label>
                                            <div class="controls">
                                                <select id="search-type" type="text" class="form-control">
                                                    <option>Please Select Content Page</option>
                                                    <option value="url">URL</option>
                                                    <option value="page_content">Page Content</option>
                                                </select>
                                            </div>
                                            @error('title')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-12" style="display: none;" id="url">
                                            <label class="form-label">URL</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="url">
                                            </div>
                                            @error('title')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="form-group col-md-12" id="page_content" style="display: none;">
                                            <label class="form-label">Page Content</label>
                                            <textarea id="full-featured-non-premium" name="content"></textarea>
                                            @error('content')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>
                                    {{-- <div class="row">
                                        <div class="form-group col-md-12">
                                            <label for="">Attach File</label>
                                            <input type="file" name="attach_file" class="file" accept="image/png, image/jpeg">
                                            @error('attach_file')
                                            <span class="error">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    </div> --}}
                                    <div class="row" style="margin-top: 40px">
                                        <div class="col-md-12 pull-right">
                                            <button class="btn btn-danger btn-cons btn-add" type="submit">
                                                <i class="icon-envelope"></i> SAVE PAGE
                                            </button>
                                            <a class="btn btn-danger btn-cons btn-add"
                                               href="{{ route('pages.index') }}">
                                                <i class="icon-envelope"></i> CANCEL
                                            </a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- END PAGE -->
@endsection

@section('scripts')
    {{--    <script src="{{ asset('adminn/assets/plugins/jquery-1.8.3.min.js') }}" type="text/javascript"></script>--}}

    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        var useDarkMode = window.matchMedia('(prefers-color-scheme: dark)').matches;

        tinymce.init({
            selector: 'textarea#full-featured-non-premium',
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

        <script src="{{ asset('adminn/assets/plugins/data-tables/datatables.min.js') }}" type="text/javascript"></script>
        <script src="{{ asset('adminn/assets/plugins/data-tables/datatables.bootstrap.js') }}" type="text/javascript"></script>
        <script src="{{ asset('adminn/assets/js/table-datatables-responsive.js') }}"></script>

        <script src="{{ asset('adminn/assets/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js') }}"
                type="text/javascript"></script>
        <script src="{{ asset('adminn/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js') }}"
    {{--            type="text/javascript">--}}
    {{--    </script>--}}
        <script src="{{ asset('adminn/assets/js/bootstrap-filestyle.min.js') }}"></script>


    <script>
        $('.file').filestyle({
            buttonName: 'btn-danger',
            buttonText: ' Open'
        });
    </script>
    <!-- END CORE TEMPLATE JS -->
    <script>
        $(document).ready(function () {
            $('#text-editor').wysihtml5();
            $("#quick-access").css("bottom", "0px");

        });

        $(document).on('change', '#search-type', function () {
            var actionType = $('#search-type').val();

            if (actionType === 'url') {
                $('#url').show();
                $('#page_content').hide();
            } else if (actionType === 'page_content') {
                $('#page_content').show();
                $('#url').hide();

            }
        });

        // </script>
@endsection

@section('styles')

    <link href="{{ asset('adminn/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css') }}" rel="stylesheet"
          type="text/css"/>
@endsection
