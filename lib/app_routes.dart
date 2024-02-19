import 'package:chat_app/screens/home_page.dart';
import 'package:flutter/material.dart';

import 'screens/landing_screen.dart';
import 'screens/login_page.dart';
import 'screens/main_navigator.dart';
import 'screens/regester_screen.dart';
import 'screens/safety_screen.dart';

class AppRouter {
  Route? generateRout(RouteSettings settings) {
    switch (settings.name) {
      // FirebaseAuth.instance.currentUser != null &&
      //         FirebaseAuth.instance.currentUser!.emailVerified
      //     ? HomePage.id
      //     : LoginScreen.id
      case "/":
        return MaterialPageRoute(builder: (_) => const MainNavigator());
      case HomePage.id:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case LoginScreen.id:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case SginInScreen.id:
        return MaterialPageRoute(builder: (_) => const SginInScreen());
      case LandingScreen.id:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case SafetyScreen.id:
        return MaterialPageRoute(builder: (_) => const SafetyScreen());
    }
  }
}
