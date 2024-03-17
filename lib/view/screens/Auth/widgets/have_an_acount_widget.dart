import 'package:flutter/material.dart';

class HaveAnAount extends StatelessWidget {
  final String questionText, navigateText;
  final void Function() onPressed;
  const HaveAnAount(
      {super.key,
      required this.questionText,
      required this.navigateText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            navigateText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
