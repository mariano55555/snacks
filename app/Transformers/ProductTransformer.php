<?php

namespace App\Transformers;

use App\Models\Product;
use League\Fractal\TransformerAbstract;

class ProductTransformer extends TransformerAbstract
{
    /**
     * A Fractal transformer.
     *
     * @return array
     */
    public function transform(Product $product)
    {
        return [
            'identifier' => (int)$product->id,
            'product' => (string)$product->name,
            'description' => (string)$product->description,
            'status' => (string)$product->active,
            'dateCreated' => (string)$product->created_at,
            'dateUpdated' => (string)$product->updated_at,
            'dateDeleted' => isset($product->deleted_at) ? (string) $product->deleted_at : null,
            'likes' => (int)$product->likes_count,
            'stock' => isset($product->currentInventory[0]->stock) ? (int)$product->currentInventory[0]->stock : 0,
            'price' => isset($product->currentPrice[0]->unit_price) ? (float)$product->currentPrice[0]->unit_price : 0,
            'links' => [
                [
                    'rel' => 'self',
                    'href' => route("products.show", $product->id)
                ]
            ]
        ];
    }

    public static function originalAttribute($index)
    {
        $attributes = [
            'identifier' => 'id',
            'product' => 'name',
            'description' => 'description',
            'likes' => 'likes_count',
            'stock' => 'stock',
            'price' => 'price',
            'status' => 'active',
            'dateCreated' => 'created_at',
            'dateUpdated' => 'updated_at',
            'dateDeleted' => 'deleted_at',
        ];
        return isset($attributes[$index]) ? $attributes[$index] : null;
    }

    public static function transformedAttribute($index)
    {
        $attributes = [
            'id' => 'identifier',
            'name' => 'product',
            'description' => 'description',
            'likes_count' => 'likes',
            'stock' => 'stock',
            'price' => 'price',
            'active' => 'status',
            'created_at' => 'dateCreated',
            'updated_at' => 'dateUpdated',
            'deleted_at' => 'dateDeleted',
        ];
        return isset($attributes[$index]) ? $attributes[$index] : null;
    }
}