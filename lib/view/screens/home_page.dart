import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../app_images.dart';
import '../../constants/constants.dart';

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
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: kGrey900,
        //     gradient: LinearGradient(
        //   colors: [
        //     kGrey300,
        //     kGrey,
        //   ],
        //   begin: FractionalOffset.topCenter,
        //   end: FractionalOffset.bottomCenter,
        // ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
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
              Expanded(
                  child: ListTile(
                title: const Text(
                  "Hi Omar Amer",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  "Welcome back",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              )),
            ],
          ),
          const SizedBox(height: 100),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Current State ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Spacer(flex: 1),
                Text(
                  "Safe",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.safety_check,
                  size: 30,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          // Image.asset(
          //   Assets.imagesSafe,
          //   scale: 2,
          // )

          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.safety_check,
                size: 250,
                color: Colors.green,
              )),
        ],
      ),
    ));
  }
}
