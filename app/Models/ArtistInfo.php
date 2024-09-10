<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ArtistInfo extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'artist_id',
        'features',
        'about',
    ];

    public function artist()
    {
        return $this->belongsTo('App\Models\Artist');
    }

}
