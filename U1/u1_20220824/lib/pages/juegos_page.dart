import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/game_card.dart';

class JuegosPage extends StatelessWidget {
  const JuegosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(MdiIcons.gamepad),
        title: Text('Juegos'),
        backgroundColor: Colors.purple,
      ),
      body: GameCard(
        imagen: 'mario_u_deluxe.jpg',
        titulo: 'Super Mario Bros U Deluxe',
        precio: '50.990',
      ),
    );
  }
}
