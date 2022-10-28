<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductosRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'cod_producto' => 'required|min:3|unique:productos,cod_producto',
            'nombre' => 'required',
            'precio' => 'required|numeric|gte:0',
            'stock' => 'required|numeric|gt:0',
        ];
    }

    public function messages(){
        return [
            'cod_producto.required' => 'Indique el código de producto',
            'cod_producto.min' => 'El código debe tener al menos 3 caracteres',
            'cod_producto.unique' => 'El código :input ya está asignado a otro producto',
            'nombre.required' => 'Indique el nombre de producto',
            'precio.required' => 'Indique el precio de producto',
            'precio.numeric' => 'Precio debe ser un número',
            'precio.gte' => 'El precio debe ser mayor o igual a cero',
            'stock.required' => 'Indique el stock de producto',
            'stock.numeric' => 'Stock debe ser un número',
            'stock.gt' => 'El stock debe ser mayor a cero',
        ];
    }
}
