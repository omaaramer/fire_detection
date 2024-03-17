import 'package:chat_app/view/screens/settings/drawer/custom_waiting_circule.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Auth/login_page.dart';
import '../edit_profile/edit_profile.dart';
import 'custom_close_button.dart';
import 'custom_drawer.dart';
import 'profile_listile.dart';

class DrawerBody extends StatelessWidget {
  final String name, phone, address, email, image;

  const DrawerBody(
      {super.key,
      required this.name,
      required this.phone,
      required this.address,
      required this.email,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileListile(
          title: name,
          subtitle: email,
          image: Image.network(image, fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            return child;
          }, loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return const CustomCircule();
            }
          }),
        ),
        CustomLisTileForDrawer(
          title: phone,
          icon: Icons.phone,
          onTap: () {
            Navigator.pushNamed(context, EditProfile.id);
          },
        ),
        CustomLisTileForDrawer(
          title: address,
          icon: Icons.home,
          onTap: () {
            Navigator.pushNamed(context, EditProfile.id);
          },
        ),
        const CustomLisTileForDrawer(
          title: "Profile",
          icon: Icons.person,
        ),
        const CustomLisTileForDrawer(
          title: 'About',
          icon: Icons.help,
        ),
        CustomLisTileForDrawer(
          title: 'Sgin out',
          icon: Icons.exit_to_app,
          onTap: () async {
            GoogleSignIn googleSignIn = GoogleSignIn();
            googleSignIn.disconnect();
            //email sign out
            await FirebaseAuth.instance.signOut();
            Navigator.pushNamedAndRemoveUntil(
                context, LoginScreen.id, (route) => false);
          },
        ),
        const Spacer(flex: 1),
        const CustomCloseButton()
      ],
    );
  }
}
