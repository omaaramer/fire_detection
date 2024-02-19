import 'package:chat_app/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/google_nav_bar.dart';
import 'safety_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const GoogleNavBar(),
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () async {
              //googleSign out
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              //email sign out
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginScreen.id, (route) => false);
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      // body:
      //  PageView(
      //   controller: _pageController,
      //   onPageChanged: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      //   children: const [
      //     SafetyScreen(),
      //   ],
      // ),
    );
  }
}
