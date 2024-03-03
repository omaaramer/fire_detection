import 'package:flutter/material.dart';

import 'components/body.dart';

class EditProfile extends StatelessWidget {
  static const String id = '/edit-profile';
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: const Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        body: Body(),
      ),
    );
  }
}