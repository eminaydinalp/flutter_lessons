import 'package:first_project/Lists/product.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {

  Product product;

  ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ürünün İsmi : ${product.name}", style: TextStyle(fontSize: 24),),
            Text("Ürünün Fiyatı : ${product.price}", style: TextStyle(fontSize: 24),),
          ],
        ),
      ),
    );
  }
}
