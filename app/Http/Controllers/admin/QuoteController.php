<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Quote;
use Illuminate\Http\Request;

class QuoteController extends Controller
{
    public function add()
    {
        $quotes = Quote::all();
        return view('admin.pages.quote.add', compact('quotes'));
    }

    public function uploadImage(Request $request, $quoteId)
    {
        $request->validate([
            'repimage' => 'required|mimes:jpeg,jpg,png,gif|max:500000',
        ]);
        $fileName = time().'.'.$request->repimage->extension();
        if (Quote::where('id', $quoteId)->exists()) {
            unlink(public_path('uploads/'.Quote::where('id', $quoteId)->value('url')));
            Quote::where('id', $quoteId)->update([
                'url'       => $fileName,
            ]);
        } else {
            Quote::create([
                'url'       => $fileName,
            ]);
        }

        $request->repimage->move(public_path('uploads'), $fileName);
        return back()
            ->with('success', 'You have successfully upload file.')
            ->with('file', $fileName);
    }

    public function store(Request $request)
    {
        $request->validate([
            'galleryimage' => 'required|mimes:jpeg,jpg,png,gif|max:500000',
        ]);
        $fileName = time().'.'.$request->galleryimage->extension();

            Quote::create([
                'url'       => $fileName,
                'title'       => $request->title,
            ]);


        $request->galleryimage->move(public_path('uploads'), $fileName);
        return back()
            ->with('success', 'You have successfully upload file.')
            ->with('file', $fileName);

    }
}
