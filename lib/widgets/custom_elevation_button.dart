import 'package:flutter/material.dart';

class CustomElevationButton extends StatelessWidget {
  final Icon icon;
  final void Function() onPressed;
  const CustomElevationButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: const BorderSide(
                    color: Colors.white,
                    width: 3,
                    strokeAlign: 3,
                  ))),

          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
          backgroundColor: MaterialStateProperty.all(
              Colors.cyan.withOpacity(.7)), // <-- Button color
          overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
            if (states.contains(MaterialState.pressed)) return Colors.cyan;
            // <-- Splash color
            return null;
          }),
        ),
        child: icon);
  }
}
