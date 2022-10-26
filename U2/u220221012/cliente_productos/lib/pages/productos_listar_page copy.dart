import 'package:cliente_productos/pages/productos_agregar_page.dart';
import 'package:cliente_productos/providers/productos_provider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductosListarPage extends StatefulWidget {
  const ProductosListarPage({Key? key}) : super(key: key);

  @override
  State<ProductosListarPage> createState() => _ProductosListarPageState();
}

class _ProductosListarPageState extends State<ProductosListarPage> {
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
              return ListTile(
                leading: Icon(MdiIcons.cube),
                title: Text(snapshot.data[index]['nombre']),
                subtitle: Text(
                  '\$' + snapshot.data[index]['precio'].toString(),
                ),
                trailing: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Text('Borrar'),
                  onPressed: () {},
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
