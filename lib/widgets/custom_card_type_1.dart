import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
      const ListTile(
        leading: Icon(Icons.account_circle, color: AppTheme.primary),
        title: Text('Card 1'),
        subtitle: Text('Sint velit anim nostrud ullamco fugiat dolore veniam veniam sint veniam qui commodo.'),
        trailing: Icon(Icons.keyboard_arrow_right, color: AppTheme.primary),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: (){}, 
              child: const Text('Cancel'),
              /* style: TextButton.styleFrom(
                primary: AppTheme.primary
              ), */
              ),
            TextButton(
              onPressed: (){}, 
              child: const Text('Ok')
              )
          ],
        ),
      )
      ]),
    );
  }
}