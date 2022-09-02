import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ListasPage extends StatelessWidget {
  const ListasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              MdiIcons.cube,
              color: Colors.purple,
            ),
            title: Text('Laptop Dell'),
            subtitle: Text('\$1.500.000'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              MdiIcons.cube,
              color: Colors.purple,
            ),
            title: Text('Proyector Epson'),
            subtitle: Text('\$600.000'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              MdiIcons.cube,
              color: Colors.purple,
            ),
            title: Text('PC All In One Dell'),
            subtitle: Text('\$1.000.000'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              MdiIcons.cube,
              color: Colors.purple,
            ),
            title: Text('Macbook Pro'),
            subtitle: Text('\$2.600.000'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(),
        ],
      ),
    );
  }
}
