import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../drawer/custom_drawer.dart';
import 'custom_nav_edit_profile.dart';
import 'custom_text_field.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: (40)),
          const CustomNavEditProfile(),
          const SizedBox(height: (25)),
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
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(spreadRadius: 6, color: Colors.black38),
                          ]),
                      child: url == null
                          ? IconButton(
                              icon: const Icon(
                                Icons.upload_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () async {
                                await getImageFromGallery();
                                // Save Image to some storage
                              },
                            )
                          : InkWell(
                              onTap: () async {
                                await getImageFromGallery();
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(35),
                                child: Image.network(
                                  url!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                  )
                ],
              ),
            ),
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
          const SizedBox(
            height: (20),
          ),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                addUserData();
              }

              Navigator.pushReplacementNamed(context, CustomDrawer.id);
              // print("user added");
            },
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

  //TODO uplode user info to firestore

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUserData() {
    // Call the user's CollectionReference to add a new user

    return users.add({
      'full_name': name,
      'address': address,
      'phone': phone,
      'email': email,
      "id": FirebaseAuth.instance.currentUser!.uid,
      'url': url ?? "none",
    }).then((DocumentReference doc) {
      //  doc.id;
    }).catchError((error) => print("Failed to add user: $error"));
  }

  final ImagePicker _picker = ImagePicker();
  Future getImageFromGallery() async {
    XFile? imageFromGallery =
        await _picker.pickImage(source: ImageSource.gallery);

    if (imageFromGallery == null) return;
    _image = File(imageFromGallery.path);
//TODO
    var imagename = basename(imageFromGallery.path);
    var refStorage = FirebaseStorage.instance.ref("profileImages/$imagename");
    await refStorage.putFile(_image!);
    url = await refStorage.getDownloadURL();
    setState(() {});
  }
}
