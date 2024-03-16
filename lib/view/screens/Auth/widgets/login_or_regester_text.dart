import 'package:flutter/material.dart';

class LoginOrRegesterText extends StatelessWidget {
  final String text;
  const LoginOrRegesterText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
