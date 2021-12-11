import 'package:ekas/configs/routes.config.dart';
import 'package:ekas/presentation/landing/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var doc = await path.getApplicationDocumentsDirectory();
  Hive.init(doc.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      initialRoute: LandingPage.ROUTE_NAME,
      onGenerateRoute: RouteConfig.generateRoute,
    );
  }
}
