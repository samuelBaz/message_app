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
    ChatModel(
        "Bryan",
        "+591 79865866",
        MessageModel("What do you think?", "4:30 PM", false),
        "assets/avatar1.png",
        2, [
      MessageModel("What do you think?", "4:30 PM", false),
      MessageModel("Hola", "4:29 PM", true),
      MessageModel("Te envien las fotos ayer", "4:20 PM", true),
      MessageModel("Me vas a dejar en visto??", "4:19 PM", false),
    ]),
    ChatModel(
        "Kari",
        "+591 79865866",
        MessageModel("looks great!", "4:23 PM", false),
        "assets/avatar2.png",
        1,
        [MessageModel("looks great!", "4:23 PM", false)]),
    ChatModel(
        "Diana",
        "+591 79865866",
        MessageModel("Lunch on Monday", "4:12 PM", false),
        "assets/avatar3.png",
        0,
        [MessageModel("Lunch on Monday", "4:12 PM", false)]),
    ChatModel(
        "Ben",
        "+591 79865866",
        MessageModel("You sent a photo", "3:58 PM", true),
        "assets/avatar4.png",
        0,
        [MessageModel("You sent a photo", "3:58 PM", true)]),
    ChatModel(
        "Naomi",
        "+591 79865866",
        MessageModel("Naomi shen a photo", "3:31 PM", false),
        "assets/avatar5.png",
        0,
        [MessageModel("Naomi shen a photo", "3:31 PM", false)]),
    ChatModel(
        "Alicia",
        "+591 79865866",
        MessageModel("See you at 8", "3:30 PM", false),
        "assets/avatar6.png",
        0,
        [MessageModel("See you at 8", "3:30 PM", false)]),
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
