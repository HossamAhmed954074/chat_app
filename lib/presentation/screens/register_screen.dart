
import 'package:chat_app/bloc/bloc/auth_bloc.dart';

import '../../cubits/is_scure_cubit/cubit/is_scure_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constraints/my_colors.dart';
import '../../constraints/strings.dart';

import '../../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  String? email, password;
  bool isAsyncCall = false;
  GlobalKey<FormState> formKey = GlobalKey();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isAsyncCall = true;
        } else if (state is RegisterSuccsess) {
            isAsyncCall = false;
          showSnackBar(context, 'Success , go to Loging Page to Log In ');
          Navigator.pop(context);
        } else if (state is RegisterFailure) {
           isAsyncCall = false;
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
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
                    
                    BlocBuilder<IsScureCubit, IsScureState>(
                      builder: (context, state) {
                        return TextFormFieldCustomWidget(
                          hintText: 'password',
                          textInputType: TextInputType.visiblePassword,
                          obScure:
                              BlocProvider.of<IsScureCubit>(context).isScure,
                          icon: Icon(
                            BlocProvider.of<IsScureCubit>(context).isScure
                                ? Icons.remove_red_eye
                                : Icons.hide_source_outlined,
                            color: Colors.white,
                          ),
                          onPressedChangeScure: () {
                            BlocProvider.of<IsScureCubit>(
                              context,
                            ).shangeSecure();
                          },
                          onSubmited: (val) => password = val,
                        );
                      },
                    ),
                    SizedBox(height: 20),

                    ButtonCustomWidget(
                      buttonText: 'Register',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(
                            context,
                          ).add(RegisterUser(email: email, password: password));
                        }
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
      },
    );
  }
}
