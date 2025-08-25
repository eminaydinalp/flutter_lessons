
import 'package:first_project/Lists/listview_builder_widget.dart';
import 'package:first_project/Lists/listview_widget.dart';
import 'package:first_project/MainWidgets/ButtonWidget.dart';
import 'package:first_project/MainWidgets/ColumnAndRow.dart';
import 'package:first_project/MainWidgets/ContainerWidget.dart';
import 'package:first_project/MainWidgets/TextWidget.dart';
import 'package:first_project/MainWidgets/textfield_widget.dart';
import 'package:first_project/Recap/Recap1.dart';
import 'package:first_project/data_save/shared_preferences_page.dart';
import 'package:first_project/navigation_processes/first_page.dart';
import 'package:first_project/projects/body_mass_index/main_page.dart';
import 'package:first_project/projects/notes_app/home_page.dart';
import 'package:flutter/material.dart';

import 'MainWidgets/show_image.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "First Project",
      home: HomePage(),
    );
  }
}

class ScaffoldDesign extends StatelessWidget {
  const ScaffoldDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Project"),
        backgroundColor: Colors.red,
      ),
      body: Text("Merhaba Arkadaşlar!"),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("Butona basıldı");
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: DrawerHeader(
          child: Text("Menü"),
        ),
      ),
    );
  }
}
