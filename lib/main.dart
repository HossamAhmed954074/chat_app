import 'cubits/chat_cubit/cubit/chat_cubit.dart';
import 'cubits/is_scure_cubit/cubit/is_scure_cubit.dart';
import 'cubits/login_cubit/cubit/log_in_cubit.dart';
import 'cubits/register_cubit/cubit/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constraints/strings.dart';
import 'firebase_options.dart';
import 'presentation/screens/chat_screen.dart';
import 'presentation/screens/log_in_screen.dart';
import 'presentation/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(create: (context) => IsScureCubit(),),
         BlocProvider(create: (context) => ChatCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          logInScreen:
              (context) => BlocProvider(
                create: (context) => LogInCubit(),
                child: LogInScreen(),
              ),
          registerScreen:
              (context) => BlocProvider(
                create: (context) => RegisterCubit(),
                child: RegisterScreen(),
              ),
          chatScreen:
              (context) => ChatScreen(),
        },
        initialRoute: logInScreen,
      ),
    );
  }
}
