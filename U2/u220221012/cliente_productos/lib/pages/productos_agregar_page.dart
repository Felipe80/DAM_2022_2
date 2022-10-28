import 'package:cliente_productos/providers/productos_provider.dart';
import 'package:flutter/material.dart';

class ProductosAgregarPage extends StatefulWidget {
  @override
  State<ProductosAgregarPage> createState() => _ProductosAgregarPageState();
}

class _ProductosAgregarPageState extends State<ProductosAgregarPage> {
  TextEditingController codigoCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController precioCtrl = TextEditingController();
  TextEditingController stockCtrl = TextEditingController();

  String errCodigo = '';
  String errNombre = '';
  String errPrecio = '';
  String errStock = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: ListView(
            children: [
              campoCodigo(),
              mostrarError(errCodigo),
              campoNombre(),
              mostrarError(errNombre),
              campoPrecio(),
              mostrarError(errPrecio),
              campoStock(),
              mostrarError(errStock),
              botonAgregar(),
            ],
          ),
        ),
      ),
    );
  }

  Container mostrarError(String error) {
    return Container(
      width: double.infinity,
      child: Text(
        error,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  TextFormField campoCodigo() {
    return TextFormField(
      controller: codigoCtrl,
      decoration: InputDecoration(
        labelText: 'Código',
      ),
    );
  }

  TextFormField campoNombre() {
    return TextFormField(
      controller: nombreCtrl,
      decoration: InputDecoration(
        labelText: 'Nombre',
      ),
    );
  }

  TextFormField campoPrecio() {
    return TextFormField(
      controller: precioCtrl,
      decoration: InputDecoration(
        labelText: 'Precio',
      ),
      keyboardType: TextInputType.number,
    );
  }

  TextFormField campoStock() {
    return TextFormField(
      controller: stockCtrl,
      decoration: InputDecoration(
        labelText: 'Stock',
      ),
      keyboardType: TextInputType.number,
    );
  }

  Container botonAgregar() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.purple,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text('Agregar Producto'),
          ],
        ),
        onPressed: () async {
          //caputar datos del form
          String cod_producto = codigoCtrl.text.trim();
          String nombre = nombreCtrl.text.trim();
          int precio = int.tryParse(precioCtrl.text.trim()) ?? 0;
          int stock = int.tryParse(stockCtrl.text.trim()) ?? 0;

          //enviar por post al api
          var respuesta = await ProductosProvider()
              .agregar(cod_producto, nombre, precio, stock);

          //manejar errores
          if (respuesta['message'] != null) {
            var errores = respuesta['errors'];
            errCodigo = errores['cod_producto'] != null
                ? errores['cod_producto'][0]
                : '';
            errNombre = errores['nombre'] != null ? errores['nombre'][0] : '';
            errPrecio = errores['precio'] != null ? errores['precio'][0] : '';
            errStock = errores['stock'] != null ? errores['stock'][0] : '';
            setState(() {});
            return;
          }

          //redireccionar a pagina que lista productos
          Navigator.pop(context);
        },
      ),
    );
  }
}
