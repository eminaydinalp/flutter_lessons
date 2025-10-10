import 'dart:convert';

import 'package:first_project/api/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcılar"),
        backgroundColor: Colors.green,
      ),
      
      body: users.isEmpty ? Center(
        child: CircularProgressIndicator(),
      ):
      ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index){
          User user = users[index];
          
          return ListTile(
            leading: Text(user.id.toString()),
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: Text(user.address.city),
          );
        },
      ),
      
    );
  }

  Future<void> fetchUsers() async {
    try{
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users')
      );

      if(response.statusCode == 200){
        List<dynamic> data = jsonDecode(response.body);

        setState(() {
          users = data.map((user) => User.fromJson(user)).toList();
        });
      }
      else{
        print("Sunucu hatası: ${response.statusCode}");
      }
    }
    catch (e){
      print("Hata oluştu: $e");
    }
  }
}
