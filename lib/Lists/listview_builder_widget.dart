import 'package:first_project/Lists/product.dart';
import 'package:first_project/Lists/product_detail_page.dart';
import 'package:flutter/material.dart';

class ListviewBuilderWidget extends StatelessWidget {

  final List<Product> _products = [
    Product(id: 1, name: "Masa", price: 20),
    Product(id: 2, name: "TV", price: 2000),
    Product(id: 3, name: "Laptop", price: 10000),
    Product(id: 4, name: "Gömlek", price: 200),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview.builder Widget"),
        backgroundColor: Colors.blue,
      ),

      body: /*ListView.builder(
        itemCount: 1000,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text("Öğe $index"),
              subtitle: Text("Bu bir alt başlıktır."),
              leading: Icon(Icons.star),
              trailing: Text(index.toString()),

            ),
          );
        },

      ),*/

      ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index){
          final product = _products[index];

          return Card(
            child: ListTile(
              title: Text(product.name),
              subtitle: Text(product.price.toString()),
              leading: Icon(Icons.star),
              trailing: Text(product.id.toString()),
              onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductDetailPage(product: product))
                );
              },

            ),
          );
        },
      )
    );
  }
}
