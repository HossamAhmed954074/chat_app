import 'package:chat_app/cubits/is_scure_cubit/cubit/is_scure_cubit.dart';
import 'package:chat_app/cubits/login_cubit/cubit/log_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constraints/my_colors.dart';
import '../../constraints/strings.dart';
import '../../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class LogInScreen extends StatelessWidget {
  String? email, password;
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isAsyncCall = false;

  LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) {
        if (state is LogInLoading) {
          isAsyncCall = true;
        } else if (state is LogInSucsses) {
          isAsyncCall = false;
          Navigator.pushNamed(context, 'chatScreen');
        } else if (state is LogInFailure) {
          isAsyncCall = false;
          showSnackBar(context, state.errorMessage);
        }
      },
      builder:
          (context, state) => ModalProgressHUD(
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
                        buttonText: 'Log In',
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LogInCubit>(
                              context,
                            ).logInUser(email, password);
                          } else {}
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
          ),
    );
  }
}
