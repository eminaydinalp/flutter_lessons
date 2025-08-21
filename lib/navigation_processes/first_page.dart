import 'package:first_project/navigation_processes/second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
        backgroundColor: Colors.red,
      ),
      
      body: Center(
        child: ElevatedButton(
          onPressed: (){

            goNewPageWithData(context);

          },
          child: Text("Go New Page"),
        ),
      ),
    );
  }

  void goNewPage(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondPage())

    );
  }

  void goNewPageWithData(BuildContext context){

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage(data: "Selam",))
    );

  }
}
