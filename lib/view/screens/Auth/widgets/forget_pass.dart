import 'package:flutter/material.dart';

class CustomForgotPassText extends StatelessWidget {
  const CustomForgotPassText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        alignment: Alignment.topRight,
        child: const Text(
          "Forgot Password ?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
