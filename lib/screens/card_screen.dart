import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget')
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 10),
          CustomCardType2(imageUrl: 'https://picsum.photos/id/1/200/300', text: 'Aprendiendo flutter'),
          SizedBox(height: 15),
          CustomCardType2(imageUrl: 'https://picsum.photos/id/4/150/300', text: 'Tomo nota de todo'),
          SizedBox(height: 15),
          CustomCardType2(imageUrl: 'https://picsum.photos/id/3/200/300'),
          SizedBox(height: 15),
          CustomCardType2(imageUrl: 'https://picsum.photos/id/12/200/300'),
          SizedBox(height: 100),
        ],
      )
    );
  }
}