import 'package:flutter/material.dart';

class Recap1 extends StatelessWidget {
  const Recap1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text("Recap 1"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, color: Colors.black26, spreadRadius: 2)
              ]),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ahmet Yılmaz",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),
                ),
                SizedBox(height: 8,),
                Text(
                  "Flutter Developer",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
                Divider(
                  color: Colors.black38,
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email
                    ),
                    SizedBox(width: 8,),
                    Text(
                      "ahmet@example.com"
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 8,),
                    Text(
                      "0555555555"
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
