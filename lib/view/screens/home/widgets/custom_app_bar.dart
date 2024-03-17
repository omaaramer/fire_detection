import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onPressed;
  const CustomAppBar({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'FIREGUARD',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
            onPressed: onPressed,
            icon: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black.withOpacity(.2),
              ),
              child: const Icon(
                Icons.fireplace_outlined,
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}
