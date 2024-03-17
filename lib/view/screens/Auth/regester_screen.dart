// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:chat_app/business_logic/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../constants/app_images.dart';
import '../../widgets/show_snakbar.dart';
import '../../widgets/custom_buttun.dart';
import 'login_page.dart';
import 'widgets/have_an_acount_widget.dart';
import 'widgets/logo_text.dart';
import 'widgets/signup_text_field.dart';

class SginInScreen extends StatefulWidget {
  static const String id = 'SginInScreen';

  @override
  State<SginInScreen> createState() => _SginInScreenState();
}

class _SginInScreenState extends State<SginInScreen> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? email, password, name, phone, confirmPass;

  bool isLoading = false;

  var _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubitCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is RegesterLoading) {
          isLoading = true;
        } else if (state is RegesterSuccess) {
          Navigator.pushReplacementNamed(context, LoginScreen.id);
          isLoading = false;
        } else if (state is RegesterFailure) {
          customShowSnalBar(context, state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.orange,
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: formkey,
                  child: ListView(
                    children: [
                      const SizedBox(height: 25),
                      const Logo(),
                      const SizedBox(height: 30),
                      CustomTextField(
                        label: 'Full Name',
                        onChanged: (value) {
                          name = value;
                        },
                        icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.person_2_outlined,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        label: 'Email',
                        onChanged: (value) {
                          email = value;
                        },
                        icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.email_outlined,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        label: 'Phone Number',
                        onChanged: (value) {
                          phone = value;
                        },
                        icon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.phone_android_rounded,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: _obscureText
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                ),
                        ),
                        obscureText: _obscureText,
                        label: 'Password',
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: _obscureText
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                ),
                        ),
                        obscureText: _obscureText,
                        label: 'Confirm Password',
                        onChanged: (value) {
                          confirmPass = value;
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomButtun(
                          text: 'Register',
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              if (password != confirmPass) {
                                return customShowSnalBar(
                                    context, 'password does not matching');
                              }
                              BlocProvider.of<AuthCubitCubit>(context)
                                  .userRegester(
                                      email: email!, password: password!);
                            }
                            isLoading = false;
                          }),
                      const SizedBox(height: 10),
                      HaveAnAount(
                        questionText: 'Have an  account ? ',
                        navigateText: 'Sign In',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
