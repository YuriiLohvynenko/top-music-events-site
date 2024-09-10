<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Footer;
use App\Models\Quote;
use Illuminate\Http\Request;

class FooterController extends Controller
{
    public function add()
    {
        return view('admin.pages.footer.create');
    }

    public function store(Request $request)
    {
       $data = [
         'copyrights' => $request->copyrights,
         'facebook' => $request->facebook,
         'twitter' => $request->twitter,
         'youtube' => $request->youtube,
         'instagram' => $request->instagram,
         'google' => $request->google,
         'linkedin' => $request->linkedin,
         'pinterest' => $request->pinterest,
       ];

       Footer::create($data);

        return redirect()->back()->with('success', 'Footer successfully created.');
    }


}
