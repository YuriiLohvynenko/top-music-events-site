<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\CategoryHomePage;
use App\Models\HomePage;
use Illuminate\Http\Request;
use App\Models\Page;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Models\Menu;

class PageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pages = Page::all();
        return view('admin.pages.index')->with('pages', $pages);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.pages.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->validate([
            'title' => 'required|string|max:255',
            // 'attach_file' => 'required|max:100000|mimes:jpeg,jpg,png,gif'
        ]);
        // $fileName = time() . '.' . $request->attach_file->extension();
        // $path = $request->attach_file->move(public_path('uploads'), $fileName);
        Page::create([
            'title'   => $request->title,
            'content' => $request->content,
            'url'     => $request->url,
            'slug'    => str_slug($request->title, '-'),
            // 'file' => $fileName,
        ]);

        return redirect()->route('pages.index')->with('success', 'The page is successfully created.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $page = Page::find($id);
        return view('admin.pages.edit')->with('page', $page);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'title'   => 'required|string|max:255',
            'content' => 'required',
            // 'attach_file' => 'required|max:100000|mimes:jpeg,jpg,png,gif'
        ]);
        // unlink(public_path('uploads/' . Page::find($id)->value('url')));
        // $fileName = time() . '.' . $request->attach_file->extension();
        // $path = $request->attach_file->move(public_path('uploads'), $fileName);
        Page::find($id)->update([
            'title'   => $request->title,
            'content' => $request->content,
            'slug'    => str_slug($request->title, '-'),
            // 'file' => $fileName,
        ]);
        return redirect()->route('pages.index')->with('success', 'The page is successfully updated.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Page::find($id)->delete();
        return redirect()->route('pages.index')->with('success', 'The page is successfully removed.');
    }

    public function changeStatus($id)
    {
        Page::find($id)->update([
            'status_id' => 3 - Page::find($id)->status_id,
        ]);
        return redirect()->route('pages.index')->with('success', 'The Status is successfully changed.');
    }

    public function createHome()
    {
        $categories = DB::table('parent_acts')->select('name')->pluck('name')->toArray();
        $subCategories = DB::table('acts')->select('name')->get();
        foreach ($subCategories as $subCategory) {
            array_push($categories, $subCategory->name);
        }
        return view('admin.pages.home.create', compact('categories'));
    }

    public function storeHomePage(Request $request)
    {
       // dd($request);
        $main_img = time().'.'.$request->main_img->extension();
        $request->main_img->move(public_path('uploads'), $main_img);

        $content_img = time().'.'.$request->content_img->extension();
        $request->content_img->move(public_path('uploads'), $content_img);

        $data = [
            'main_image' => $main_img,
            'main_title' => $request->title,
            'main_subtitle' => $request->main_subtitle,
            'tag_line' => $request->tag_line,
            'top_content_title' => $request->top_content_title,
            'top_content' => $request->top_content,
            'image_content' => $content_img,
            'content_title' => $request->content_title,
            'extra_content_title' => $request->extra_content_title,
            'extra_content' => $request->extra_content,
        ];


        $homePage = HomePage::create($data);

        $categort_img = time().'.'.$request->categort_img->extension();
        $request->categort_img->move(public_path('uploads'), $categort_img);
        $dataOfCategory = [
            'name' => $request->category,
            'category_home_page_id' => $homePage->id,
            'url' => $categort_img
        ];
        CategoryHomePage::create($dataOfCategory);
        $ids=[];
        if (isset($request->extra_category_img))
        {
            foreach ($request->extra_category_img as $item)
            {
                $extra_category_img = time().'.'.$item->extension();
                $item->move(public_path('uploads'), $extra_category_img);

                $dataOfExtraCategory = [
                    'category_home_page_id' => $homePage->id,
                    'url' => $categort_img
                ];
              $ids[] =  CategoryHomePage::create($dataOfExtraCategory);

            }

            for ($i=0 ; $i<count($ids) ; $i++)
            {

                $name  =  $request->extra_category[$i];
                $id = $ids[$i]->id;

                CategoryHomePage::where('id', $id)->update([
                    'name' => $name
                ]);

            }

        }
        return redirect()->back()->with('success', 'You have successfully added home page');

    }



}
