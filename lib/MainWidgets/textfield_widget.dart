import 'package:flutter/material.dart';

class TextfieldWidget extends StatefulWidget {
  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  String _username = "Ahmet";

  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Textfield Widget"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value){
              setState(() {
                //_username = value.toString();
              });
            },

            controller: _usernameController,
          ),
          SizedBox(height: 50,),
          Text("Gelen Kullanıcı :" + _username),

          ElevatedButton(
            child: Text("Değiştir"),
            onPressed: _showUsername
          )

        ],
      ),
    );
  }

  void _showUsername(){
    setState(() {
      _username = _usernameController.text;
    });
  }
}
