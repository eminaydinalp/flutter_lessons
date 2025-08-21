import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            "assets/cat.jpg",
            width: 200,
            height: 200,
          ),
          Image.network(
            "https://picsum.photos/200",

          ),
          
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("assets/cat.jpg"),
          ),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage("https://picsum.photos/200"),
          )
        ],
      ),
    );
  }
}
