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
    protected $appends = ['total_venta'];
    protected $hidden = ['productosConPivot'];

    //retorna los productos de la venta
    public function productos(){
        return $this->belongsToMany(Producto::class,'producto_venta','venta_id','cod_producto');
    }

    public function productosConPivot(){
        return $this->belongsToMany(Producto::class,'producto_venta','venta_id','cod_producto')->withPivot('cantidad','precio_venta');
    }

    //indicar el total de la venta
    public function getTotalVentaAttribute(){
        $totalVenta = 0;
        foreach($this->productosConPivot as $prod){
            $totalVenta += $prod->pivot->cantidad * $prod->pivot->precio_venta;
        }
        return $totalVenta;
    }
}
