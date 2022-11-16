<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Producto extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'productos';
    protected $primaryKey = 'cod_producto';
    protected $keyType = 'string';
    public $timestamps = false;

    //retornar las ventas en que está un producto
    public function ventas(){
        //modelo al que apunta,nombre tabla pivote
        return $this->belongsToMany(Venta::class,'producto_venta','cod_producto','venta_id');
    }
}
