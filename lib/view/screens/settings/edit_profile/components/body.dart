import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../drawer/custom_drawer.dart';
import 'custom_button.dart';
import 'custom_nav_edit_profile.dart';
import 'custom_text_field.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'custom_upload_widget.dart';

class EditeProfileBody extends StatefulWidget {
  static const String id = 'EditeProfileBody';
  const EditeProfileBody({super.key});

  @override
  State<EditeProfileBody> createState() => _EditeProfileBodyState();
}

class _EditeProfileBodyState extends State<EditeProfileBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addrController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? name, phone, address, email;
  final _formKey = GlobalKey<FormState>();
  File? _image;
  String? url;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: ListView(
            children: [
              const SizedBox(height: (40)),
              const CustomNavEditProfile(),
              const SizedBox(height: (25)),
              CustomUploadWidget(
                url: url,
                onTap: () async {
                  await getImageFromGallery();
                },
                onPressed: () async {
                  await getImageFromGallery();
                  // Save Image to some storage
                },
              ),
              const SizedBox(height: (20)),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      mycontroller: nameController,
                      hint: 'Your full name',
                      icon: (Icons.person),
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    const SizedBox(height: (20)),
                    CustomTextFormField(
                      mycontroller: addrController,
                      hint: 'Your Address',
                      icon: (Icons.home),
                      onChanged: (value) {
                        address = value;
                      },
                    ),
                    const SizedBox(height: (20)),
                    CustomTextFormField(
                      mycontroller: emailController,
                      hint: 'Your Email',
                      icon: (Icons.email_outlined),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(height: (20)),
                    CustomTextFormField(
                      mycontroller: phoneController,
                      hint: 'Your Phone',
                      icon: (Icons.phone),
                      onChanged: (value) {
                        phone = value;
                      },
                    ),
                    const SizedBox(height: (20)),
                  ],
                ),
              ),
              const SizedBox(height: (20)),
              CustomButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    addUserData();
                    Navigator.pushReplacementNamed(context, CustomDrawer.id);
                  }
                },
                text: 'Save Changes',
              ),
            ],
          ),
        ),
      ),
    );
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUserData() {
    // Call the user's CollectionReference to add a new user

    return users
        .add({
          'full_name': name,
          'address': address,
          'phone': phone,
          'email': email,
          "id": FirebaseAuth.instance.currentUser!.uid,
          'url': url ?? "none",
          "time": DateTime.now(),
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  final ImagePicker _picker = ImagePicker();
  Future getImageFromGallery() async {
    XFile? imageFromGallery =
        await _picker.pickImage(source: ImageSource.gallery);

    if (imageFromGallery == null) return;
    _image = File(imageFromGallery.path);
    var imagename = basename(imageFromGallery.path);
    var refStorage = FirebaseStorage.instance.ref("profileImages/$imagename");
    await refStorage.putFile(_image!);
    url = await refStorage.getDownloadURL();
    setState(() {});
  }
}
