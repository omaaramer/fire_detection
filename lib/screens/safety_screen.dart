import 'package:flutter/material.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});
  static String id = 'SafetyScreen';

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
            child: Text(
          'SafetyScreen',
          style: TextStyle(fontSize: 40),
        )),
      ],
    );
  }
}
