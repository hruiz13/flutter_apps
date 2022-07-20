import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
   
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double _widht = 100;
  double _height = 100;
  Color _color = Colors.cyan;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  void changeShape(){
    final random = Random();
    setState((){
      _widht = random.nextInt(300).toDouble()+70;
      _height = random.nextInt(300).toDouble()+70;
      _color = Color.fromRGBO(
        random.nextInt(255), 
        random.nextInt(255), 
        random.nextInt(255),
        1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble()+10);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),
      body: Center(
         child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
            width: _widht,
            height: _height,
            //color: Colors.red
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: _color,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 2
                )
              ]
            ),
          ),
         ),
      floatingActionButton: FloatingActionButton(
          onPressed: changeShape,
          child: const Icon(Icons.play_circle_outline, size: 45,),
        )
      );
  }
}