import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GoogleNavBar extends StatefulWidget {
  const GoogleNavBar({super.key});

  @override
  State<GoogleNavBar> createState() => _GoogleNavBarState();
}

class _GoogleNavBarState extends State<GoogleNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;

            // switch (_selectedIndex) {
            //   case 0:
            //     Navigator.pushNamed(context, HomePage.id);
            //     break;
            //   case 1:
            //     Navigator.pushNamed(context, SafetyScreen.id);
            //     break;
            // }
          });
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
