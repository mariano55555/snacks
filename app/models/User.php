<?php

namespace App\Models;

use App\Models\Role;
use App\Models\Invoice;
use App\Models\Product;
use Laravel\Passport\HasApiTokens;
use Wildside\Userstamps\Userstamps;
use App\Transformers\UserTransformer;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable, HasApiTokens, Userstamps, SoftDeletes;

    const USER_VERIFIED = 1;
    const USER_NOT_VERIFIED = 0;

    const USER_ADMIN = 1;
    const USER_REGULAR = 2;

    public $transformer = UserTransformer::class;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'active', 'verification_token'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token', 'verification_token'
    ];

     /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];


    public function setEmailAttribute($value)
    {
        $this->attributes["email"] = strtolower($value);
    }


    public function role()
    {
       return $this->belongsToMany(Role::class, "roles_users", "user_id", "role_id");
    }

    public function hasRole($role)
    {
       if ($this->role()->where("name", $role)->first()) {
            return true;
        }
        return false;
    }

    public function isAdmin()
    {
        return $this->hasRole('Admin');
    }

    public function userIsActivated()
    {
        if ($this->active) {
            return true;
        }
        return false;
    }



    public static function generateVerificationToken()
    {
        return str_random(40);
    }


    public function invoices()
    {
        return $this->hasMany(Invoice::class);
    }

    public function likes()
    {
       return $this->belongsToMany(Product::class, "likes","user_id", "product_id");
    }

    
}
