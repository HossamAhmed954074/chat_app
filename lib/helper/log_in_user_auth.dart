
 import 'package:firebase_auth/firebase_auth.dart';

Future<void> logInUser(String? email,String? password) async {
    // ignore: unused_local_variable
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }