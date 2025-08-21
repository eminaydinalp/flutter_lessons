import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {

  String ?data;

  SecondPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
        backgroundColor: Colors.yellow,
        automaticallyImplyLeading: false,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){

                Navigator.pop(context);


              },
              child: Text("Go Back"),
            ),

            Text("Gelen Veri : ${data}")
          ],
        ),
      ),

    );
  }
}
