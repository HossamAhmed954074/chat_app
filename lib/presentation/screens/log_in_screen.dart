import 'package:chat_app/constraints/my_colors.dart';
import 'package:chat_app/constraints/strings.dart';
import 'package:chat_app/helper/log_in_user_auth.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/presentation/widgets/custom_button.dart';
import 'package:chat_app/presentation/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isAsyncCall = false;

  bool isScure = true;
  
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
                      'LOG IN',
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
                  buttonText: 'Log In',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      isAsyncCall = true;
                      setState(() {});
                      try {
                        await logInUser(email, password);
                        // ignore: use_build_context_synchronously
                        showSnackBar(context, 'succsess.');
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(
                          context,
                          chatScreen,
                          arguments: email,
                        );
                       
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                            // ignore: use_build_context_synchronously
                            context,
                            'No user found for that email.',
                          );
                          
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(
                            // ignore: use_build_context_synchronously
                            context,
                            'Wrong password provided for that user.',
                          );
                          
                        }else{
                          showSnackBar(
                            // ignore: use_build_context_synchronously
                            context,
                            'Wrong password or Email',
                          );
                        }

                      }catch (e){
                         showSnackBar(
                            // ignore: use_build_context_synchronously
                            context,
                            'No user found for that email.',
                          );
                      }
                      isAsyncCall = false;
                      setState(() {});
                    }
                  },
                ),
                SizedBox(height: 35),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont Have An Account ',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),

                    InkWell(
                      onTap:
                          () => Navigator.pushReplacementNamed(
                            context,
                            registerScreen,
                          ),
                      child: Text(
                        'Register',
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

  // Future<void> logInUser() async {
  //   // ignore: unused_local_variable
  //   UserCredential userCredential = await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email!, password: password!);
  // }
}
