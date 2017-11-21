<?php

namespace App\Models;

use App\Models\User;
use App\Models\Invoice;
use App\Models\Inventory;
use App\Models\ProductsPrice;
use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\Model;
use App\Transformers\ProductTransformer;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use Userstamps, SoftDeletes;

    protected $table = 'products';
    //
    protected $fillable = [
        'name', 'description', 'active', 'img'
    ];

    public $transformer = ProductTransformer::class;
    
    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];

    public function likes()
    {
       return $this->belongsToMany(User::class, "likes", "product_id", "user_id");
    }

    public function transactions()
    {
       return $this->belongsToMany(Invoice::class, "invoices_products", "product_id", "invoice_id");
    }

    public function price()
    {
        return $this->hasMany(ProductsPrice::class);
    }

    public function currentPrice()
    {
        return $this->hasMany(ProductsPrice::class)->where('active', true);
    }

    public function inventory()
    {
        return $this->hasMany(Inventory::class);
    }

    public function currentInventory()
    {
        return $this->hasMany(Inventory::class)->where('active', true);
    }


}
