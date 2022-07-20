import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider and checks'),
      ),
      body: Column(
         children: [
      
          Slider.adaptive(
            min: 50,
            max: 400,
            activeColor: AppTheme.primary,
            //divisions: 10,
            value: _sliderValue, 
            onChanged: _checkValue 
            ? (value){
              setState(() {
                _sliderValue = value;
              });
            }
            : null
          ),

          Checkbox(
            value: _checkValue, 
            onChanged: (value){
              setState(() {
              _checkValue = value ?? false;
              });
            }
          ),

          CheckboxListTile(
            title: const Text('Habilitar slider'),
            activeColor: AppTheme.primary,
            value: _checkValue, 
            onChanged: (value)=> setState(() {
              _checkValue = value ?? false;
            }),
          ),

          Switch(
            value: _checkValue, 
            onChanged: (value)=> setState(() {
              _checkValue = value;
            }),
          ),

          SwitchListTile(
            title: const Text('Habilitar slider'),
            activeColor: AppTheme.primary,
            value: _checkValue, 
            onChanged: (value)=> setState(() {
              _checkValue = value;
            }),
          ),

          SwitchListTile.adaptive(
            title: const Text('Habilitar slider'),
            activeColor: AppTheme.primary,
            value: _checkValue, 
            onChanged: (value)=> setState(() {
              _checkValue = value;
            }),
          ),

          const AboutListTile(),
      
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage('https://picsum.photos/id/12/500/500'),
                fit: BoxFit.cover,
                width: _sliderValue,
              ),
            ),
          )
      
         ],
      ),
    );
  }
}