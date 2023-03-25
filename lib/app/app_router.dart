import 'package:flutter/material.dart';
import 'package:life_cycle/home_pageLife.dart';
import 'package:life_cycle/pages/SignUpPage.dart';

class MyRoutes {
  static const init = '/';
  static const home = '/home';
  static const register = 'register';

  static Route? onGenerateRoute(RouteSettings settings, bool isRegister) {
    switch (settings.name) {
      case init:
        return MaterialPageRoute(
          builder: (_) => isRegister ? const HomePage() : SignUpPage(),
        );
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case register:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      default:
        return MaterialPageRoute(builder: (_) => SignUpPage());
    }
  }
}
