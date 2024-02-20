import 'package:chat_app/app_images.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/custom_elevation_button.dart';
import '../widgets/logo_text.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  static const String id = "landingScreen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LandingPageBody(),
    );
  }
}

class LandingPageBody extends StatelessWidget {
  const LandingPageBody({super.key});
  final String url = "https://www.youtube.com/";
  final String _phoneNumber = "911";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.cyan[300]!,
          Colors.black87,
        ],
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
      )),
      child: Column(
        children: [
          const SizedBox(height: 25),
          Image.asset(
            Assets.imagesFireAlarm,
            height: 100,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          const LogoText(),
          const SizedBox(height: 250),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevationButton(
                icon: const Icon(
                  Icons.phone,
                  size: 70,
                  color: Colors.black87,
                ),
                onPressed: () async {
                  if (await canLaunchUrlString(url)) {
                    final call = 'tel:$_phoneNumber';
                    await launchUrlString(call);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
