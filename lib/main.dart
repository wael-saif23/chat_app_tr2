import 'package:chat_app_2/cubits/cubit/login_cubit.dart';
import 'package:chat_app_2/views/chat_page.dart';
import 'package:chat_app_2/views/login_page.dart';
import 'package:chat_app_2/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp2());
}

class ChatApp2 extends StatelessWidget {
  const ChatApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> LoginCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            LoginPage.id: (context) =>  LoginPage(),
            RegisterPage.id:(context) =>  RegisterPage(),
            ChatPage.id: (context)=> const ChatPage(),
          },
          initialRoute: LoginPage.id,
          ),
    );
  }
}
