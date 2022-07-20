import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {

  final options = const['GTA', 'Fallguys','Fortnite','Minecraft','Rocket League'];
   
  const Listview2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Tipo 2')
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(options[index]),
          //opcion de traer el color del theme sin importar
          trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).primaryColor ),
          onTap: (){
            print(options[index]);
          },
        ),
        separatorBuilder: (context, index) => const Divider(),
        )
    );
  }
}