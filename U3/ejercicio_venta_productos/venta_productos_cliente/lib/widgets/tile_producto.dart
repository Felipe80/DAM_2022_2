import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:venta_productos_cliente/constants.dart';

class TileProducto extends StatelessWidget {
  const TileProducto({
    Key? key,
    required this.producto,
  }) : super(key: key);

  final producto;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        MdiIcons.cube,
        color: Color(kAccentColor),
      ),
      title: Text(producto['nombre']),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$ ${producto['precio']}',
            style: TextStyle(color: Color(kAccentColor3)),
          ),
          Text('Unidades Vendidas: ${producto['unidades_vendidas']}'),
        ],
      ),
    );
  }
}
