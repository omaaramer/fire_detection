import 'package:flutter/material.dart';

class CustomCircule extends StatelessWidget {
  const CustomCircule({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child:
            CircularProgressIndicator(color: Color.fromARGB(255, 0, 185, 231)));
  }
}
