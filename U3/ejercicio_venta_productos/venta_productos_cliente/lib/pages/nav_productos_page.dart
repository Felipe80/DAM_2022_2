import 'package:flutter/material.dart';

class NavProductosPage extends StatefulWidget {
  NavProductosPage({Key? key}) : super(key: key);

  @override
  State<NavProductosPage> createState() => _NavProductosPageState();
}

class _NavProductosPageState extends State<NavProductosPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Productos'),
    );
  }
}
