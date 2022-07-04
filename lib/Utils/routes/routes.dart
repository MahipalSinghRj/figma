import 'package:figma/Dashboard.dart';
import 'package:figma/Splash.dart';
import 'package:figma/Utils/routes/routes_name.dart';
import 'package:figma/main.dart';
import 'package:flutter/material.dart';
import '../../LoggedScreen.dart';

class Routes {

  static MaterialPageRoute generateRoutes(RouteSettings settings) {

    switch (settings.name) {

      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoggedScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => MyApp());


      case RoutesName.dashboard:
        return MaterialPageRoute(
            builder: (BuildContext context) => Dashboard());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route found'),
            ),
          );
        });
    }
  }
}
