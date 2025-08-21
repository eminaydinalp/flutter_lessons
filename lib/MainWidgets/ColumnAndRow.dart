import 'package:flutter/material.dart';

class Columnandrow extends StatelessWidget {
  const Columnandrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column And Row Widget"),
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.green,
            ),
            SizedBox(height: 15,),
            Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
            SizedBox(height: 15,),
            Text("Column"),
            SizedBox(height: 15,),
            Container(
              width: 50,
              height: 50,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
