import 'package:chat_app_2/constant.dart';

class Messages {
  final String message;
  final String id;

  Messages( this.message,  this.id);
  factory Messages.fromjson(jsondata) {
    return Messages( jsondata[KTheMessages],  jsondata[KUserId]);
  }
}
