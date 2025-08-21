import 'package:flutter/material.dart';

class ListviewWidget extends StatelessWidget {
  const ListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview Widget"),
        backgroundColor: Colors.yellow,
      ),

      body: ListView(

        children: [
          Card(
            child: ListTile(
              title: Text("Öğe 1"),
              subtitle: Text("Bu bir alt başlıktır."),
              leading: Icon(Icons.star),
              trailing: Text("1"),
            
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Öğe 2"),
              subtitle: Text("Bu bir alt başlıktır."),
              leading: Icon(Icons.star),
              trailing: Text("2"),

            ),
          ),
          Card(
            child: ListTile(
              title: Text("Öğe 3"),
              subtitle: Text("Bu bir alt başlıktır."),
              leading: Icon(Icons.star),
              trailing: Text("3"),

            ),
          ),
          Container(
            height: 150,
            color: Colors.red,
          ),
          Container(
            height: 150,
            color: Colors.blue,
          ),
          Container(
            height: 150,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
