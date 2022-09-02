import 'package:flutter/material.dart';

import '../widgets/game_card.dart';

class ListaJuegosPage2 extends StatelessWidget {
  final juegos = [
    {
      'titulo': 'Super Mario Bros U Deluxe',
      'precio': '50.990',
      'imagen': 'mario_u_deluxe.jpg',
    },
    {
      'titulo': 'Lego Jurassic World',
      'precio': '30.990',
      'imagen': 'lego_jurassic_world.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Juegos'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        reverse: false,
        children: juegos.map((juego) {
          return GameCard(
            titulo: juego['titulo'].toString(),
            precio: juego['precio'].toString(),
            imagen: juego['imagen'].toString(),
          );
        }).toList(),
      ),
    );
  }
}
