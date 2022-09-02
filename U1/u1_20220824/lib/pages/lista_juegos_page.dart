import 'package:flutter/material.dart';

import '../widgets/game_card.dart';

class ListaJuegosPage extends StatelessWidget {
  const ListaJuegosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Juegos'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        reverse: false,
        children: [
          GameCard(
            imagen: 'mario_u_deluxe.jpg',
            titulo: 'Super Mario Bros U Deluxe',
            precio: '50.990',
          ),
          GameCard(
            imagen: 'lego_jurassic_world.jpg',
            titulo: 'Lego Jurassic World',
            precio: '30.990',
          ),
          GameCard(
            imagen: 'mario_kart_8_deluxe.jpg',
            titulo: 'Mario Kart 8 Deluxe',
            precio: '55.990',
          ),
        ],
      ),
    );
  }
}
