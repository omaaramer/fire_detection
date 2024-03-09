import 'package:flutter/material.dart';

import '../edit_profile/edit_profile.dart';
import 'custom_waiting_circule.dart';

class ProfileListile extends StatelessWidget {
  final String title, subtitle;
  final Image image;

  const ProfileListile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, EditProfile.id);
        },
        child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
              leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: image,
                  )),
            )));
  }
}
