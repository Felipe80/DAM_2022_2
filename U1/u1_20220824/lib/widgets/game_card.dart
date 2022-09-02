import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  String imagen, titulo, precio;

  GameCard({Key? key, this.imagen = '', this.titulo = '', this.precio = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
        color: Colors.lightBlue.shade50,
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: 350,
            // image: AssetImage('assets/images/' + this.imagen),
            image: AssetImage('assets/images/${this.imagen}'),
          ),
          Text(
            this.titulo,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            '\$ ${this.precio}',
            style: TextStyle(
                color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
