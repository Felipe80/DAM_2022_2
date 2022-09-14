import 'package:flutter/material.dart';

class DwPage2 extends StatelessWidget {
  const DwPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
      ),
      body: Center(
        child: Text(
          'Página 2',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
