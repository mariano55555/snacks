<?php

namespace App\Models;

use App\Models\User;
use App\Models\Product;
use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\Model;
use App\Transformers\InvoiceTransformer;
use Illuminate\Database\Eloquent\SoftDeletes;

class Invoice extends Model
{
    use Userstamps, SoftDeletes;

    protected $table = 'invoices';
    //
    protected $fillable = [
        'user_id'
    ];

    public $transformer = InvoiceTransformer::class;
    
    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];


    public function transactions()
    {
       return $this->belongsToMany(Product::class, "invoices_products", "invoice_id", "product_id")->withPivot('quantity', 'unit_price', 'total_price');    
    }

    public function user()
    {
       return $this->belongsTo(User::class);
    }

}
