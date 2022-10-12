import 'package:flutter/material.dart';
import 'package:u220221007/providers/monedas_provider.dart';

class MonedasPage extends StatelessWidget {
  const MonedasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Monedas'),
      ),
      body: FutureBuilder(
        future: MonedasProvider().getMonedas(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var datos = snapshot.data;
          //print(datos);

          return ListView.builder(
            itemCount: datos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(datos[index]['Nombre']),
                subtitle: Text(datos[index]['Codigo']),
                trailing: Text(datos[index]['Valor'] + ' CLP'),
              );
            },
          );
        },
      ),
    );
  }
}
