<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('producto_venta', function (Blueprint $table) {
            //crear clave primaria compuesta
            $table->string('cod_producto',20);
            $table->unsignedInteger('venta_id');
            $table->primary(['cod_producto','venta_id']);

            //otros campos
            $table->unsignedSmallInteger('cantidad');
            $table->unsignedInteger('precio_venta');

            //relaciones
            $table->foreign('cod_producto')->references('cod_producto')->on('productos');
            $table->foreign('venta_id')->references('id')->on('ventas');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('producto_venta');
    }
};
