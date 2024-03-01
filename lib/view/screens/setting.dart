import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Setting")),
      drawer: const CustomDrawer(),
      body: Center(
        child: Lottie.asset("assets/json_images/settings.json"),
      ),
    );
  }
}
