import 'package:chat_app_2/constant.dart';
import 'package:chat_app_2/models/messages_model.dart';
import 'package:chat_app_2/widgets/chat_bubles.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id = 'chat page';

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    ScrollController scrollController = ScrollController();
    var email = ModalRoute.of(context)!.settings.arguments;
    CollectionReference messages =
        FirebaseFirestore.instance.collection(KMessages);
    return StreamBuilder(
        stream: messages.orderBy(KMassageTime,descending: true).snapshots(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Messages> messageList = [];
            for (var i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(
                Messages.fromjson(snapshot.data!.docs[i]),
              );
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: KMainColor,
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      KAppImage,
                      width: 50,
                    ),
                    const Text(
                      'Chat page',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: scrollController,
                        itemCount: messageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return messageList[index].id==email?ChatBubles(
                            message: messageList[index],
                          ): ChatBublesForFriend(
                            message: messageList[index],
                          );
                        },
                      ),
                    ),
                    TextField(
                      
                      controller: textController,
                      onSubmitted: (value) {
                        messages.add({
                          KTheMessages: value, // John Doe
                          KMassageTime: DateTime.now(), // Stokes and Sons
                          KUserId: email // 42
                        });
                        textController.clear();
                        scrollController.animateTo(0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide:
                                BorderSide(color: KMainColor, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            borderSide:
                                BorderSide(color: KMainColor, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            borderSide:
                                BorderSide(color: KMainColor, width: 2)),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const ModalProgressHUD(inAsyncCall: true, child: Scaffold());
          }
        }));
  }
}
