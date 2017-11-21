<?php

namespace App\Http\Controllers;

use Auth;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\ApiController;
use App\Transformers\ProductTransformer;
use Illuminate\Auth\AuthenticationException;

class ProductsController extends ApiController
{

    public function __construct()
    {
        $this->middleware("client.credentials")->only(["index", "show", "like"]);
        $this->middleware("auth:api")->except(["index", "show"]);
        $this->middleware("transform.input:" . ProductTransformer::class)->only(["store", "update"]);
        $this->middleware("scope:manage-products")->except(["index", "show", "like"]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Product::where("active",1)
                            ->withCount('likes')
                            ->orderBy("likes_count","desc")
                            ->with(["currentInventory", "currentPrice"])
                            ->get();
        return $this->showAll($products);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->allowedAdminAction();
        $rules = [
            'name'  => 'required|unique:products',
            'price' => 'required|numeric',
            'stock' => 'required|integer'
        ];
        $this->validate($request, $rules);
        $product = Product::create($request->all());
        
        $product->price()->create([
            "unit_price" => $request->price
        ]);

        $product->inventory()->create([
            "quantity" => $request->stock,
            "stock"    => $request->stock
        ]);

        return $this->showOne($product);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        $product = Product::where("id", $product->id)->withCount('likes')->with(["currentInventory", "currentPrice"])->first();
        return $this->showOne($product);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $this->allowedAdminAction();
        $rules = [
            'name'  => 'required|unique:products,name,'.$product->id,
            'price' => 'numeric',
            'stock' => 'integer'
        ];

        $this->validate($request, $rules);

        $product->fill($request->only([
            'name',
            'description',
            'active',
        ]));
        
        if ($product->isClean()){
            return $this->errorResponse("You should specified at least one different value for the record", 422);
        }

        $product->save();

        if($request->has("price")){
            $product->price()->where('active', 1)->update(['active' => 0]);
            $product->price()->create([
                "unit_price" => $request->price
            ]);
        }

        if($request->has("stock")){
            $product->inventory()->where('active', 1)->update(['active' => 0]);
            $product->inventory()->create([
                "quantity" => $request->stock,
                "stock"    => $request->stock
            ]);
        }

        $product = Product::where("id", $product->id)->withCount('likes')->with(["currentInventory", "currentPrice"])->first();
        return $this->showOne($product);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function like(Request $request, Product $product)
    {
        if(!$request->user()){
            throw new AuthenticationException("Invalid type of token.");
        }

        $ocurrence = $product->likes()->where('users.id', $request->user()->id)->exists();
        if($ocurrence){
            $product->likes()->detach($request->user()->id);
        }else{
            $product->likes()->attach($request->user()->id); 
        }

        $product = Product::where("id",$product->id)
                            ->withCount('likes')
                            ->with(["currentInventory", "currentPrice"])
                            ->first();

        return $this->showOne($product);
    }

    public function setStock(Request $request, Product $product)
    {
        $this->allowedAdminAction();
        $rules = [
            'stock' => 'integer|required'
        ];

        $this->validate($request, $rules);

        $product->inventory()->where('active', 1)->update(['active' => 0]);
        $product->inventory()->create([
            "quantity" => $request->stock,
            "stock"    => $request->stock
        ]);
        $product = Product::where("id", $product->id)->withCount('likes')->with(["currentInventory", "currentPrice"])->first();
        return $this->showOne($product);
    }


    public function setPrice(Request $request, Product $product)
    {
        $this->allowedAdminAction();
        $rules = [
            'price' => 'numeric|required'
        ];

        $this->validate($request, $rules);
        $product->price()->where('active', 1)->update(['active' => 0]);
        $product->price()->create([
            "unit_price" => $request->price
        ]);
        
        $product = Product::where("id", $product->id)->withCount('likes')->with(["currentInventory", "currentPrice"])->first();
        return $this->showOne($product);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        $this->allowedAdminAction();
        $product->delete();
        return $this->showOne($product);
    }
}
