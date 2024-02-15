import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GoogleNavBar extends StatefulWidget {
  const GoogleNavBar({super.key});

  @override
  State<GoogleNavBar> createState() => _GoogleNavBarState();
}

class _GoogleNavBarState extends State<GoogleNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.amber,
        tabBackgroundColor: Colors.grey.shade800,
        gap: 8,
        padding: const EdgeInsets.all(12),
        tabMargin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        onTabChange: (index) {
          print(index);
        },
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
    );
  }
}
