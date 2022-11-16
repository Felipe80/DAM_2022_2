<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Venta extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'ventas';
    protected $keyType = 'integer';
    public $timestamps = false;

    //retorna los productos de la venta
    public function productos(){
        return $this->belongsToMany(Producto::class,'producto_venta','venta_id','cod_producto');
    }
}
