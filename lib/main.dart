import 'package:chat_app/bloc/bloc/auth_bloc.dart';
import 'package:chat_app/simple_bloc_observer.dart';

import 'cubits/chat_cubit/cubit/chat_cubit.dart';
import 'cubits/is_scure_cubit/cubit/is_scure_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'constraints/strings.dart';
import 'firebase_options.dart';
import 'presentation/screens/chat_screen.dart';
import 'presentation/screens/log_in_screen.dart';
import 'presentation/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(),),
         BlocProvider(create: (context) => IsScureCubit(),),
         BlocProvider(create: (context) => ChatCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          logInScreen:
              (context) => LogInScreen(),
          registerScreen:
              (context) => RegisterScreen(),
          chatScreen:
              (context) => ChatScreen(),
        },
        initialRoute: logInScreen,
      ),
    );
  }
}
