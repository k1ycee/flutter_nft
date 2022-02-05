import 'package:epicnfts/utils/routes.dart';
import 'package:epicnfts/views/create_wallet.dart';
import 'package:epicnfts/views/display_mnemonics.dart';
import 'package:epicnfts/views/home.dart';
import 'package:epicnfts/views/memorize_mnemonics.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.GetStartedRoute:
      return _getPageRoute(
          view: CreateEthereumWallet(), routeName: settings.name);
    case Routes.DisplayMnemonicsRoute:
      return _getPageRoute(view: DisplayMnemonics(), routeName: settings.name);
    case Routes.MemorizeMnemonicsRoute:
      return _getPageRoute(view: MemorizeMnemonics(), routeName: settings.name);
    case Routes.HomeRoute:
      return _getPageRoute(view: Home(), routeName: settings.name);
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String? routeName, Widget? view}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => view!,
  );
}

Route animateNavigation(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (_, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
