import 'package:bloc/bloc.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';

part 'fire_state.dart';

class FireCubit extends Cubit<FireState> {
  FireCubit() : super(FireSafeState());

  DatabaseReference currentStateRef =
      FirebaseDatabase.instance.ref(kcurrentstateCollection);

  Future<void> setFireState({required String state}) async {
    await currentStateRef.set({
      'state': state,
    });
  }

  Future<void> updateFireState({required String state}) async {
    await currentStateRef.update({
      'state': state,
    });
  }

  Future<void> getFireState() async {
    currentStateRef.onValue.listen((event) {
      final Map data = event.snapshot.value as Map;
      if (data['state'] == kfirestate) {
        emit(FireWarning());
      } else {
        emit(FireSafeState());
      }
    });
    // currentState.snapshots().listen((event) {
    //   emit(FireWarning());
    //   for (var doc in event.docs) {
    //     if ((doc.data() != null) && doc.data()!['state'] == kfirestate) {
    //       emit(FireWarning());
    //     }
    //   }
    // });
  }
}
