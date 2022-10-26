import 'package:cliente_productos/pages/productos_agregar_page.dart';
import 'package:cliente_productos/pages/productos_editar_page.dart';
import 'package:cliente_productos/providers/productos_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductosListarPage extends StatefulWidget {
  const ProductosListarPage({Key? key}) : super(key: key);

  @override
  State<ProductosListarPage> createState() => _ProductosListarPageState();
}

class _ProductosListarPageState extends State<ProductosListarPage> {
  final fPrecio =
      NumberFormat.currency(decimalDigits: 0, locale: 'es-CL', symbol: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: FutureBuilder(
        future: ProductosProvider().getProductos(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 1.3,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var producto = snapshot.data[index];
              return Dismissible(
                key: ObjectKey(producto),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        MdiIcons.trashCan,
                        color: Colors.white,
                      ),
                      Text(
                        'Borrar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                // secondaryBackground: Container(
                //   color: Colors.purple,
                // ),
                onDismissed: (direction) {
                  // print('Dirección:${direction.toString()}');
                  // if (direction == DismissDirection.startToEnd) {
                  //   print('Hacia la derecha');
                  // } else {
                  //   print('Hacia la izquierda');
                  // }
                  ProductosProvider()
                      .borrar(producto['cod_producto'])
                      .then((fueBorrado) {
                    if (fueBorrado) {
                      //borrado ok :)
                      snapshot.data.removeAt(index);
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 2),
                          // content: Text('Producto borrado :)'),
                          content: Text('${producto['nombre']} borrado :)'),
                        ),
                      );
                    } else {
                      //borrado fail :(
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text('No se puedo borrar :\'('),
                        ),
                      );
                    }
                  });
                },
                child: ListTile(
                  leading: Icon(MdiIcons.cube),
                  title: Text(producto['nombre']),
                  subtitle: Text(
                    '\$' + fPrecio.format(producto['precio']),
                  ),
                  onLongPress: () {
                    //editar
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) =>
                          ProductosEditarPage(producto['cod_producto']),
                    );
                    Navigator.push(context, route).then((valor) {
                      setState(() {});
                    });
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => ProductosAgregarPage(),
          );
          Navigator.push(context, route).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
