import '../widgets/custom_slide_action.dart';
import 'Auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import 'Auth/widgets/logo_text.dart';
import 'main_navigator.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  static const String id = "/";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LandingPageBody(),
    );
  }
}

class LandingPageBody extends StatelessWidget {
  const LandingPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          kGrey,
          kGrey900,
        ],
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 25),
          const Column(
            children: [
              SizedBox(height: 10),
              Logo(
                color: kYallow,
              ),
            ],
          ),
          const SizedBox(height: 250),
          const CustomSlideAction(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      FirebaseAuth.instance.currentUser != null &&
                              FirebaseAuth.instance.currentUser!.emailVerified
                          ? MainNavigator.id
                          : LoginScreen.id,
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.white,
                    size: 30,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
