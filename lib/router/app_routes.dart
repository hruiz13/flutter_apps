import 'package:flutter/material.dart';
import 'package:flutter_components/models/models.dart';
import 'package:flutter_components/screens/screens.dart';

class AppRoutes{

  static const String initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(route: 'listview1', icon: Icons.list, name: 'List view screen 1', screen: const Listview1Screen()),
    MenuOption(route: 'listview2', icon: Icons.list_alt, name: 'List view screen 2', screen: const Listview2Screen()),
    MenuOption(route: 'alert', icon: Icons.bloodtype_outlined, name: 'Alertas - Alerts', screen: const AlertScreen()),
    MenuOption(route: 'card', icon: Icons.browse_gallery_sharp, name: 'Tarjetas - card', screen: const CardScreen()),
    MenuOption(route: 'avatar', icon: Icons.face, name: 'Circle Avatar', screen: const AvatarScreen()),
    MenuOption(route: 'animated', icon: Icons.play_circle_outline_outlined, name: 'Animated Container', screen: const AnimatedScreen()),
    MenuOption(route: 'inputs', icon: Icons.input, name: 'Inputs', screen: const InputScreen()),
    MenuOption(route: 'slider', icon: Icons.social_distance_rounded, name: 'Slider and checks', screen: const SliderScreen()),
    MenuOption(route: 'listview', icon: Icons.build, name: 'InfiniteScrol y pull to refresh', screen: const ListviewBuilderScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> routes() {

    Map<String, Widget Function(BuildContext)> appRoutes = {};
      appRoutes.addAll({'home': (context) => const HomeScreen()});

    for(final menuOption in menuOptions){
      appRoutes.addAll({menuOption.route: (context) => menuOption.screen});
    }
    return appRoutes;
  }

  /* static Map<String, Widget Function(BuildContext)> routes = {
        'home': (context) => const HomeScreen(),
        'listview1': (context) => const Listview1Screen(),
        'listview2': (context) => const Listview2Screen(),
        'card': (context) => const CardScreen(),
        'alert': (context) => const AlertScreen()
      }; */

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => const AlertScreen()
      );
  }

}