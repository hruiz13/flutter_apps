import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogAndroid (BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert Dialog'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('This is a alert dialog'),
              SizedBox(height: 10),
              FlutterLogo(size: 100)
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close', style: TextStyle(color: Colors.blue)),
            )
          ],
        );
      },
    );
  }
  void displayDialogIOS (BuildContext context){

    showCupertinoDialog(
      context: context, 
      builder: (context){
        return CupertinoAlertDialog(
          title: const Text('Alert Dialog'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('This is a alert dialog'),
              SizedBox(height: 10),
              FlutterLogo(size: 100)
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('Close', style: TextStyle(color: Colors.blue)),
              onPressed: () => Navigator.pop(context)
            ),
            CupertinoDialogAction(
              child: const Text('OK', style: TextStyle(color: Colors.green)),
              onPressed: () => Navigator.pop(context)
            )
          ],
        );
      }
      );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: ElevatedButton(
          /* style: ElevatedButton.styleFrom(
            primary: AppTheme.primary,
            elevation: 0,
            shape: const StadiumBorder()
          ), */
          //onPressed: null,
          onPressed: ()=> Platform.isIOS 
            ? displayDialogIOS(context)
            : displayDialogAndroid(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Mostrar alerta', style: TextStyle(fontSize: 18),),
          ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.backspace_outlined),
        onPressed: () {
            Navigator.pop(context);
        }
      ),
    );
  }
}