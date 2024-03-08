import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../regesteration/login_page.dart';
import '../edit_profile/edit_profile.dart';

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
      onTap: () {},
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
  Map<String, dynamic> userdata = {};

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    // if (FirebaseAuth.instance.currentUser!.uid){}
    return FutureBuilder<QuerySnapshot>(
      future: users
          .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return SafeArea(
            child: Drawer(
              backgroundColor: Colors.white.withOpacity(.85),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, EditProfile.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.15),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          title: Text(snapshot.data!.docs.last["full_name"]),
                          subtitle: Text(snapshot.data!.docs.last["email"]),
                          leading: SizedBox(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.network(
                                snapshot.data!.docs.last["url"],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
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
                      title: "full name",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black.withOpacity(.2),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.close,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
