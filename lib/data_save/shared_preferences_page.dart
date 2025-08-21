import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  @override
  State<SharedPreferencesPage> createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  String _username = "";

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    load_Username();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Username : $_username"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  labelText: "enter username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString("username", _controller.text);

                    // String? username = prefs.getString("username");
                    //
                    // setState(() {
                    //   _username = username ?? "";
                    // });

                    load_Username();
                  },
                  child: Text("Save"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.remove('username');

                    load_Username();
                  },
                  child: Text("Remove"),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Saved username : ${_username}",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }

  void load_Username() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    //String? username = prefs.getString("username");

    setState(() {
      _username = prefs.getString("username") ?? "";
    });
  }
}
