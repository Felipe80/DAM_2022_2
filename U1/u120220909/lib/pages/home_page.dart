import 'package:flutter/material.dart';
import 'package:u120220909/pages/ejemplo1_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navegación 1'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Ir a página 2'),
          onPressed: () {
            //crear la ruta
            MaterialPageRoute route = MaterialPageRoute(builder: (context) {
              return Ejemplo1Page();
            });

            //navegar hacia la ruta
            Navigator.push(context, route);
          },
        ),
      ),
    );
  }
}
