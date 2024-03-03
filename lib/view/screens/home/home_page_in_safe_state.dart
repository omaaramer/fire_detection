import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePageInSafeState extends StatelessWidget {
  const HomePageInSafeState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
        const SizedBox(height: 100),
        Lottie.asset("assets/json_images/stay_safe.json", height: 300),
        const SizedBox(height: 40),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Be Safe ",
              style: TextStyle(
                fontSize: 25,
                color: Colors.lightGreen,
                fontWeight: FontWeight.bold,
                fontFamily: "Rubik",
              ),
            ),
            Text(
              "Be Controller",
              style: TextStyle(
                fontSize: 25,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontFamily: "Rubik",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
