import 'package:chat_app/business_logic/auth_cubit/auth_cubit.dart';
import 'package:chat_app/view/screens/main_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../constants/app_images.dart';
import '../../widgets/show_snakbar.dart';
import 'widgets/custom_divider.dart';
import 'widgets/custom_social_botton.dart';
import 'widgets/forget_pass.dart';
import 'widgets/have_an_acount_widget.dart';
import 'widgets/login_or_regester_text.dart';
import 'widgets/login_text_field.dart';
import '../../widgets/custom_buttun.dart';
import 'widgets/logo_text.dart';
import 'regester_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  const LoginScreen({super.key});

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
    return BlocConsumer<AuthCubitCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, MainNavigator.id);
          isLoading = false;
        } else if (state is LoginFailure) {
          customShowSnalBar(context, state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: formkey,
                child: ListView(
                  children: [
                    const SizedBox(height: 25),
                    const Logo(),
                    const SizedBox(height: 30),
                    const LoginOrRegesterText(
                      text: 'Login',
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
                    GestureDetector(
                      onTap: () async {
                        if (email == null) {
                          customShowSnalBar(
                              context, 'Please enter your email..');
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
                    CustomButtun(
                        text: 'Login',
                        onTap: () async {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<AuthCubitCubit>(context)
                                .userLogin(email: email!, password: password!);
                          }
                        }),
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
                            BlocProvider.of<AuthCubitCubit>(context)
                                .signInWithGoogle(context);
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
                      navigateText: 'Create now',
                      onPressed: () {
                        Navigator.pushNamed(context, SginInScreen.id);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
