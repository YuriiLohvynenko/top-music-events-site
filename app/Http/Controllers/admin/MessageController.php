<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Message;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use App\Models\Artist;
use App\Models\User;
use Illuminate\Support\Facades\Session;

class MessageController extends Controller
{
    private $role;

    public function index()
    {
        $this->role = Auth::user()->role->name;
        $messages   = Message::orderBy('id', 'desc')->get();

        return view($this->role.'.message.index', ['messages' => $messages]);
    }

    public function show($id)
    {
        $this->role = Auth::user()->role->name;
        $message    = Message::find($id);
        $message->update([
            'checked' => 1,
        ]);
        $artists          = Artist::select('fullname')->pluck('fullname');
        $artistsWithEmail = DB::table('artists')
            ->select('users.email', 'artists.fullname')
            ->rightJoin('users', 'users.id', '=', 'artists.user_id')
            ->where(['artists.role_id' => 1, 'artists.status_id' => 1])->get();
        $artistsWithEmail = $artistsWithEmail->pluck('email', 'fullname');

        return view($this->role.'.message.show', compact('message', 'artists', 'artistsWithEmail'));
    }

    public function create()
    {
        $this->role = Auth::user()->role->name;
        $messages   = Message::where('to', Auth::user()->email)
            ->where('trashed', 0)
            ->where('owner', 0)
            ->get();
        return view($this->role.'.message.create', ['messages' => $messages]);
    }

    public function reply($id)
    {

        $this->role = Auth::user()->role->name;
        $msg        = Message::find($id);
        return view($this->role.'.message.reply', ['msg' => $msg]);

    }

    public function forward($id)
    {

        $this->role = Auth::user()->role->name;
        $msg        = Message::find($id);
        return view($this->role.'.message.forward', ['msg' => $msg]);

    }

    public function sent()
    {
        $this->role = Auth::user()->role->name;
        $messages   = Message::where('trashed', 0)
            ->where('from', Auth::user()->email)
            ->where('to', '!=', null)
            ->where('owner', 0)
            ->get();
        return view($this->role.'.message.sent')->with('messages', $messages);

    }

    public function draft()
    {
        $this->role = Auth::user()->role->name;
        $messages   = Message::where('from', Auth::user()->email)
            ->where('draft', 1)
            ->where('to', null)
            ->where('owner', 0)
            ->get();
        return view($this->role.'.message.draft')->with('messages', $messages);

    }

    public function trash()
    {
        $this->role = Auth::user()->role->name;
        $messages   = Message::where('trashed', 1)
            ->where('owner', 0)
            ->Where(function ($query) {
                $query->Where('to', Auth::user()->email)
                    ->orWhere('from', Auth::user()->email);
            })->get();
        return view($this->role.'.message.trash')->with('messages', $messages);
    }

    public function sendtrash(Request $request)
    {
        $ids = $request->ids;
        foreach ($ids as $id) {
            Message::find($id)->update([
                'trashed' => 1
            ]);
        }
        return back()->with('message', 'The messages are successfully trashed.');
    }

    public function recovertrash(Request $request)
    {
        $ids = $request->ids;
        foreach ($ids as $id) {
            Message::find($id)->update([
                'trashed' => 0,
            ]);
        }
        return back()->with('message', 'The messages are successfully recovered.');
    }

    public function remove(Request $request)
    {
        $ids = $request->ids;
        foreach ($ids as $id) {
            Message::find($id)->delete();
        }
        return back()->with('message', 'The messages are successfully removed.');
    }

    public function checked($id)
    {
        $message = Message::find($id);
        $message->update([
            'checked' => 1 - $message->checked,
        ]);
        return 1;
    }

