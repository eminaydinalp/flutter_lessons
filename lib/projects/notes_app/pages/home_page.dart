import 'package:first_project/projects/notes_app/pages/detail_page.dart';
import 'package:first_project/projects/notes_app/pages/edit_note_page.dart';
import 'package:first_project/projects/notes_app/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/pref_keys.dart';

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
        onPressed: /*_showAddNotes*/ _addNotes,
        child: Icon(Icons.add),
      ),
      body: _notes.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.note_alt,
                    size: 72,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Henüz not yok, + ile ekleyin",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      title: Text(
                        _notes[index],
                        maxLines: 1,
                      ),
                      leading: Icon(Icons.notes),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             DetailPage(note: _notes[index])));
                        _updateNotes(index);
                      },
                      onLongPress: () => _confirmDelete(index)),
                );
              },
            ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Menü",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Ayarlar"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SettingsPage()));
              },
            )
          ],
        ),
      ),
    );
  }

  void _showAddNotes() {
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

  Future<void> _saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(PrefKeys.keyNotes, _notes);
  }

  Future<void> _loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _notes = prefs.getStringList(PrefKeys.keyNotes) ?? [];
    });
  }

  Future<void> _confirmDelete(int index) async {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text("Silinsin mi"),
              content: Text("Bu not kalıcı olarak silinecek"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(ctx), child: Text("Vazgeç")),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _notes.removeAt(index);
                    });
                    await _saveNotes();

                    Navigator.pop(ctx);
                  },
                  child: Text("Sil"),
                )
              ],
            ));
  }

  Future<void> _addNotes() async {

    final newNote = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (_) => EditNotePage()
      )
    );

    if(newNote != null && newNote.isNotEmpty){
      setState(() {
        _notes.add(newNote);
      });

      await _saveNotes();
    }

  }

  Future<void> _updateNotes(int index) async {

    final updateNote = await Navigator.push<String>(
        context,
        MaterialPageRoute(
            builder: (_) => EditNotePage(note: _notes[index],)
        )
    );

    if(updateNote != null && updateNote.isNotEmpty){
      setState(() {
        _notes[index] = updateNote;
      });

      await _saveNotes();
    }


  }
}
