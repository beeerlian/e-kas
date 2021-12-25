import 'package:ekas/presentation/home/pages/home_page.dart';
import 'package:ekas/presentation/incomes/pages/incomes_page.dart';
import 'package:ekas/presentation/input_ivoice/pages/input_invoice.dart';
import 'package:ekas/presentation/landing/pages/landing_page.dart';
import 'package:ekas/presentation/outcome/pages/outcome_page.dart';
import 'package:flutter/material.dart';

class RouteConfig {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var argument = settings.arguments;

    switch (settings.name) {
      case LandingPage.ROUTE_NAME:
        return goTo(const LandingPage());
      case HomePage.ROUTE_NAME:
        return goTo(const HomePage());
      case Inputinvoice.ROUTE_NAME:
        return goTo(const Inputinvoice());
      case IncomesPage.ROUTE_NAME:
        return goTo(const IncomesPage());
      case OutcomesPage.ROUTE_NAME:
        return goTo(const OutcomesPage());
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
