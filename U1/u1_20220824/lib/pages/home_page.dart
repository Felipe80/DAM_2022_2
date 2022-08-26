import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {

  final estilo1 = TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold);
  final estilo2 = TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.bug_report,color: Color(0xFFF2B900),),
        title: Text('Primera App'),
        backgroundColor: Color(0xFF531741),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hola Mundo'),
            Row(
              children: [
                Container(
                  child: Text('UTFSM',style: estilo1),
                  color: Colors.lightBlue.shade100,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                ),
                Container(
                  child: Text('Informática',style: estilo1,),
                  color: Colors.lightGreen.shade100,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.rocket,size:50),
                Icon(MdiIcons.alienOutline,size: 50,)
              ],
            ),
            Container(
              color: Colors.lightBlue.shade100,
              height: 100,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Text('Uno',style:estilo2),
                Text('Dos',style:estilo2),
                Spacer(),
                Text('Tres',style:estilo2),
                Text('Cuatro',style:estilo2),
              ],),
            ),
          ],
        ),
      ),
    );
  }
}