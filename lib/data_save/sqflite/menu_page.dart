import 'package:first_project/data_save/sqflite/database_helper.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _menuItems = [];
  
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshMenu();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant Menü"),
        backgroundColor: Colors.blue,
      ),
      body: _menuItems.isEmpty ? Center(child: Text("Henüz ürün yok"),):
      ListView.builder(
        itemCount: _menuItems.length,
        itemBuilder: (context, index){
          Map<String, dynamic> item = _menuItems[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(item['name']),
              subtitle: Text('${item['price']} ₺ - ${item['description']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.green,),
                    onPressed: () => _showForm(id: item['id'])
                  ),
                  IconButton(
                      icon: Icon(Icons.delete, color: Colors.red,),
                      onPressed: () => _deleteItem(item['id'])
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(),
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showForm({int? id}) async {
    if(id != null){
      Map<String, dynamic> existing = _menuItems.firstWhere((item) => item['id'] == id);
      _nameController.text = existing['name'];
      _priceController.text = existing['price'].toString();
      _descController.text = existing['description'];
    }
    else{
      _nameController.clear();
      _priceController.clear();
      _descController.clear();
    }
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Yeni Ürün Ekle"),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Ürün Adı"),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: "Fiyat (₺)"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _descController,
              decoration: InputDecoration(labelText: "Açıklama"),
            ),
          ],
        ),

        actions: [
          TextButton(
            child: Text("Kaydet"),
            onPressed: () async {

              Map<String, dynamic> item = {
                'name' : _nameController.text,
                'price': double.tryParse(_priceController.text) ?? 0,
                'description': _descController.text

              };

              if(id == null){
                await dbHelper.insertItem(item);
              }
              else{
                item['id'] = id;
                await dbHelper.updateItem(item);
              }

              Navigator.pop(context);

              _refreshMenu();
            },
          )
        ],

      )
    );
  }

  Future<void> _refreshMenu() async {
    List<Map<String, dynamic>> data = await dbHelper.getItems();
    setState(() {
      _menuItems = data;
    });
  }

  Future<void> _deleteItem(int id) async {
    await dbHelper.deleteItem(id);
    _refreshMenu();
  }
}
