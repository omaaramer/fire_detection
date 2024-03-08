import 'package:flutter/material.dart';

class CustomNavEditProfile extends StatelessWidget {
  const CustomNavEditProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7),
      child: Row(
        children: [
          const Text(
            'Edit Profile',
            // style: Theme.of(context).textTheme.headline1,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.close,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
