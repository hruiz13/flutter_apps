import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.green[900],
              child: const Text('HR')
            ),
          )
        ],
      ),
      body: const Center(
         child: CircleAvatar(
          maxRadius: 100,
          backgroundImage: NetworkImage('https://hruiz13.github.io/CV-Hruiz/imagenes/hruiz.jpg'),
         ),
      ),
    );
  }
}