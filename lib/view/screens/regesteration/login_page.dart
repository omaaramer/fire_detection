// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/view/screens/main_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../constants/app_images.dart';
import '../../../constants/constants.dart';
import '../../../helper/show_snakbar.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/custom_social_botton.dart';
import '../../widgets/have_an_acount_widget.dart';
import '../../widgets/login_or_regester_text.dart';
import '../../widgets/login_text_field.dart';
import '../../widgets/custom_buttun.dart';
import '../../widgets/logo_text.dart';
import '../home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'regester_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? email, password;
  bool isLoading = false;
  var _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              kGrey,
              kGrey300,
            ],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formkey,
              child: ListView(
                children: [
                  const SizedBox(height: 25),
                  Image.asset(
                    Assets.imagesFireAlarm,
                    height: 100,
                    color: kYallow,
                  ),
                  const SizedBox(height: 10),
                  const LogoText(),
                  const SizedBox(height: 30),
                  const LoginOrRegesterText(
                    text: 'LOGIN',
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    icon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person_2_outlined,
                        color: Colors.white,
                      ),
                    ),
                    label: 'Username',
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    icon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: _obscureText
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.white,
                            ),
                    ),
                    obscureText: _obscureText,
                    label: 'Password',
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (email == null) {
                        customShowSnalBar(context, 'Please enter your email..');
                        return;
                      }
                      try {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email!);
                        customShowSnalBar(context, 'check your email..');
                      } catch (e) {
                        customShowSnalBar(
                            context, 'There is no user for this email');
                      }
                    },
                    child: const CustomForgotPassText(),
                  ),
                  const SizedBox(height: 30),
                  CustomButtun(text: 'LOGIN', onTap: logInValidation),
                  const SizedBox(height: 10),
                  const CustomDivider(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomSocialBotton(
                        text: '   Google',
                        image: Assets.imagesGoogle,
                        onTap: () {
                          signInWithGoogle();
                        },
                      ),
                      CustomSocialBotton(
                        text: '  Facebook',
                        image: Assets.imagesFacebook,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  HaveAnAount(
                    questionText: 'Don\'t have an account?',
                    navigateText: '  Create Now',
                    onTap: () {
                      Navigator.pushNamed(context, SginInScreen.id);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> userLogin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  void logInValidation() async {
    if (formkey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      try {
        await userLogin();

        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          Navigator.pushNamed(context, MainNavigator.id, arguments: email);
        } else {
          customShowSnalBar(context, 'verify your email, and try again');
        }
      } on FirebaseAuthException catch (e) {
        String message = "error";
        if (e.code == 'user-not-found') {
          message = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          message = 'Wrong password provided for that account.';
        }
        customShowSnalBar(context, message);

        // TextField(
        //   decoration: InputDecoration(errorText: message),
        // );
      } catch (e) {
        const TextField(
          decoration:
              InputDecoration(errorText: 'there was an error, try again'),
        );
      }
    }
    isLoading = false;
    setState(() {});
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential

    await FirebaseAuth.instance.signInWithCredential(credential);
    return Navigator.of(context).pushNamedAndRemoveUntil(
        MainNavigator.id, (route) => false,
        arguments: email);
  }
}

class CustomForgotPassText extends StatelessWidget {
  const CustomForgotPassText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        alignment: Alignment.topRight,
        child: const Text(
          "Forgot Password ?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
