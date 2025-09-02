import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String note;
  const DetailPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Not Detay"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(note, style: TextStyle(fontSize: 18),),
      ),
    );
  }
}
