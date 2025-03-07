import 'package:firebase_auth/firebase_auth.dart';

Future<void> registerUser(String? email, String? password) async {
  // ignore: unused_local_variable
  UserCredential userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email!, password: password!);
}
