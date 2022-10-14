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
              campoNombre(),
              campoPrecio(),
              campoStock(),
              botonAgregar(),
            ],
          ),
        ),
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
          await ProductosProvider()
              .agregar(cod_producto, nombre, precio, stock);

          //redireccionar a pagina que lista productos
          Navigator.pop(context);
        },
      ),
    );
  }
}
