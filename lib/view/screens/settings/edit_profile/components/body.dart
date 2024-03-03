import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/widgets.dart';

import 'image_picker.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: (40),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7, right: 7),
            child: Row(
              children: [
                const Text(
                  'Edit Profile',
                  // style: Theme.of(context).textTheme.headline1,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.close,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: (25),
          ),
          Center(
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
                    // style: Theme.of(context).textTheme.headline1,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: (15),
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    dashPattern: const [7, 7],
                    color: Colors.black38,
                    strokeWidth: 2,
                    // padding: EdgeInsets.fromLTRB(115, 37, 115, 37),
                    padding: const EdgeInsets.fromLTRB((75), (25), (75), (25)),
                    child: const UploadImage(),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: (20),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                    nameController: nameController,
                    hint: 'Your full name',
                    icon: (Icons.person)),
                const SizedBox(height: (20)),
                CustomTextFormField(
                  nameController: nameController,
                  hint: 'Your Address',
                  icon: (Icons.home),
                ),
                const SizedBox(height: (20)),
                CustomTextFormField(
                  nameController: nameController,
                  hint: 'Your Email',
                  icon: (Icons.email_outlined),
                ),
                const SizedBox(height: (20)),
                CustomTextFormField(
                  nameController: nameController,
                  hint: 'Your Phone',
                  icon: (Icons.phone),
                ),
                const SizedBox(height: (20)),
              ],
            ),
          ),
          const SizedBox(
            height: (20),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: (40),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                  child: Text(
                'Save Changes',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final IconData icon;
  const CustomTextFormField({
    super.key,
    required this.nameController,
    required this.hint,
    required this.icon,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: nameController,
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      validator: (value) {
        if (value!.isEmpty || value.trim().isEmpty) {
          return 'Field is required';
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
