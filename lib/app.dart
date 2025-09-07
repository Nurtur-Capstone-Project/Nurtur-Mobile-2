import 'package:flutter/material.dart';
import 'core/di.dart';
import 'routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  static Future<void> setup() async {
    await DI.setup();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nurtur App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
