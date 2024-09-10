<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\ClientReview;
use Illuminate\Http\Request;

class ClientReviews extends Controller
{
    public function clientsReviews()
    {
        $reviews = ClientReview::orderBy('review_order', 'ASC')->get();
        return view('admin.pages.reviews.create', compact('reviews'));
    }

    public function store(Request $request)
    {

        $data = [
            'title' => $request->title,
            'review' => $request->content,
            'review_order' => $request->order,

        ];

        ClientReview::create($data);
        return redirect()->back()->with('success', 'The review is successfully saved.');


    }

    public function update(Request $request)
    {

        ClientReview::where('id', $request->id)->update([
            'title' => $request->name,
            'review_order' => $request->order,
            'review' => $request->review
        ]);
        return redirect()->back()->with('success', 'Review successfully saved.');

    }
    public function delete(Request $request)
    {
        ClientReview::where('id' , $request->id)->delete();
        return redirect()->back()->with('success', 'Review successfully deleted.');

    }
}
