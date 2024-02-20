import 'package:flutter/material.dart';

class CustomSocialBotton extends StatelessWidget {
  final String text, image;
  final void Function() onTap;
  const CustomSocialBotton(
      {super.key,
      required this.text,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.8),
          borderRadius: BorderRadius.circular(30)),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(
              image,
              height: 25,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
