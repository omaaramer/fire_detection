import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomButtun extends StatelessWidget {
  const CustomButtun({super.key, required this.text, this.onTap});
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            // color: Colors.black.withOpacity(.8),
            color: kGrey700,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: kYallow,
                fontSize: 20,
              ),
            ),
          )),
    );
  }
}
