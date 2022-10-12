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
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = false;
}
