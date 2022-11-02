<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Categoria extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'categorias';

    //obtener los productos de una categoria
    public function productos(){
        return $this->hasMany(Producto::class);
    }
}
