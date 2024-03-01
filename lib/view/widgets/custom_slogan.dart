import 'package:flutter/material.dart';

class CustomSlogan extends StatelessWidget {
  const CustomSlogan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
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
    );
  }
}
