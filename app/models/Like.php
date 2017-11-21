<?php

namespace App\Models;

use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class Like extends Model
{
    use Userstamps, SoftDeletes;
    
    protected $table = 'likes';
    //
    protected $fillable = [
        'user_id', 'product_id'
    ];
        
    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];
}
