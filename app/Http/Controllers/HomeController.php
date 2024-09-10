<?php

namespace App\Http\Controllers;

use App\Models\Artist;
use App\Models\ArtistInfo;
use Illuminate\Http\Request;
use App\Models\Event;
use App\Models\Act;
use App\Models\Country;
use App\Models\Location;
use Illuminate\Support\Facades\DB;
use App\Models\User;

use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use App\Models\Message;
use App\Models\ParentAct;


class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    // public function __construct()
    // {
    //     $this->middleware('auth');
    // }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function homepage()
    {
        $events    = Event::all();
        $artists   = Artist::select('fullname')->pluck('fullname');
        $locations = Location::all();
        $acts      = Act::all();
        $countries = Country::all();
        $top_acts  = User::where('role_id', 3)->where('status_id', 1)->get();
        return view('homepage', [
            'events'    => $events,
            'locations' => $locations,
            'acts'      => $acts,
            'countries' => $countries,
            'top_acts'  => $top_acts,
            'artists'   => $artists,

        ]);
    }

    public function sendContact(Request $request)
    {
        $data[] = [
            'from'    => $request->email,
            'subject' => $request->subject,
            'draft'   => 0,
            'owner'   => 1,
            'tel'     => $request->phone
        ];

        Message::insert($data);

        return redirect()->back()->with('message', 'The message was successfully sent.');

    }

    public function sendBooking(Request $request)
    {
        dd($request);
    }

    public function exploreMore()
    {
        $event    = 1;
        $location = 1;
        $acttype  = 1;
        $g_event  = Event::all();

        $g_location = Location::all();
        $g_country  = Country::all();
        $g_act      = Act::all();
        $g_cate     = ParentAct::all();
        $info       = DB::table('artists')
            ->select('artists.id', 'artists.fullname', 'artist_infos.features', 'artist_images.url')
            ->join('artist_infos', 'artists.id', '=', 'artist_infos.artist_id')
            ->join('artist_images', 'artists.id', '=', 'artist_images.artist_id')
            ->where('artist_images.type', '=', 'pageimage')
            ->get();

        return view('findartist', [
            'info'       => $info,
            'g_event'    => $g_event,
            'g_location' => $g_location,
            'g_country'  => $g_country,
            'g_act'      => $g_act,
            'g_cate'     => $g_cate,
            'v_event'    => $event,
//            'v_date'     => $date,
            'v_location' => $location,
            'v_acttype'  => $acttype,
        ]);

    }

    public function filtering(Request $request)
    {
        $event      = $request->event;
        $date       = $request->date;
        $location   = $request->location;
        $acttype    = $request->acttype;
        $info       = DB::select("SELECT tt.id, tt.fullname, tt.url, artist_infos.features FROM (SELECT t1.id, t1.fullname, artist_images.url FROM (SELECT * FROM artists WHERE event_id = ".$event." AND location_id = ".$location." AND act_id = ".$acttype.") t1 LEFT JOIN artist_images ON t1.id = artist_images.artist_id AND artist_images.type = 'pageimage') tt LEFT JOIN artist_infos ON tt.id = artist_infos.artist_id");
        $g_event    = Event::all();
        $g_location = Location::all();
        $g_country  = Country::all();
        $g_act      = Act::all();
        $g_cate     = ParentAct::all();

        if (isset($info) && $info != null) {

            return view('findartist', [
                'result_status' => '1',
                'info'          => $info,
                'g_event'       => $g_event,
                'g_location'    => $g_location,
                'g_country'     => $g_country,
                'g_act'         => $g_act,
                'g_cate'        => $g_cate,
                'v_event'       => $event,
                'v_date'        => $date,
                'v_location'    => $location,
                'v_acttype'     => $acttype,
            ]);
        } else {
            $info = DB::table('artists')
                ->select('artists.id', 'artists.fullname', 'artist_infos.features', 'artist_images.url')
                ->join('artist_infos', 'artists.id', '=', 'artist_infos.artist_id')
                ->join('artist_images', 'artists.id', '=', 'artist_images.artist_id')
                ->where('artist_images.type', '=', 'pageimage')
                ->get();

            return view('findartist', [
                'result_status' => '0',
                'info'          => $info,
                'g_event'       => $g_event,
                'g_location'    => $g_location,
                'g_country'     => $g_country,
                'g_act'         => $g_act,
                'g_cate'        => $g_cate,
                'v_event'       => $event,
                'v_date'        => $date,
                'v_location'    => $location,
                'v_acttype'     => $acttype,
            ]);

        }
    }

    public function quote()
    {
        $events    = Event::all();
        $locations = Location::all();
        $acts      = Act::all();
        $countries = Country::all();
        return view('quote', [
            'events'    => $events,
            'locations' => $locations,
            'acts'      => $acts,
            'countries' => $countries,
        ]);
    }

    public function about()
    {
        return view('about');
    }

    public function getArtistDetails($id)
    {
        if (isset($id) && !empty($id)) {
            $artist_info          = DB::select("select * from artists where id = '".$id."'");
            $artist_price         = DB::select("select * from price_locations where location_id = '".$artist_info[0]->location_id."' AND artist_id = '".$id."'");
            $artist_video         = DB::select("select * from artist_videos where artist_id = '".$id."' LIMIT 1");
            $artist_profile_image = DB::select("select * from artist_images where artist_id = '".$id."' AND type = 'pageimage'");
            $artist_reper_image   = DB::select("select * from artist_images where artist_id = '".$id."' AND type = 'repimage'");
            $artist_review_image  = DB::select("select * from artist_images where artist_id = '".$id."' AND type = 'reviewimage'");
            $artist_gallery_image = DB::select("select * from artist_images where artist_id = '".$id."' AND type = 'galleryimage'");
            $artist_music         = DB::select("select * from artist_music where artist_id = '".$id."'");
            $artist_infos         = DB::select("select * from artist_infos where artist_id = '".$id."'");
            return view('artist-detail', [
                'artist_info'          => $artist_info,
                'artist_price'         => $artist_price,
                'artist_video'         => $artist_video,
                'artist_top_image'     => $artist_profile_image,
                'artist_rep_image'     => $artist_reper_image,
                'artist_review_image'  => $artist_review_image,
                'artist_gallery_image' => $artist_gallery_image,
                'artist_music'         => $artist_music,
                'artist_infos'         => $artist_infos,
                'get_data'             => $id
            ]);
        }

    }

    public function searching(Request $request)
    {
        if (count(Artist::select('id')->where('fullname', $request->artist_name)->get())) {
            $get_data = Artist::select('id')->where('fullname', $request->artist_name)->first()->id;
            if (isset($get_data) && !empty($get_data)) {
                $artist_info          = DB::select("select * from artists where id = '".$get_data."'");
                $artist_price         = DB::select("select * from price_locations where location_id = '".$artist_info[0]->location_id."' AND artist_id = '".$get_data."'");
                $artist_video         = DB::select("select * from artist_videos where artist_id = '".$get_data."' LIMIT 1");
                $artist_profile_image = DB::select("select * from artist_images where artist_id = '".$get_data."' AND type = 'pageimage'");
                $artist_reper_image   = DB::select("select * from artist_images where artist_id = '".$get_data."' AND type = 'repimage'");
                $artist_review_image  = DB::select("select * from artist_images where artist_id = '".$get_data."' AND type = 'reviewimage'");
                $artist_gallery_image = DB::select("select * from artist_images where artist_id = '".$get_data."' AND type = 'galleryimage'");
                $artist_music         = DB::select("select * from artist_music where artist_id = '".$get_data."'");
                $artist_infos         = DB::select("select * from artist_infos where artist_id = '".$get_data."'");

                return view('artist-detail', [
                    'artist_info'          => $artist_info,
                    'artist_price'         => $artist_price,
                    'artist_video'         => $artist_video,
                    'artist_top_image'     => $artist_profile_image,
                    'artist_rep_image'     => $artist_reper_image,
                    'artist_review_image'  => $artist_review_image,
                    'artist_gallery_image' => $artist_gallery_image,
                    'artist_music'         => $artist_music,
                    'artist_infos'         => $artist_infos,
                    'get_data'             => $get_data
                ]);
            }

        } else {
            Session::flash('error', 'There are no results for your phrase.');
            return back()->with('message', 'There are no results for your phrase.');
        }
    }

    public function sendquote(Request $request)
    {

        $request->validate([
            'event'     => ['required', 'string', 'max:255'],
            'act'       => ['required', 'string', 'max:255'],
            'location'  => ['required', 'string', 'max:255'],
            'eventdate' => ['required', 'string', 'max:255'],
            'content'   => ['required', 'string', 'max: 2000'],
            'name'      => ['required', 'string', 'max:255'],
            'tel'       => ['required', 'string', 'max:255'],
            'email'     => ['required', 'string', 'email', 'max:255'],
        ]);

        $content = '<span class="label label-info">'.$request->event.'</span>
        <span class="label label-info">'.$request->act.'</span>
        <span class="label label-info">'.$request->location.'</span>
        <span class="label label-info">'.$request->eventdate.'</span>
        <span class="label label-success">'.$request->name.'</span>
        <span class="label label-success">'.$request->tel.'</span>
        <br><br>
        <span>'.$request->content.'</span>';

        Message::create([
            'content'    => $content,
            'subject'    => 'topmusicevents.co.uk',
            'from'       => $request->email,
            'to'         => User::find(1)->email,
            'owner'      => 0,
            'event_date' => (isset($request->eventdate)) ? $request->eventdate : '',
            'name'       => $request->name,
            'tel'        => $request->tel,
            'quoteID' => 'TMEQ'. rand(10, 1000)
        ]);

        $message     = Message::latest()->first();
        $data        = [
            'subject' => $message->subject,
            'content' => $content,
        ];
        $senttoemail = $message->to;
        $subject     = $message->subject;
        $from_email  = $message->from;

        Mail::send('mail3', $data, function ($msg) use ($senttoemail, $subject, $from_email) {
            $msg->to($senttoemail);
            $msg->subject($subject);
            $msg->from($from_email);
        });

        return view('quote_sent');
    }

}
