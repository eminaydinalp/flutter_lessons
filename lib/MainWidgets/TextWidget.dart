import 'package:flutter/material.dart';

class Textwidget extends StatelessWidget {
  const Textwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Widget"),
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: Text(
          "Selam Arkadaşlar Selam Arkadaşlar Selam Arkadaşlar"
              "Selam Arkadaşlar Selam Arkadaşlar Selam Arkadaşlar"
              "Selam Arkadaşlar Selam Arkadaşlar Selam Arkadaşlar",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              backgroundColor: Colors.yellow,
              decoration: TextDecoration.underline
          ),
          textAlign: TextAlign.justify,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.rtl,
        ),
      )
    );
  }
}
