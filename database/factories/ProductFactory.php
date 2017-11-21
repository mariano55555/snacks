<?php

use Faker\Generator as Faker;

$factory->define(App\Models\Product::class, function (Faker $faker) {
    $products = [
        'Bubblegum',
        'Candy',
        'Chocolate',
        'Fudge',
        'Marshmallow',
        'Pudding',
        'Toffee',
        'Cookie',
        'Pastry',
        'Churros'
    ];
    return [
        'name'  => $faker->word,
        'email' => $faker->paragraph(1)
    ];
});
