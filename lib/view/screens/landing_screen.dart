import '../../constants/app_images.dart';
import '../widgets/custom_slide_action.dart';
import 'regesteration/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../constants/constants.dart';
import 'regesteration/widgets/logo_text.dart';
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
          Column(
            children: [
              Image.asset(
                Assets.imagesFireAlarm,
                height: 100,
                color: kYallow,
              ),
              const SizedBox(height: 10),
              const LogoText(),
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
