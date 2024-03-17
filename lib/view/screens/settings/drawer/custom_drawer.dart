import 'package:chat_app/app_images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'custom_waiting_circule.dart';
import 'drawer_body.dart';
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
                return const CustomCircule();
              }

              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                if (snapshot.data!.docs.last["id"] ==
                    FirebaseAuth.instance.currentUser!.uid) {
                  if (snapshot.hasData) {
                    return DrawerBody(
                      name: snapshot.data!.docs.last["full_name"],
                      email: snapshot.data!.docs.last["email"],
                      phone: snapshot.data!.docs.last["phone"],
                      address: snapshot.data!.docs.last["address"],
                      image: snapshot.data!.docs.last["url"],
                    );
                  }
                }
              }

              var user = FirebaseAuth.instance.currentUser;

              var displayName = user!.displayName;
              var email = user.email;
              var photoURL = user.photoURL;

              return DrawerBody(
                name: displayName!,
                email: email!,
                image: photoURL!,
                phone: 'Phone Number',
                address: 'Your Address',
              );
            },
          ),
        ),
      ),
    );
  }

  Future<QuerySnapshot> getuserData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    QuerySnapshot snapshot = await users
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    return snapshot;
  }
}
