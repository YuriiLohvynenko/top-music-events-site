<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\FindArtist;
use Illuminate\Http\Request;

class FindArtistController extends Controller
{
    public function add()
    {
        return view('admin.pages.findArtist.create');
    }

    public function store(Request $request)
    {

       if ($request['content_section'] != null) {
           $arr  = $request['content_section'];
           array_push($arr, $request->find_artist_content);
           FindArtist::create([
               'title' => $request->title,
               'content' => $arr
           ]);
       } else {
           FindArtist::create([
               'title' => $request->title,
               'content' => $request->find_artist_content
           ]);
       }
        return back()
            ->with('success', 'You have successfully added section.');

    }
}
