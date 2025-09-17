import 'package:first_project/projects/notes_app/models/note.dart';
import 'package:flutter/material.dart';

class EditNotePage extends StatefulWidget {

  final Note? note;
  const EditNotePage({super.key, this.note});

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? "");
    _contentController = TextEditingController(text: widget.note?.content ?? "");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result){
        if(!didPop){
          //Navigator.pop(context, _controller.text.trim());
          _sendNote();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                //Navigator.pop(context, _controller.text.trim());
                _sendNote();
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
          child: Column(
            children: [
              TextField(
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                controller: _titleController,
                maxLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Başlık"
                ),
              ),
              TextField(
                controller: _contentController,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Not"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendNote() {
    String title = _titleController.text.trim();
    String content = _contentController.text.trim();

    if(title.isEmpty && content.isEmpty){
      Navigator.pop(context, null);
      return;
    }

    Note note = Note(title: title, content: content);

    Navigator.pop(context, note);
  }
}
