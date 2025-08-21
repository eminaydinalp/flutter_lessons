import 'package:flutter/material.dart';

class Buttonwidget extends StatefulWidget {
  @override
  State<Buttonwidget> createState() => _ButtonwidgetState();
}

class _ButtonwidgetState extends State<Buttonwidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Widget"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _pressButton,
                child: Text("Button"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, elevation: 10)),
            SizedBox(
              height: 25,
            ),
            Text(
              "Sonuç : " + _counter.toString(),
              style: TextStyle(
                fontSize: 24
              ),
            )
          ],
        ),
      ),
    );
  }

  void _pressButton(){
    print("Butona Basıldı");
    setState(() {
      _counter++;
    });
    print("Counter : " + _counter.toString());
  }
}
