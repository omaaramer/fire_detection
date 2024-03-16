import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:chat_app/view/screens/main_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'auth_cubit_stat.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit() : super(AuthCubitInitial());

  //login with email and password
  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(
            errorMessage: 'Wrong password provided for that account.'));
      } else {
        emit(LoginFailure(errorMessage: 'there was an error, try again'));
      }
    }
  }

  // signInWithGoogle in login screen
  Future signInWithGoogle(BuildContext context) async {
    emit(LoginLoading());
    // Trigger the authentication flow
    try {
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
      Navigator.pushReplacementNamed(context, MainNavigator.id);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(errorMessage: 'there was an error, try again'));
    }
  }

  // sign in with email and password create emil in register screen
  Future<void> userRegester(
      {required String email, required String password}) async {
    emit(RegesterLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegesterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegesterFailure(
            errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegesterFailure(
            errorMessage: 'The account already exists for that email.'));
      } else {
        emit(RegesterFailure(errorMessage: 'there was an error, try again'));
      }
    }
  }
  // handle obscureText in password text form field in ligin and register screen

  void setobscureText() {
    var obscureText = true;

    obscureText = !obscureText;
    if (obscureText == true) {
      emit(ObscureTextState());
    } else {
      emit(UnobscureTextState());
    }
  }
}
