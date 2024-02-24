import 'package:chat_app_2/views/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp2());
}

class ChatApp2 extends StatelessWidget {
  const ChatApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginPage.id: (context) => const LoginPage(),
        },
        initialRoute: LoginPage.id,
        home: const LoginPage());
  }
}