    public function sendCompose(Request $request)
    {
        $fileName = '';
        if ($request->file) {
            $fileName = time().'.'.$request->file->extension();
            $request->file->move(public_path('uploads'), $fileName);
        }

        if (isset($request->to)) {
            foreach ($request->to as $item) {

                $data[] = [
                    'from'    => Auth::user()->first()->email,
                    'to'      => $item,
                    'subject' => $request->subject,
                    'content' => $request->content,
                    'draft'   => 0,
                    'file'    => $fileName,
                    'owner'   => 1,
                ];
            }

            Message::insert($data);

            foreach ($data as $message) {

                $emailData = [
                    'subject' => (isset($message['subject'])) ? $message['subject'] : '',
                    'content' => (isset($message['content'])) ? $message['content'] : '',
                ];

                $senttoemail = isset($message['to']) ? $message['to'] : '';
                $subject     = isset($message['subject']) ? $message['subject'] : '';
                $from_email  = isset($message['from']) ? $message['from'] : '';

                if (!empty($subject) && !empty($senttoemail) && !empty($from_email) && (strpos($senttoemail, '@'))) {
                    if ($request->file) {

                        $pathToFile = public_path('uploads/'.$message['file']);

                        Mail::send('mail3', $emailData,
                            function ($msg) use ($senttoemail, $subject, $pathToFile, $from_email) {
                                $msg->to($senttoemail);
                                $msg->subject($subject);
                                $msg->from($from_email);
                                $msg->attach($pathToFile);
                            });

                        Mail::send('newMsg', $emailData, function ($msg) use ($senttoemail, $from_email) {
                                $msg->to($senttoemail);
                                $msg->from($from_email);
                            });

                    } else {

                        Mail::send('mail3', $emailData, function ($msg) use ($senttoemail, $subject, $from_email) {
                            $msg->to($senttoemail);
                            $msg->subject($subject);
                            $msg->from($from_email);
                        });

                        Mail::send('newMsg', $emailData, function ($msg) use ($senttoemail, $from_email) {
                            $msg->to($senttoemail);
                            $msg->from($from_email);
                        });
                    }
                    Session::flash('success', 'The emails were successfully sent.');
                    return back()->with('message', 'The message was successfully sent.');

                }
                Session::flash('error', 'An error has occurred');
                return back()->with('message', 'The message was successfully sent.');

            }

        } else {
            Session::flash('error', 'An error has occurred');
            return back()->with('message', 'The message was successfully sent.');
        }


    }

    public function sendForward(Request $request)
    {
        $fileName = '';
        if ($request->file) {
            $fileName = time().'.'.$request->file->extension();
            $request->file->move(public_path('uploads'), $fileName);
        }

        if (isset($request->to)) {
            $message = [
                'from'    => Auth::user()->first()->email,
                'to'      => $request->to,
                'subject' => $request->subject,
                'content' => $request->content,
                'draft'   => 0,
                'file'    => $fileName,
                'owner'   => 1,
            ];


            Message::insert($message);

            $emailData = [
                'subject' => (isset($message['subject'])) ? $message['subject'] : '',
                'content' => (isset($message['content'])) ? $message['content'] : '',
            ];

            $senttoemail = isset($message['to']) ? $message['to'] : '';
            $subject     = isset($message['subject']) ? $message['subject'] : '';
            $from_email  = isset($message['from']) ? $message['from'] : '';

            if (!empty($subject) && !empty($senttoemail) && !empty($from_email) && (strpos($senttoemail, '@'))) {
                if ($request->file) {

                    $pathToFile = public_path('uploads/'.$message['file']);

                    Mail::send('mail3', $emailData,
                        function ($msg) use ($senttoemail, $subject, $pathToFile, $from_email) {
                            $msg->to($senttoemail);
                            $msg->subject($subject);
                            $msg->from($from_email);
                            $msg->attach($pathToFile);
                        });
                } else {

                    Mail::send('mail3', $emailData, function ($msg) use ($senttoemail, $subject, $from_email) {
                        $msg->to($senttoemail);
                        $msg->subject($subject);
                        $msg->from($from_email);
                    });
                }
                Session::flash('success', 'The emails were successfully sent.');
                return back()->with('message', 'The message was successfully sent.');

            }
            Session::flash('error', 'An error has occurred');
            return back()->with('message', 'The message was successfully sent.');


        } else {
            Session::flash('error', 'An error has occurred');
            return back()->with('message', 'The message was successfully sent.');
        }


    }

