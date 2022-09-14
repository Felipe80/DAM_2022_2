import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:u120220904b/pages/nav_content/nc_page1.dart';
import 'package:u120220904b/pages/nav_content/nc_page2.dart';
import 'package:u120220904b/pages/nav_content/nc_page3.dart';
import 'package:u120220904b/pages/nav_content/nc_page4.dart';

class EjemploBottomNavPage extends StatefulWidget {
  EjemploBottomNavPage({Key? key}) : super(key: key);

  @override
  State<EjemploBottomNavPage> createState() => _EjemploBottomNavPageState();
}

class _EjemploBottomNavPageState extends State<EjemploBottomNavPage> {
  int paginaSel = 0;
  final paginas = [NcPage1(), NcPage2(), NcPage3(), NcPage4()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Bottom Nav'),
      ),
      body: paginas[paginaSel],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: paginaSel,
        onTap: (index) {
          // print('Tap:' + index.toString());
          setState(() {
            paginaSel = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.earth),
            label: 'Página 1',
            backgroundColor: Color(0xFFD80100),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.rocketLaunch),
            label: 'Página 2',
            backgroundColor: Color(0xFF037470),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.ufoOutline),
            label: 'Página 3',
            backgroundColor: Color(0xFFFF8800),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.alienOutline),
            label: 'Página 4',
            backgroundColor: Color(0xFF2C0728),
          ),
        ],
      ),
    );
  }
}
