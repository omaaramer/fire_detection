import 'package:flutter/material.dart';

import '../../app_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('FIREGUARD'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      Assets.imagesOmaar,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Expanded(
                    child: ListTile(
                  title: Text(
                    "Hi Omar Amer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("Welcome back"),
                ))
              ],
            ),
          ],
        ));
  }
}
