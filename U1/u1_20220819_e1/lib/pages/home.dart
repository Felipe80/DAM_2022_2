import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.bug_report),
        title: Text('Texto del appbar'),
      ),
      body: Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
