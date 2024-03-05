import 'package:chat_app_2/constant.dart';

class Messages {
  final String message;
  final String id;

  Messages({required this.message, required this.id});
  factory Messages.fromjson(jsondata) {
    return Messages(message: jsondata[KTheMessages], id: jsondata[KUserId]);
  }
}
