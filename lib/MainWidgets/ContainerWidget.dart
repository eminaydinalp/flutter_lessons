import 'package:flutter/material.dart';

class Containerwidget extends StatelessWidget {
  const Containerwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container Widget"),
        backgroundColor: Colors.yellow,
      ),

      body: Container(
        width: 100,
        height: 100,
        //color: Colors.blue,
        child: Text("Flutter Öğreniyorum"),
        margin: EdgeInsets.only(top: 50, left: 20),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 2,
              color: Colors.green
            )
          ]
        ),
      )
    );
  }
}
