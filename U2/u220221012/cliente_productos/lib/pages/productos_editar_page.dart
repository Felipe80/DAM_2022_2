import 'package:cliente_productos/providers/productos_provider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductosEditarPage extends StatefulWidget {
  String cod_producto;

  ProductosEditarPage(this.cod_producto, {Key? key}) : super(key: key);

  @override
  State<ProductosEditarPage> createState() => _ProductosEditarPageState();
}

class _ProductosEditarPageState extends State<ProductosEditarPage> {
  TextEditingController codigoCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController precioCtrl = TextEditingController();
  TextEditingController stockCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: ProductosProvider().getProducto(widget.cod_producto),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              var producto = snapshot.data;
              codigoCtrl.text = producto['cod_producto'];
              nombreCtrl.text = producto['nombre'];
              precioCtrl.text = producto['precio'].toString();
              stockCtrl.text = producto['stock'].toString();

              return Form(
                child: Column(
                  children: [
                    Container(
                      child: Text('Editando producto:' + widget.cod_producto),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          campoCodigo(),
                          campoNombre(),
                          campoPrecio(),
                          campoStock(),
                          botonEditar(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
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

  Container botonEditar() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.amber,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit),
            Text('Editar Producto'),
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
              .editar(widget.cod_producto, cod_producto, nombre, precio, stock);

          //redireccionar a pagina que lista productos
          Navigator.pop(context);
        },
      ),
    );
  }
}
