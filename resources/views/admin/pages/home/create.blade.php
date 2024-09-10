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
                                <form action="{{ route('store_home') }}" method="POST" enctype="multipart/form-data">
                                    <h2 style="margin-bottom: 60px">Home Page </h2>
                                    @csrf
                                    <label class="main-title">Upload Main Background</label>
                                    <div class="row">
                                        <div class="col-md-4 col-sm-6">
                                            <div class="form-group">
                                                <input type="file" id="main_img" name="main_img"
                                                       accept="image/png, image/jpeg" class="file" required>
                                                <label class="form-label">best(1920 x 700px), .jpg, .png only</label>

                                            </div>

                                            @error('pageimage')
                                            <span class="error">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                            @enderror
                                        </div>
{{--                                        <div class="col-md-8 col-sm-6">--}}
{{--                                            <button type="submit" class="btn btn-danger">Upload Image</button>--}}
{{--                                        </div>--}}
                                    </div>
                                    <div class="row" style="margin-top: 40px">
                                        <div class="form-group col-md-8">
                                            <label class="main-title">Main Title</label>
                                            <div class="controls">
                                                <textarea  class="form-control" name="title" rows="6" required></textarea>
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
                                            <label class="main-title">Main Subtitle</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="main_subtitle" required>
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
                                            <label class="main-title">Tag Line</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="tag_line" required>
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
                                            <label class="main-title">Top Content Title</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="top_content_title" required>
                                            </div>
                                            @error('title')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-12" >
                                            <label class="form-label">Top Content</label>
                                            <textarea class="myeditablediv" id="section001" name="top_content"></textarea>
                                            @error('content')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <label class="main-title">Upload Content Image</label>
                                    <div class="row">
                                        <div class="col-md-4 col-sm-6">
                                            <div class="form-group">
                                                <input type="file" id="content_img" name="content_img"
                                                       accept="image/png, image/jpeg" class="file">
                                                <label class="form-label">best(1920 x 700px), .jpg, .png only</label>

                                            </div>

                                            @error('pageimage')
                                            <span class="error">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                            @enderror
                                        </div>
{{--                                        <div class="col-md-8 col-sm-6">--}}
{{--                                            <button type="submit" class="btn btn-danger">Upload Image</button>--}}
{{--                                        </div>--}}
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label class="main-title">Content Title</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="content_title" required>
                                            </div>
                                            @error('title')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-12" >
                                            <label class="form-label"> Content Text</label>
                                            <textarea class="myeditablediv" id="section002" name="content_text"></textarea>
                                            @error('content')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label class="main-title">Event Categories</label>
                                            <div class="controls">
                                                <select type="text" class="form-control" name="category" required>
                                                    <option value="">Select Categories</option>
                                                    @foreach($categories as $category)
                                                        <option value="{{$category  }}">{{$category  }}</option>
                                                        @endforeach
                                                </select>
                                            </div>
                                            @error('title')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="main-title">Upload image for selected category</label>
                                                <input type="file" id="category_img" name="categort_img"
                                                       accept="image/png, image/jpeg" class="file" required>
                                                <label class="form-label">best(1920 x 700px), .jpg, .png only</label>

                                            </div>

                                            @error('pageimage')
                                            <span class="error">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div id="section-container"></div>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 pull-right">
                                            <button onclick="addNewSection(event)" class="btn btn-danger btn-cons btn-add" type="submit" style="
    padding-left: 50px;
    padding-right: 63px;
">
                                                <i class="icon-envelope"></i> ADD NEW CATEGORY
                                            </button>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label class="main-title">Extra Content Title</label>
                                            <div class="controls">
                                                <input type="text" class="form-control" name="extra_content_title">
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
                                            <label class="main-title">Extra Content </label>
                                            <textarea class="myeditablediv" id="section003"  placeholder="Enter text ..."
                                                      rows="25" name="extra_content"></textarea>
                                            @error('content')
                                            <span class="error">
											<strong>{{ $message }}</strong>
										</span>
                                            @enderror
                                        </div>
                                    </div>


                                    <div class="row">
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
    <script src="{{ asset('adminn/assets/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js') }}" type="text/javascript">
    </script>
    <script src="{{ asset('adminn/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js') }}"
            type="text/javascript">
    </script>
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

        var countOfFileElements = 0;
        function addNewSection(event) {
            var categories = {!! json_encode($categories) !!};

            ++countOfFileElements;
            event.preventDefault();
            var element = '<div class="form-group col-md-6"><select type="text" class="form-control" name="extra_category[]" required><option value="">Select Categories</option>';

            for (var key in categories) {
                element +='<option value="'+categories[key]+'">'+categories[key]+'</option>';
            }
                element += '</select></div><div class="form-group col-md-6"><input type="file" id="pageimage'+countOfFileElements+'" name="extra_category_img[]" accept="image/png, image/jpeg" class="file" required><a href="#" style="margin: 5px" onclick="removeElement(event, ' + countOfFileElements + ')" class="btn btn-danger">Remove Section</a></div>';

            // var removeButton = '<a href="#" style="margin: 5px" onclick="removeElement(event, ' + countOfFileElements + ')" class="btn btn-danger">Remove Section</a>';
            var filesContainerId = $('#section-container');

            filesContainerId.append('<div class="form-group col-md-12" id="js-content-'+countOfFileElements+'" class="col-sm-12" style="margin: 5px;">' + element  +  '</div>');
            $('.file').filestyle({
                buttonName: 'btn-danger',
                buttonText: ' Open'
            });
        }

        function removeElement(event, id) {
            event.preventDefault();
            $('#js-content-'+id).remove();

        }
    </script>
    @if ($msg = Session::get('success'))
        <script>
            $(document).ready(function () {
                Messenger().post({
                    message: "{{$msg}}",
                    type: 'success',
                    showCloseButton: true
                });
            });
        </script>
    @endif
@endsection

@section('styles')

    <link href="{{ asset('adminn/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css') }}" rel="stylesheet"
          type="text/css"/>
@endsection
