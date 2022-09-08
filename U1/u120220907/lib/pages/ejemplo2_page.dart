import 'package:flutter/material.dart';

class Ejemplo2Page extends StatelessWidget {
  const Ejemplo2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Container(
            // color: Colors.lightGreen.shade100,
            decoration: BoxDecoration(
              color: Colors.lightGreen.shade100,
              image: DecorationImage(
                image: AssetImage('assets/images/fondo.png'),
                fit: BoxFit.fill,
              ),
            ),
            width: double.infinity,
            height: 200,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: Colors.blue,
                  width: 180,
                  height: 180,
                ),
                Positioned(
                  bottom: -50,
                  right: 150,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: 120,
                    height: 120,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            width: double.infinity,
            height: 200,
            color: Colors.lightBlue.shade100,
            child: IndexedStack(
              alignment: Alignment.center,
              index: 2,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
