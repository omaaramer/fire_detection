import 'package:chat_app/constants/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'custom_drawer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.settings,
                color: Color(0xff00b7e7),
                size: 30,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }),
          backgroundColor: kGrey,
          title: const Text(
            "Settings",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
      body: Center(
        child: Lottie.asset("assets/json_images/settings.json"),
      ),
    );
  }
}
