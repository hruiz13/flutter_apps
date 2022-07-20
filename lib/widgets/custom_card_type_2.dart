import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class CustomCardType2 extends StatelessWidget {
   
  const CustomCardType2({
    Key? key, 
    required this.imageUrl, 
    this.text
    }) : super(key: key);

  final String imageUrl;
  final String? text;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior:  Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: AppTheme.primary.withOpacity(0.3),
      elevation: 10,
      child: Column(
        children: [
          
          FadeInImage(
            image: NetworkImage( imageUrl ),
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            width: double.infinity,
            height: 230,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
            ),
            if(text != null)
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(right: 30, top: 10, bottom: 10),
              child: Text( text ?? '' )
              )


        ]
    )
    );
  }
}