<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ArtistDetails extends Model
{
    use HasFactory;

    protected $table = 'artist_details_page';
    protected $guarded = [];
    protected $casts = [
        'content' => 'array',
    ];
}
