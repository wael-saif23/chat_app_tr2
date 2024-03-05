import 'package:chat_app_2/constant.dart';
import 'package:chat_app_2/models/messages_model.dart';
import 'package:flutter/material.dart';

class ChatBubles extends StatelessWidget {
  const ChatBubles({
    super.key, required this.message,
  });
  final Messages message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding:
            const EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
              bottomLeft: Radius.circular(0)),
          color: KMainColor,
        ),
        child:  Text(
          message.message,
          style:const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}


class ChatBublesForFriend extends StatelessWidget {
  const ChatBublesForFriend({
    super.key, required this.message,
  });
  final Messages message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding:
            const EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(0),
              bottomLeft: Radius.circular(16)),
          color: Color.fromARGB(255, 37, 92, 150),
        ),
        child:  Text(
          message.message,
          style:const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
