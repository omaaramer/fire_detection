import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUserData(String name, address, phone, email, id, url) {
    // Call the user's CollectionReference to add a new user

    return users.add({
      'full_name': name,
      'address': address,
      'phone': phone,
      'email': email,
      // "id": FirebaseAuth.instance.currentUser!.uid,
      "id": id,
      'url': url ?? "none",
      "time": DateTime.now(),
    });
    // .then((value) => print("User Added"))
    // .catchError((error) => print("Failed to add user: $error"));
  }

  Future<QuerySnapshot> getuserData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    QuerySnapshot snapshot = await users
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    return snapshot;
  }
}
