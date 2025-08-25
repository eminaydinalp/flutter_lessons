import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _inputController = TextEditingController();
  List<String> _notes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notlarım"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddNotes,
        child: Icon(Icons.add),
      ),
      body: _notes.isEmpty ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.note_alt, size: 72,),
            SizedBox(height: 12,),
            Text("Henüz not yok, + ile ekleyin", style: TextStyle(fontSize: 18),),
          ],
        ),
      ) :
      ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(_notes[index], maxLines: 1,),
              leading: Icon(Icons.notes),
            ),
          );
        },
      )
    );
  }

  void _showAddNotes()  {
    _inputController.clear();

    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text("Not Ekle"),
              content: TextField(
                controller: _inputController,
                decoration: InputDecoration(
                    hintText: "not yazınız", border: OutlineInputBorder()),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(ctx), child: Text("iptal")),
                ElevatedButton(
                  onPressed: () async {
                    String note = _inputController.text.trim();
                    if (note.isEmpty) return;
                    setState(() {
                      _notes.add(note);
                      //print("Not 2 : " + _notes[1]);
                    });

                    await _saveNotes();

                    Navigator.pop(ctx);
                  },
                  child: Text("Ekle"),
                )
              ],
            ));
  }

  Future<void> _saveNotes() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("notes", _notes);
  }

  Future<void> _loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _notes = prefs.getStringList("notes") ?? [];
    });
  }
}
