import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Expanded(
          child: Divider(
        color: Colors.white,
        endIndent: 10,
      )),
      Text("OR Continue with"),
      Expanded(
        child: Divider(
          color: Colors.white,
          indent: 10,
        ),
      ),
    ]);
  }
}
