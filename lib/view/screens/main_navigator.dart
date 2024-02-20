import 'package:chat_app/view/screens/alarm.dart';
import 'package:chat_app/view/screens/home_page.dart';
import 'package:chat_app/view/screens/safety_screen.dart';
import 'package:chat_app/view/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});
  static const String id = "/";

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
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade800,
          gap: 8,
          padding: const EdgeInsets.all(12),
          tabMargin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          selectedIndex: _selectedIndex,
          onTabChange: _onItemTapped,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.safety_check,
              text: "Safety",
            ),
            GButton(
              icon: Icons.fireplace_outlined,
              text: "Alarm",
            ),
            GButton(
              icon: Icons.person,
              text: "Me",
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