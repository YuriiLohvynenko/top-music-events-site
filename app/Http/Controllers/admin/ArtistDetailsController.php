<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\ArtistDetails;
use Illuminate\Http\Request;

class ArtistDetailsController extends Controller
{
    public function add()
    {
        return view('admin.pages.artistDetails.create');
    }

    public function store(Request $request)
    {

        if ($request['content_section'] != null) {
            $arr  = $request['content_section'];
            array_push($arr, $request->artist_details_content);
            ArtistDetails::create([
                'title' => $request->title,
                'content' => $arr
            ]);
        } else {
            ArtistDetails::create([
                'title' => $request->title,
                'content' => $request->artist_details_content
            ]);
        }
        return back()
            ->with('success', 'You have successfully added section.');

    }
}
