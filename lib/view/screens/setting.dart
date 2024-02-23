import 'package:chat_app/app_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'regesteration/login_page.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Setting")),
      drawer: Drawer(
          child: ListView(
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
                title: Text("Omar Amer"),
                subtitle: Text("omar1907@gmail.com"),
              ))
            ],
          ),
          ListTile(
            title: const Text("Phone Number"),
            leading: const Icon(Icons.phone),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Acount"),
            leading: const Icon(Icons.account_balance_rounded),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Addres"),
            leading: const Icon(Icons.home),
            onTap: () {},
          ),
          ListTile(
            title: const Text("About"),
            leading: const Icon(Icons.help),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Contact Us"),
            leading: const Icon(Icons.phone_android),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Messeges"),
            leading: const Icon(Icons.message),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Sgin out"),
            leading: const Icon(Icons.exit_to_app),
            onTap: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              //email sign out
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginScreen.id, (route) => false);
            },
          ),
        ],
      )),
      body: const Center(
          child: Text(
        "Setting Screen",
        style: TextStyle(fontSize: 50),
      )),
    );
  }
}
