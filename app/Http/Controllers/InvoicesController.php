<?php

namespace App\Http\Controllers;

use Auth;
use App\Models\User;
use App\Models\Invoice;
use App\Models\Product;
use App\Models\Inventory;
use Illuminate\Http\Request;
use App\Models\InvoicesProduct;
use App\Http\Controllers\ApiController;
use App\Transformers\InvoiceTransformer;
use Illuminate\Auth\AuthenticationException;

class InvoicesController extends ApiController
{

    public function  __construct()
    {
        parent::__construct();
        $this->middleware("transform.input:". InvoiceTransformer::class)->only(["store"]);
        $this->middleware("scope:purchase-product")->only("store");
        $this->middleware("can:view,invoice")->only("show");
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->allowedAdminAction();
        $invoices = Invoice::all();
        return $this->showAll($invoices);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $rules = [
            'product'  => 'required|numeric',
            'quantity' => 'required|numeric',
        ];
        
        $this->validate($request, $rules);

        $product = Product::with(["currentInventory", "currentPrice"])->where("id", $request->product)->first();

        if(!$request->user()){
             throw new AuthenticationException("Invalid type of token.");
        }

        $get_current_stock = Inventory::where("product_id", $request->product)->orderBy("id", "desc")->first();

        $invoice = Invoice::create([
            "user_id" => $request->user()->id
        ]);       

        
        $detail = InvoicesProduct::create([
            'invoice_id'  => $invoice->id,
            'product_id'  => $request->product,
            'quantity'    => $request->quantity,
            'unit_price'  => $product->currentPrice[0]->unit_price,
            'total_price' => ($product->currentPrice[0]->unit_price * $request->quantity)
        ]);

       
        Inventory::create([
            "product_id" => $request->product,
            "quantity"   => $request->quantity,
            "stock"      => ($get_current_stock->stock - $request->quantity)
        ]);
        

        if(($get_current_stock->stock - $request->quantity) == 0){
            $product->active = 0;
            $product->save();
        }

        return $this->showOne($invoice, 201);
    }


    

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Invoice $invoice)
    {
        $this->allowedAdminAction();
        return $this->showOne($invoice);
    }


}
