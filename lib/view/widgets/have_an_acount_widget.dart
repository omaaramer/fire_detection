import 'package:flutter/material.dart';

class HaveAnAount extends StatelessWidget {
  final String questionText, navigateText;
  final void Function() onTap;
  const HaveAnAount(
      {super.key,
      required this.questionText,
      required this.navigateText,
      required this.onTap});

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
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: GestureDetector(
            onTap: onTap,
            child: Text(
              navigateText,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
