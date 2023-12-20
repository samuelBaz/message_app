import 'package:message_app/models/MessageModel.dart';

class ChatModel {
  String name;
  String phone;
  MessageModel lastMessage;
  String avatar;
  int noRead;
  bool isSelected;
  bool deleteIntent;
  List<MessageModel> messages;

  ChatModel(this.name, this.phone, this.lastMessage, this.avatar, this.noRead,
      this.isSelected, this.deleteIntent, this.messages);
}
