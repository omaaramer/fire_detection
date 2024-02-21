import 'package:flutter/material.dart';

import '../landing_screen.dart';
import 'login_page.dart';
import 'regester_screen.dart';

class MainLoginNavigator extends StatefulWidget {
  const MainLoginNavigator({super.key});

  @override
  State<MainLoginNavigator> createState() => _MainLoginNavigatorState();
}

class _MainLoginNavigatorState extends State<MainLoginNavigator> {
  // PageController _pageController = PageController();
  // int _selectedIndex = 0;
  final List<Widget> _screens = const [
    LandingScreen(),
    LoginScreen(),
    SginInScreen(),
  ];
  // void _onPageChanged(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _pageController.jumpToPage(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _screens,
      ),
    );
  }
}
