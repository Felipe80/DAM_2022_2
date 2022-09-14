import 'package:flutter/material.dart';

class DwPage3 extends StatelessWidget {
  const DwPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 3'),
      ),
      body: Center(
        child: Text(
          'Página 3',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
