import 'package:chat_app/view/screens/setting.dart';
import 'package:chat_app/view/screens/home_page.dart';
import 'package:chat_app/view/screens/safety_screen.dart';
import 'package:chat_app/view/screens/maps_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});
  static const String id = "MainNavigator";

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    HomePage(),
    SafetyScreen(),
    SettingScreen(),
    AlarmScreen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int i) {
    setState(() {
      _pageController.jumpToPage(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: GNav(
          iconSize: 24,
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.amber,
          tabBackgroundColor: Colors.grey.shade800,
          gap: 8,
          padding: const EdgeInsets.all(12),
          tabMargin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          selectedIndex: _selectedIndex,
          onTabChange: _onItemTapped,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "H O M E",
            ),
            GButton(
              icon: Icons.safety_check,
              text: "SAFETY",
            ),
            GButton(
              icon: Icons.fireplace_outlined,
              text: "M A P S",
            ),
            GButton(
              icon: Icons.person,
              text: "SETTINGS",
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: _screens,
        ),
      ),
    );
  }
}
