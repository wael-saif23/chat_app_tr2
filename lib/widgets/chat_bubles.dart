import 'package:chat_app_2/constant.dart';
import 'package:flutter/material.dart';

class ChatBubles extends StatelessWidget {
  const ChatBubles({
    super.key,
  });

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
        child: const Text(
          'start chat with me',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
