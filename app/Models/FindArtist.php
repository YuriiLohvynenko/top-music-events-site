<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FindArtist extends Model
{
    use HasFactory;

    protected $table = 'find_artist_page';
    protected $guarded = [];
    protected $casts = [
        'content' => 'array',
    ];

}
