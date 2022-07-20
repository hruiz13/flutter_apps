import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {

  final options = const['GTA', 'Fallguys','Fortnite','Minecraft','Rocket League'];
   
  const Listview1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Tipo 1')
      ),
      body: ListView(
        children: [
          ...options.map((game)=> ListTile( 
            title: Text(game),
            trailing: const Icon(Icons.keyboard_arrow_right),
           )).toList(),
          /* ListTile(
            leading: Icon( Icons.accessibility_new),
            title: Text('Hola mundo'),
          ) */
        ],
      ),
    );
  }
}