import 'dart:math';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _result = 0;

  TextEditingController _heightController = TextEditingController();

  TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Body Mass Index"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  label: Text("Your height"),
                  suffixText: "m"),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  label: Text("Your weight"),
                  suffixText: "m"),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              child: Text("Calculate"),
              onPressed: _calculateBodyIndex,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Sonuç : " + _result.toStringAsFixed(2),
              style: TextStyle(fontSize: 48),
            )
          ],
        ),
      ),
    );
  }

  void _calculateBodyIndex(){
    String heightText = _heightController.text;
    String weightText = _weightController.text;

    try{
      double height = double.parse(heightText);
      double weight = double.parse(weightText);

      setState(() {
        //_result = weight / (height * height);
        _result = weight / pow(height, 2);
      });
    }

    catch(e){
      print("Error :" + e.toString());
    }

  }
}
