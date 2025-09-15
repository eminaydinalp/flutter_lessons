import 'package:flutter/material.dart';

class EditNotePage extends StatefulWidget {

  final String? note;
  const EditNotePage({super.key, this.note});

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController(text: widget.note ?? "");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result){
        if(!didPop){
          Navigator.pop(context, _controller.text.trim());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context, _controller.text.trim());
              },
            ),
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.save),
          //     onPressed: (){
          //       Navigator.pop(context, _controller.text.trim());
          //     },
          //   )
          // ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _controller,
            maxLines: null,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Not"
            ),
          ),
        ),
      ),
    );
  }
}
