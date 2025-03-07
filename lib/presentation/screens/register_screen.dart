import 'package:chat_app/constraints/my_colors.dart';
import 'package:chat_app/constraints/strings.dart';
import 'package:chat_app/helper/register_user_auth.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/presentation/widgets/custom_button.dart';
import 'package:chat_app/presentation/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email, password;

  bool isAsyncCall = false;
  bool isScure = true;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isAsyncCall,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 75),
                Image.asset(kImageApp, height: 100),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 75),
                Row(
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                TextFormFieldCustomWidget(
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                  obScure: false,
                  icon: Icon(Icons.email, color: Colors.white),
                  onSubmited: (val) => email = val,
                ),
                SizedBox(height: 15),

                TextFormFieldCustomWidget(
                  hintText: 'password',
                  textInputType: TextInputType.visiblePassword,
                  obScure: isScure,
                  icon: Icon(
                    isScure ? Icons.remove_red_eye : Icons.hide_source_outlined,
                    color: Colors.white,
                  ),
                  onPressedChangeScure: () {
                    setState(() {
                      isScure = !isScure;
                    });
                  },
                  onSubmited: (val) => password = val,
                ),
                SizedBox(height: 20),

                ButtonCustomWidget(
                  buttonText: 'Register',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      isAsyncCall = true;
                      setState(() {});
                      try {
                        await registerUser(email, password);
                        showSnackBar(
                          // ignore: use_build_context_synchronously
                          context,
                          'the account created ',
                        );
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(context, chatScreen);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                            // ignore: use_build_context_synchronously
                            context,
                            'The password provided is too weak. ',
                          );
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(
                            // ignore: use_build_context_synchronously
                            context,
                            'The account already exists for that email. ',
                          );
                        }
                      }

                      isAsyncCall = false;
                      setState(() {});
                    } else {}
                  },
                ),
                SizedBox(height: 35),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Having An Account ',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),

                    InkWell(
                      onTap:
                          () => Navigator.pushReplacementNamed(
                            context,
                            logInScreen,
                          ),
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 75),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
