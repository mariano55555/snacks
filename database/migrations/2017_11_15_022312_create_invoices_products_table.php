<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInvoicesProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('invoices_products', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('product_id')->unsigned()->index();
            $table->integer('invoice_id')->unsigned()->index();
            $table->integer('quantity')->unsigned();
            $table->decimal('unit_price', 10,2)->unsigned();
            $table->decimal('total_price', 10,2)->unsigned();
            $table->nullableTimestamps();
            $table->softDeletes();
            $table->unsignedInteger('created_by')->nullable()->default(null);
            $table->unsignedInteger('updated_by')->nullable()->default(null);
            $table->unsignedInteger('deleted_by')->nullable()->default(null);
            $table->foreign('product_id', 'fk_product_to_invoice_id_foreign')
                  ->references('id')->on('products')
                  ->onDelete('cascade')
                  ->onUpdate('cascade');
            $table->foreign('invoice_id', 'fk_invoice_to_product_id_foreign')
                  ->references('id')->on('invoices')
                  ->onDelete('cascade')
                  ->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('invoices_products');
    }
}
