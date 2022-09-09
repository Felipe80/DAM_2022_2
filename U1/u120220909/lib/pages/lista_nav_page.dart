import 'dart:io';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:u120220909/pages/ejemplo1_page.dart';

import 'ejemplo2_page.dart';
import 'ejemplo3_page.dart';

class ListaNavPage extends StatelessWidget {
  const ListaNavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Nav'),
        backgroundColor: Color(0xFF524C85),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Página 1'),
                  subtitle: Text('Navegar hacia la página 1'),
                  leading: Icon(
                    MdiIcons.cube,
                    color: Colors.yellow,
                  ),
                  trailing: Icon(MdiIcons.pageNext),
                  onTap: () {
                    navegar(context, Ejemplo1Page());
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Página 2'),
                  subtitle: Text('Navegar hacia la página 2'),
                  leading: Icon(
                    MdiIcons.cube,
                    color: Colors.yellow,
                  ),
                  trailing: Icon(MdiIcons.pageNext),
                  onTap: () {
                    navegar(context, Ejemplo2Page());
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Página 3'),
                  subtitle: Text('Navegar hacia la página 3'),
                  leading: Icon(
                    MdiIcons.cube,
                    color: Colors.yellow,
                  ),
                  trailing: Icon(MdiIcons.pageNext),
                  // onTap: () {
                  //   navegar(context, Ejemplo3Page());
                  // },
                  onTap: () => navegar(context, Ejemplo3Page()),
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void navegar(BuildContext context, StatelessWidget pagina) {
    // MaterialPageRoute route = MaterialPageRoute(builder: (context) {
    //   return pagina;
    // });

    MaterialPageRoute route = MaterialPageRoute(builder: (context) => pagina);
    Navigator.push(context, route);
  }
}
