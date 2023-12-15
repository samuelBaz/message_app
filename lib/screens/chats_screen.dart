import 'package:flutter/material.dart';
import 'package:message_app/models/ChatModel.dart';
import 'package:message_app/models/MessageModel.dart';
import 'package:message_app/widgets/chat_widget.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<ChatModel> chats = [
    ChatModel("Bryan", MessageModel("What do you think?", "4:30 PM"),
        "assets/avatar1.png", 2),
    ChatModel("Kari", MessageModel("looks great!", "4:23 PM"),
        "assets/avatar2.png", 1),
    ChatModel("Diana", MessageModel("Lunch on Monday", "4:12 PM"),
        "assets/avatar3.png", 0),
    ChatModel("Ben", MessageModel("You sent a photo", "3:58 PM"),
        "assets/avatar4.png", 0),
    ChatModel("Naomi", MessageModel("Naomi shen a photo", "3:31 PM"),
        "assets/avatar5.png", 0),
    ChatModel("Alicia", MessageModel("See you at 8", "3:30 PM"),
        "assets/avatar6.png", 0),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SearchBar(
            hintText: "Search",
            leading: Icon(Icons.search),
            elevation: MaterialStatePropertyAll(0),
            padding:
                MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
          ),
        ),
        Column(
          children: chats
              .map((chat) => ChatWidget(
                    chat: chat,
                  ))
              .toList(),
        )
      ]),
    );
  }
}
