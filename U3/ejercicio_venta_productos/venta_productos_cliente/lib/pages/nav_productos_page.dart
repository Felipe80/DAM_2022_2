import 'package:flutter/material.dart';
import 'package:venta_productos_cliente/constants.dart';
import 'package:venta_productos_cliente/providers/productos_provider.dart';

import '../widgets/tile_producto.dart';

class NavProductosPage extends StatefulWidget {
  NavProductosPage({Key? key}) : super(key: key);

  @override
  State<NavProductosPage> createState() => _NavProductosPageState();
}

class _NavProductosPageState extends State<NavProductosPage> {
  final formBusquedaKey = GlobalKey<FormState>();
  String busqueda = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //BUSCADOR
        Container(
          width: double.infinity,
          height: 80,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Color(kPrimaryColor),
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(40),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Productos',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(kAccentColor),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),

              //form busqueda
              Container(
                height: 35,
                child: Form(
                  key: formBusquedaKey,
                  child: TextFormField(
                    onChanged: (texto) {
                      setState(() {
                        busqueda = texto;
                      });
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Color(kBackgroundColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade50),
                      ),
                    ),
                  ),
                ),
              ),
              //fin form busqueda
            ],
          ),
        ),

        //LISTA DE PRODUCTOS
        Expanded(
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: FutureBuilder(
              future: ProductosProvider().getProductos(busqueda: busqueda),
              builder: (context, AsyncSnapshot snap) {
                //esperando data
                if (!snap.hasData || snap.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                //data recibida, mostrar
                return ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: snap.data.length,
                  itemBuilder: (context, index) {
                    var producto = snap.data[index];
                    return TileProducto(producto: producto);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
