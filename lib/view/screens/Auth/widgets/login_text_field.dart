import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
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
    return TextFormField(
      cursorColor: Colors.white,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      // obscureText: obscureText!,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter some text";
        }

        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: icon,
        labelText: label,
        labelStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
