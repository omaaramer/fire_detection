import 'package:flutter/material.dart';

import '../../../../app_images.dart';

class Logo extends StatelessWidget {
  final Color? color;
  const Logo({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Image.asset(
              Assets.imagesFireAlarm,
              height: 100,
              color: color ?? Colors.white,
            ),
            const SizedBox(height: 10),
            const Text(
              'FIREGUARD',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
