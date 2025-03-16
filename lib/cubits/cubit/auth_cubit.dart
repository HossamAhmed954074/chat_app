import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

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

  
  Future<void> registerUser(String? email, String? password) async {
    emit(RegisterLoading());
    try {
      final _ = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      emit(RegisterSuccsess());
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailure(errorMessage: e.code));
    }
  }
}
