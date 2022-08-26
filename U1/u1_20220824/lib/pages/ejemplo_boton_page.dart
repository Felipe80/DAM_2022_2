import 'package:flutter/material.dart';

class EjemploBotonPage extends StatefulWidget {
  EjemploBotonPage({Key? key}) : super(key: key);

  @override
  State<EjemploBotonPage> createState() => _EjemploBotonPageState();
}

class _EjemploBotonPageState extends State<EjemploBotonPage> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Botón'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              color: Colors.lightGreen.shade50,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Contador: ',style: TextStyle(fontSize: 26),),
                  Text(contador.toString(),style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Container(
              height: 70,
              color: Colors.lightBlue.shade50,
              margin: EdgeInsets.only(top:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: Text('Aumentar'),
                    onPressed: (){
                      //contador++;
                      setState(() {
                           contador++;                 
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text('Disminuir'),
                    onPressed: (){},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}