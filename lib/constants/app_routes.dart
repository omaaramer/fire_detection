import 'package:chat_app/view/screens/home_page.dart';
import 'package:flutter/material.dart';
import '../view/screens/landing_screen.dart';
import '../view/screens/regesteration/login_page.dart';
import '../view/screens/main_navigator.dart';
import '../view/screens/regesteration/main_login_navigator.dart';
import '../view/screens/regesteration/regester_screen.dart';
import '../view/screens/safety_screen.dart';

class AppRouter {
  Route? generateRout(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const MainLoginNavigator());
      case HomePage.id:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case LoginScreen.id:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case SginInScreen.id:
        return MaterialPageRoute(builder: (_) => const SginInScreen());
      case MainNavigator.id:
        return MaterialPageRoute(builder: (_) => const MainNavigator());
      case SafetyScreen.id:
        return MaterialPageRoute(builder: (_) => const SafetyScreen());
      // case LandingScreen.id:
      //   return MaterialPageRoute(builder: (_) => const LandingScreen());
    }
  }
}
