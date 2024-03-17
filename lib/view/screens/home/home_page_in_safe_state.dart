import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../widgets/custom_slogan.dart';

class HomePageInSafeState extends StatelessWidget {
  const HomePageInSafeState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Lottie.asset("assets/json_images/stay_safe.json", height: 300),
        const SizedBox(height: 10),
        const CustomSlogan(),
      ],
    );
  }
}
