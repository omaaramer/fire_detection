import 'package:chat_app/app_images.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_elevation_button.dart';
import '../widgets/logo_text.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  static String id = "landingScreen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LandingPageBody(),
    );
  }
}

class LandingPageBody extends StatelessWidget {
  const LandingPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.imagesFirefighter,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          // opacity: const AlwaysStoppedAnimation(.7),
        ),
        Container(
          color: Colors.black54,
        ),
        Column(
          children: [
            const SizedBox(height: 25),
            Image.asset(
              Assets.imagesFireAlarm,
              height: 100,
              // color: Colors.gr,
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
                    size: 100,
                    color: Colors.black87,
                  ),
                  onPressed: () {},
                ),
                CustomElevationButton(
                  icon: const Icon(
                    Icons.phone,
                    size: 100,
                    color: Colors.black87,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
