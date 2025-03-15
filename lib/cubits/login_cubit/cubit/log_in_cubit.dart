import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
 
  Future<void> logInUser(String? email, String? password) async {
    emit(LogInLoading());
    try {
      final _ = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      emit(LogInSucsses());
    } on FirebaseAuthException catch (e) {
      emit(LogInFailure(errorMessage: e.code));
    }
  }

 
}
