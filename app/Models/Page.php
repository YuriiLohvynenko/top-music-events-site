<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Page extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'slug',
        'url',
        'content',
        'status_id',
        'menu',
        'file',
    ];

    public function status()
    {
        return $this->belongsTo('App\Models\Status');
    }
}
