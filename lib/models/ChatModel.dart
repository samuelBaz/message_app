import 'package:message_app/models/MessageModel.dart';

class ChatModel {
  String name;
  MessageModel lastMessage;
  String avatar;
  int noRead;

  ChatModel(this.name, this.lastMessage, this.avatar, this.noRead);
}
