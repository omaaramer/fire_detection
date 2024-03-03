import 'package:chat_app/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../app_images.dart';
import '../regesteration/login_page.dart';
import 'edit_profile/edit_profile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: kGrey300,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, EditProfile.id);
                },
                child: Row(
                  children: [
                    SizedBox(
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
                    )),
                  ],
                ),
              ),
              const CustomLisTileForDrawer(
                  title: 'Phone Number',
                  icon: Icon(
                    Icons.phone,
                    color: Color(0xff151565),
                  )),
              const CustomLisTileForDrawer(
                title: 'Acount',
                icon: Icon(Icons.account_balance_rounded),
              ),
              const CustomLisTileForDrawer(
                title: 'Addres',
                icon: Icon(Icons.home),
              ),
              const CustomLisTileForDrawer(
                title: 'About',
                icon: Icon(Icons.help),
              ),
              const CustomLisTileForDrawer(
                title: 'Contact Us',
                icon: Icon(Icons.phone_android),
              ),
              const CustomLisTileForDrawer(
                title: 'Messeges',
                icon: Icon(Icons.message),
              ),
              CustomLisTileForDrawer(
                title: 'Sgin out',
                icon: const Icon(Icons.exit_to_app),
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
          ),
        ));
  }
}

class CustomLisTileForDrawer extends StatelessWidget {
  final String title;
  final Icon icon;
  final void Function()? onTap;
  const CustomLisTileForDrawer(
      {super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: icon,
      onTap: () {},
    );
  }
}
