// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mvvm_demo/util/routes/routes_name.dart';
import 'package:mvvm_demo/view/home_screen.dart';
import 'package:mvvm_demo/view/login_view.dart';
import 'package:mvvm_demo/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No route Defined"),
            ),
          );
        });
    }
  }
}
