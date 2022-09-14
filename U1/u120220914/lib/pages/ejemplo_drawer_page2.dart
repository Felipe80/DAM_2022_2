import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:u120220914/pages/drawer_content/dc_page1.dart';
import 'package:u120220914/pages/drawer_content/dc_page2.dart';
import 'package:u120220914/pages/drawer_content/dc_page3.dart';
import 'package:u120220914/pages/drawer_pages/dw_page1.dart';
import 'package:u120220914/pages/drawer_pages/dw_page2.dart';
import 'package:u120220914/pages/drawer_pages/dw_page3.dart';

class EjemploDrawerPage2 extends StatefulWidget {
  const EjemploDrawerPage2({Key? key}) : super(key: key);

  @override
  State<EjemploDrawerPage2> createState() => _EjemploDrawerPage2State();
}

class _EjemploDrawerPage2State extends State<EjemploDrawerPage2> {
  final paginas = [DcPage1(), DcPage2(), DcPage3()];
  int paginaSel = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Drawer 2'),
      ),
      body: paginas[paginaSel - 1],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                alignment: Alignment.center,
                color: Colors.lightBlue.shade100,
                child: Text('Header'),
              ),
            ),
            ListTile(
              leading: Icon(MdiIcons.cube),
              title: Text('Página 1'),
              onTap: () => navegar(context, 1),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Icon(MdiIcons.cube),
              title: Text('Página 2'),
              onTap: () => navegar(context, 2),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Icon(MdiIcons.cube),
              title: Text('Página 3'),
              onTap: () => navegar(context, 3),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Icon(MdiIcons.arrowLeftBoldCircle),
              title: Text('Cerrar'),
              onTap: () => Navigator.pop(context),
            ),
            Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }

  void navegar(BuildContext context, int numPagina) {
    Navigator.pop(context);
    setState(() {
      paginaSel = numPagina;
    });
  }
}
