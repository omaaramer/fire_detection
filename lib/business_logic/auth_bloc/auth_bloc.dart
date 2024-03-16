import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async{
      if(event is RegisterEvant) {
        
    emit(RegesterLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: event.email, password: event.password);
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

      }
    );
  
}
}
