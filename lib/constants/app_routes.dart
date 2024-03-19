import '../view/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import '../view/screens/Auth/login_page.dart';
import '../view/screens/main_navigator.dart';
import '../view/screens/Auth/main_login_navigator.dart';
import '../view/screens/Auth/regester_screen.dart';
import '../view/screens/safety/safety_screen.dart';
import '../view/screens/settings/drawer/custom_drawer.dart';
import '../view/screens/settings/edit_profile/components/body.dart';
import '../view/screens/settings/edit_profile/edit_profile.dart';
import '../view/screens/settings/setting.dart';

class AppRouter {
  Route? generateRout(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const MainLoginNavigator());
      case HomePage.id:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case LoginScreen.id:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case SginInScreen.id:
        return MaterialPageRoute(builder: (_) => SginInScreen());
      case MainNavigator.id:
        return MaterialPageRoute(builder: (_) => const MainNavigator());
      case SafetyScreen.id:
        return MaterialPageRoute(builder: (_) => const SafetyScreen());
      case EditProfile.id:
        return MaterialPageRoute(builder: (_) => const EditProfile());
      case CustomDrawer.id:
        return MaterialPageRoute(builder: (_) => const CustomDrawer());
      case EditeProfileBody.id:
        return MaterialPageRoute(builder: (_) => const EditeProfileBody());
      case SettingScreen.id:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
    }
  }
}
