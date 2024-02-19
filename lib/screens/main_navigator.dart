import 'package:flutter/material.dart';

import '../widgets/google_nav_bar.dart';
import 'home_page.dart';
import 'safety_screen.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});
  static const String id = "/";

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  // PageController _pageController = PageController();
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomePage(),
    const SafetyScreen(),
  ];
  // void _onPageChanged(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // void _onItemTapped(int i) {
  //   setState(() {
  //     _pageController.jumpToPage(i);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: const GoogleNavBar(),
          body: _screens[_selectedIndex]

          // PageView(
          //   controller: _pageController,
          //   onPageChanged: _onPageChanged,
          //   children: _screens,
          //   ),
          ),
    );
  }
}
