import 'package:chat_app_2/constant.dart';
import 'package:chat_app_2/widgets/chat_bubles.dart';
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
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return const ChatBubles();
                },
              ),
            ),
           const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8),),
                borderSide: BorderSide(color: KMainColor,width: 2)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16)),
                borderSide: BorderSide(color: KMainColor,width: 2)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16)),
                borderSide: BorderSide(color: KMainColor,width: 2)
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}

