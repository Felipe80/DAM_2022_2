import 'package:flutter/material.dart';

class NavVentasPage extends StatefulWidget {
  NavVentasPage({Key? key}) : super(key: key);

  @override
  State<NavVentasPage> createState() => _NavVentasPageState();
}

class _NavVentasPageState extends State<NavVentasPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Ventas'),
    );
  }
}
