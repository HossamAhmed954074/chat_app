import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LogInUser) {
        emit(LogInLoading());
        try {
          final _ = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email!,
            password: event.password!,
          );
          emit(LogInSucsses());
        } on Exception catch (e) {
          emit(LogInFailure(errorMessage: e.toString()));
        }
      } else if (event is RegisterUser) {
        emit(RegisterLoading());
        try {
          final _ = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: event.email!, password: event.password!);
          emit(RegisterSuccsess());
        } on Exception catch (e) {
          emit(RegisterFailure(errorMessage: e.toString()));
        }
      }
    });
  }
}
