import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.label,
      this.onChanged,
      this.obscureText = false,
      this.icon});
  final String? label;
  final IconButton? icon;
  final Function(String)? onChanged;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 60,
      child: TextFormField(
        cursorColor: Colors.white,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        obscureText: obscureText!,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter some text";
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          filled: true,
          fillColor: Colors.black.withOpacity(.6),
          suffixIcon: icon,
          hintText: label,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(.7),
          ),
          focusedBorder: builtBorder(),
          enabledBorder: builtBorder(),
          errorBorder: builtBorder(),
          focusedErrorBorder: builtBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder builtBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );
  }
}
