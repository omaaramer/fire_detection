import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/custom_slide_action.dart';
import '../../widgets/custom_slogan.dart';

class HomePageInFireState extends StatelessWidget {
  const HomePageInFireState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Lottie.asset("assets/json_images/fire_state.json", height: 200),
            const SizedBox(height: 10),
            const CustomSlogan(),
          ],
        ),
        const CustomSlideAction(),
      ],
    );
  }
}
