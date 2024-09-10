<?php

namespace App\Http\Controllers;

use App\Models\Artist;
use Illuminate\Http\Request;
//use Illuminate\Support\Facades\DB;
class AjaxController extends Controller
{
    //
    public function ajaxRequest()
    {
        return view('ajaxRequest');
    }

    public function ajaxRequestPost(Request $request)
    {

        $input = $request->all();
        $inpu = $input['key'];
//        $results = DB::table('artists')
//        ->get();
        $results = Artist::select('id', 'fullname')->where('fullname', 'like', '' .$inpu. '%')->pluck('id', 'fullname')->toArray();
       // $results = DB::select("select id, fullname from artists where fullname LIKE '".$inpu."%'");
      //  dd($results);
        return response()->json(['success'=>$results]);
    }

}
