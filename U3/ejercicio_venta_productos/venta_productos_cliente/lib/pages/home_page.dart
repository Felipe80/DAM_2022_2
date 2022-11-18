import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:venta_productos_cliente/constants.dart';
import 'package:venta_productos_cliente/pages/nav_productos_page.dart';
import 'package:venta_productos_cliente/pages/nav_ventas_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaSel = 0;
  final paginas = [NavProductosPage(), NavVentasPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        title: Text('Venta de Productos'),
      ),

      //BODY
      body: paginas[paginaSel],

      //BOTTOMNAV
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Color(kAccentColor2),
        currentIndex: paginaSel,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.cube),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.sale),
            label: 'Ventas',
          ),
        ],
        onTap: (index) {
          setState(() {
            paginaSel = index;
          });
        },
      ),
    );
  }
}
