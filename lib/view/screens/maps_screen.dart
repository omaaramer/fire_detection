import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Maps")),
      body: const Center(
          child: Text(
        "Google maps",
        style: TextStyle(fontSize: 50),
      )),
    );
  }
}
