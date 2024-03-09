import 'package:chat_app/app_images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../regesteration/login_page.dart';
import 'custom_close_button.dart';
import 'profile_listile.dart';

class CustomLisTileForDrawer extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const CustomLisTileForDrawer(
      {super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(
        icon,
        // color: Color(0xff151565),
      ),
      onTap: onTap,
    );
  }
}

class CustomDrawer extends StatefulWidget {
  static const String id = 'CustomDrawer';

  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  // final String documentId;
  Future<QuerySnapshot> getuserData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    QuerySnapshot snapshot = await users
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    return snapshot;
  }

  @override
  Widget build(BuildContext context) {
    // if (FirebaseAuth.instance.currentUser!.uid){}
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white.withOpacity(.85),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: FutureBuilder<QuerySnapshot>(
            future: getuserData(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(color: Color(0xff00b7e7)));
              }

              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                if (snapshot.data!.docs.last["id"] ==
                    FirebaseAuth.instance.currentUser!.uid) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        ProfileListile(
                          title: snapshot.data!.docs.last["full_name"],
                          subtitle: snapshot.data!.docs.last["email"],
                          image: Image.network(
                            snapshot.data!.docs.last["url"],
                            fit: BoxFit.cover,
                          ),
                        ),
                        CustomLisTileForDrawer(
                          title: snapshot.data!.docs.last["phone"],
                          icon: Icons.phone,
                        ),
                        CustomLisTileForDrawer(
                          title: snapshot.data!.docs.last["address"],
                          icon: Icons.home,
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
                } else {
                  return ProfileListile(
                    title: "No User Profile",
                    subtitle: 'Add Profile',
                    image: Image.asset(Assets.imagesAddUser),
                  );
                }
              }
              return ProfileListile(
                title: "No User Profile",
                subtitle: 'Add Profile',
                image: Image.asset(Assets.imagesAddUser),
              );
            },
          ),
        ),
      ),
    );
  }
}
