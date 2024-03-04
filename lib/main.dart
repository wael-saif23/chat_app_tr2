import 'package:chat_app_2/views/chat_page.dart';
import 'package:chat_app_2/views/login_page.dart';
import 'package:chat_app_2/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginPage.id: (context) =>  LoginPage(),
          RegisterPage.id:(context) =>  RegisterPage(),
          ChatPage.id: (context)=> const ChatPage(),
        },
        initialRoute: LoginPage.id,
        );
  }
}
