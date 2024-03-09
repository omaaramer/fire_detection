import 'package:flutter/material.dart';

import 'custom_dotted_border.dart';

class CustomUploadWidget extends StatelessWidget {
  const CustomUploadWidget({
    super.key,
    required this.url,
    required this.onPressed,
    required this.onTap,
  });
  final void Function() onPressed;
  final String? url;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        decoration: BoxDecoration(
          color: const Color(0xFFBDBDBD).withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.only(
          left: (15),
          top: (15),
          right: (15),
          bottom: (40),
        ),
        child: Column(
          children: [
            const Text(
              'Upload image',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: (15)),
            CustomDottedBorder(
              url: url,
              onPressed: onPressed,
              onTap: onTap,
            )
          ],
        ),
      ),
    );
  }
}
