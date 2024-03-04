import 'package:chat_app_2/constant.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id = 'chat page';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: KMainColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(KAppImage,width: 50,),
           const Text(
            'Chat page',
            style: TextStyle(color: Colors.white),
          )],
        ),
      ),
    );
  }
}
