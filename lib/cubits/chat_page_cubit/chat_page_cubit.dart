import 'package:bloc/bloc.dart';
import 'package:chat_app_2/constant.dart';
import 'package:chat_app_2/models/messages_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_page_state.dart';

class ChatPageCubit extends Cubit<ChatPageState> {
  ChatPageCubit() : super(ChatPageInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessages);
   
  // bool inAsyncCall = false;
  void sendMassage({required String message, required String email}) {
    messages.add({
      KTheMessages: message, // John Doe
      KMassageTime: DateTime.now(), // Stokes and Sons
      KUserId: email // 42
    });
  }

  void getMassage() {
   

    messages
        .orderBy(KMassageTime, descending: true)
        .snapshots()
        .listen((event) {
        List<Messages> messageList = [];
      for (var doc in event.docs) {
        messageList.add(
          Messages.fromjson(doc),
        );
        // event.docs.clear();
      }
      emit(ChatPageSuccess(messageList: messageList));
    });
  }
}