    public function send(Request $request)
    {

        if (!$request->act && $request->check_artist) {
            $request->validate([
                'check_artist' => 'required',
                'content'      => 'required',
            ]);
        }

        $fileName = '';
        if ($request->file) {
            $fileName = time().'.'.$request->file->extension();
            $path     = $request->file->move(public_path('uploads'), $fileName);
        }

        if ($request->check_artist) {
            $to = $request->check_artist;
        } elseif ($request->artist_individual_email) {

            $userIds = User::select('id')->whereIn('email', $request->artist_individual_email)->get();
            $ids     = $userIds->pluck('id')->toArray();
            $to      = Artist::select('user_id')->whereIn('user_id', $ids)->pluck('user_id');

        } else {
            $to = Artist::where([
                'location_id' => $request->location,
                'act_id'      => $request->act,
                'event_id'    => $request->event,
            ])->select('user_id')->distinct()->pluck('user_id');

        }

        if (isset($to) && (count($to) > 0)) {

            foreach ($to as $item) {

                $data[] = [
                    'from'       => Auth::user()->first()->email,
                    'to'         => (count(User::select('email')->where('id',
                        $item)->get())) ? (User::select('email')->where('id', $item)->first()->email) : '',
                    'subject'    => $request->subject,
                    'content'    => $request->content,
                    'draft'      => 0,
                    'file'       => $fileName,
                    'owner'      => 1,
                    'event_date' => (isset($request->date)) ? $request->date : '',
                    'quoteID'    => 'TMEQ'.rand(10, 1000)
                ];
            }

            Message::insert($data);


            foreach ($data as $message) {

                $emailData = [
                    'subject' => (isset($message['subject'])) ? $message['subject'] : '',
                    'content' => (isset($message['content'])) ? $message['content'] : '',
                ];

                $senttoemail = isset($message['to']) ? $message['to'] : '';
                $subject     = isset($message['subject']) ? $message['subject'] : '';
                $from_email  = isset($message['from']) ? $message['from'] : '';

                if (!empty($subject) && !empty($senttoemail) && !empty($from_email) && (strpos($senttoemail, '@'))) {
                    if ($request->file) {
                        $pathToFile = public_path('uploads/'.$message->file);
                        Mail::send('mail3', $emailData,
                            function ($msg) use ($senttoemail, $subject, $pathToFile, $from_email) {
                                $msg->to($senttoemail);
                                $msg->subject($subject);
                                $msg->from($from_email);
                                $msg->attach($pathToFile);
                            });

                        Mail::send('newQuote', $emailData, function ($msg) use ($senttoemail, $from_email) {
                            $msg->to($senttoemail);
                            $msg->from($from_email);
                        });
                    } else {
                        Mail::send('mail3', $emailData, function ($msg) use ($senttoemail, $subject, $from_email) {
                            $msg->to($senttoemail);
                            $msg->subject($subject);
                            $msg->from($from_email);
                        });
                        Mail::send('newQuote', $emailData, function ($msg) use ($senttoemail,$from_email) {
                            $msg->to($senttoemail);
                            $msg->from($from_email);
                        });

                    }
                    Session::flash('success', 'The emails were successfully sent.');
                    return back()->with('message', 'The message was successfully sent.');

                }
                Session::flash('error', 'An error has occurred');
                return back()->with('message', 'The message was successfully sent.');

            }

        } else {
            Session::flash('error', 'An error has occurred');
            return back()->with('message', 'The message was successfully sent.');
        }
    }

    public
    function save(
        Request $request
    ) {
        $request->validate([
            'content' => 'required'
        ]);
        Message::create([
            'from'    => Auth::user()->email,
            'subject' => $request->subject,
            'content' => $request->content,
            'draft'   => 1,
            'to'      => $request->to,
        ]);
        return redirect()->action('admin\MessageController@draft')->with('message',
            'The draft was successfully saved');
    }

    public function singletrash($id)
    {
        Message::find($id)->update([
            'trashed' => 1,
        ]);
        return redirect()->action('admin\MessageController@trash');

    }

    public function singledelete($id)
    {
        Message::find($id)->delete();
        return redirect()->action('admin\MessageController@trash');

    }

    public
    function movetotrash(
        Request $request
    ) {
        foreach ($request->ids as $id) {
            Message::find($id)->update([
                'trashed' => 1,
            ]);
        }
        return 1;
    }

    public
    function recover(
        Request $request
    ) {
        foreach ($request->ids as $id) {
            Message::find($id)->update([
                'trashed' => 0,
            ]);
        }
        return 1;
    }

    public
    function singlerecover(
        $id
    ) {
        Message::find($id)->update([
            'trashed' => 0,
        ]);
        return redirect()->action('admin\MessageController@trash');

    }

    public
    function delete(
        Request $request
    ) {
        foreach ($request->ids as $id) {
            Message::find($id)->delete();
        }
        return 1;
    }
}
