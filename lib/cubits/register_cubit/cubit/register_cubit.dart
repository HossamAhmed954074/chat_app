import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

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
