import 'package:flutter/material.dart';

import '../widgets/box_ejercicio1.dart';

class Ejemplo1Page extends StatelessWidget {
  const Ejemplo1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded y Spacer'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            width: double.infinity,
            height: 150,
            color: Colors.lightBlue.shade50,
            child: Row(
              children: [
                BoxEjercicio1(texto: '1', color: 0xFFBD0036),
                Expanded(
                  flex: 2,
                  child: BoxEjercicio1(texto: '2', color: 0xFFF25330),
                ),
                BoxEjercicio1(texto: '3', color: 0xFF531741),
                Expanded(child: BoxEjercicio1(texto: '4', color: 0xFF2B7EBB)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: double.infinity,
            height: 150,
            color: Colors.lightBlue.shade50,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BoxEjercicio1(texto: '1', color: 0xFFBD0036),
                Spacer(),
                BoxEjercicio1(texto: '2', color: 0xFFF25330),
                BoxEjercicio1(texto: '3', color: 0xFF531741),
                Spacer(
                  flex: 2,
                ),
                BoxEjercicio1(texto: '4', color: 0xFF2B7EBB),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
