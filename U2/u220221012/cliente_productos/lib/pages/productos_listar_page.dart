import 'package:cliente_productos/pages/productos_agregar_page.dart';
import 'package:cliente_productos/pages/productos_editar_page.dart';
import 'package:cliente_productos/providers/productos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
              return Slidable(
                //action panes
                startActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Colors.purple,
                      icon: Icons.edit,
                      label: 'Editar',
                    ),
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Colors.blue,
                      icon: Icons.file_open,
                      label: 'Archivar',
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        confirmDialog(context, producto['nombre'])
                            .then((confirma) {
                          if (confirma) {
                            // borrar
                            ProductosProvider()
                                .borrar(producto['cod_producto'])
                                .then((fueBorrado) {
                              if (fueBorrado) {
                                snapshot.data.removeAt(index);
                                setState(() {});
                                mostrarSnackbar(
                                    'Producto ${producto['nombre']} borrado');
                              }
                            });
                          }
                        });
                      },
                      backgroundColor: Colors.red,
                      icon: MdiIcons.trashCan,
                      label: 'Borrar',
                    ),
                  ],
                ),
                //ListTile
                child: ListTile(
                  leading: Icon(MdiIcons.cube),
                  title: Text(
                      '(${producto['categoria']['nombre']}) ${producto['nombre']}'),
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

  void mostrarSnackbar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(mensaje),
      ),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context, String producto) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmación de borrado'),
          content: Text('¿Confirma borrar el producto $producto?'),
          actions: [
            TextButton(
              child: Text('CANCELAR'),
              onPressed: () => Navigator.pop(context, false),
            ),
            ElevatedButton(
              child: Text('CONFIRMAR'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      },
    );
  }
}
