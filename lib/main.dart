import 'package:ekas/configs/routes.config.dart';
import 'package:ekas/injection.dart' as di;
import 'package:ekas/presentation/bloc/invoice_bloc.dart';
import 'package:ekas/presentation/landing/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //var doc = await path.getApplicationDocumentsDirectory();
  di.init();
  // Hive.init(doc.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<InvoiceBloc>()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
        initialRoute: LandingPage.ROUTE_NAME,
        onGenerateRoute: RouteConfig.generateRoute,
      ),
    );
  }
}
