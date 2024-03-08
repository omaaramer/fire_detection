import 'package:chat_app/constants/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'drawer/custom_drawer.dart';
import 'edit_profile/components/body.dart';

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
        title: Row(
          children: [
            const Text("Settings",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, EditeProfileBody.id);
                },
                child: const Icon(Icons.add)),
          ],
        ),
      ),
      body: Center(
        child: Lottie.asset("assets/json_images/settings.json"),
      ),
    );
  }
}
