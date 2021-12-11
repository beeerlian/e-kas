import 'package:ekas/presentation/home/pages/home_page.dart';
import 'package:ekas/presentation/landing/pages/landing_page.dart';
import 'package:flutter/material.dart';

class RouteConfig {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var argument = settings.arguments;

    switch (settings.name) {
      case LandingPage.ROUTE_NAME:
        return goTo(const LandingPage());
      case HomePage.ROUTE_NAME:
        return goTo(const HomePage());
    }

    return goTo(const Scaffold(
      body: Center(
        child: Text("Page not found 404"),
      ),
    ));
  }

  static MaterialPageRoute goTo(screen) {
    return MaterialPageRoute(builder: (context) => screen);
  }
}
