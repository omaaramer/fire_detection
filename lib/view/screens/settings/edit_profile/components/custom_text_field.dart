// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.icon,
    this.onChanged,
    required this.mycontroller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field can not be empity";
        }

        return null;
      },
      cursorColor: Colors.black12,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        icon: Container(
          height: 50,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        // prefixIcon: Icon(Icons.person, size: 25, color: Colors.grey,),
        // contentPadding: EdgeInsets.only(left: 30),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        enabled: true,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
      ),
    );
  }
}
