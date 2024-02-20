import 'package:chat_app/view/screens/home_page.dart';
import 'package:flutter/material.dart';
import '../view/screens/landing_screen.dart';
import '../view/screens/login_page.dart';
import '../view/screens/regester_screen.dart';
import '../view/screens/safety_screen.dart';

class AppRouter {
  Route? generateRout(RouteSettings settings) {
    switch (settings.name) {
      // FirebaseAuth.instance.currentUser != null &&
      //         FirebaseAuth.instance.currentUser!.emailVerified
      //     ? HomePage.id
      //     : LoginScreen.id
      case "/":
        return MaterialPageRoute(builder: (_) => const LandingScreen()
            // MainNavigator()
            );
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
