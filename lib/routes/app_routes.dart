import 'package:flutter/material.dart';
import '../features/auth/presentation/pages/login_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';

  static Map<String, WidgetBuilder> get routes => {
        home: (ctx) => const LoginPage(),
        login: (ctx) => const LoginPage(),
      };
}
