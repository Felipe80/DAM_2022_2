import 'package:flutter/material.dart';

class BoxEjercicio1 extends StatelessWidget {
  final String texto;
  final int color;

  const BoxEjercicio1({
    this.texto = '',
    this.color = 0xFF000000,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 70,
      height: double.infinity,
      color: Color(this.color),
      child: Text(
        this.texto,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      ),
    );
  }
}
