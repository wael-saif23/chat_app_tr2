part of 'chat_page_cubit.dart';

@immutable
sealed class ChatPageState {}

final class ChatPageInitial extends ChatPageState {}

final class ChatPageSuccess extends ChatPageState {
  final List<Messages> messageList;

  ChatPageSuccess({required this.messageList});

}
