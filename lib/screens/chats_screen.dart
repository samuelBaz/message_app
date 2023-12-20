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
  bool onLongPressActivate = false;
  List<ChatModel> chats = [
    ChatModel(
        "Bryan",
        "+591 79865866",
        MessageModel("What do you think?", "4:30 PM", false),
        "assets/avatar1.png",
        2,
        false,
        false, [
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
        false,
        false,
        [MessageModel("looks great!", "4:23 PM", false)]),
    ChatModel(
        "Diana",
        "+591 79865866",
        MessageModel("Lunch on Monday", "4:12 PM", false),
        "assets/avatar3.png",
        0,
        false,
        false,
        [MessageModel("Lunch on Monday", "4:12 PM", false)]),
    ChatModel(
        "Ben",
        "+591 79865866",
        MessageModel("You sent a photo", "3:58 PM", true),
        "assets/avatar4.png",
        0,
        false,
        false,
        [MessageModel("You sent a photo", "3:58 PM", true)]),
    ChatModel(
        "Naomi",
        "+591 79865866",
        MessageModel("Naomi shen a photo", "3:31 PM", false),
        "assets/avatar5.png",
        0,
        false,
        false,
        [MessageModel("Naomi shen a photo", "3:31 PM", false)]),
    ChatModel(
        "Alicia",
        "+591 79865866",
        MessageModel("See you at 8", "3:30 PM", false),
        "assets/avatar6.png",
        0,
        false,
        false,
        [MessageModel("See you at 8", "3:30 PM", false)]),
  ];

  onLongPressCallback(chat) {
    setState(() {
      chats = chats.map((c) {
        if (c.name == chat.name) {
          c.isSelected = true;
        } else
          c.isSelected = false;
        return c;
      }).toList();
      onLongPressActivate = true;
    });
  }

  onDeleteIntent() {
    setState(() {
      ChatModel chat = chats.firstWhere((c) => c.isSelected);
      chats = chats.map((c) {
        if (c.name == chat.name) {
          c.deleteIntent = true;
        }
        return c;
      }).toList();
      onLongPressActivate = true;
    });
  }

  onCancelDeleteCallback() {
    setState(() {
      chats = chats.map((c) {
        c.deleteIntent = false;
        return c;
      }).toList();
    });
  }

  onDelete() {
    ChatModel chat = chats.firstWhere((c) => c.isSelected);
    setState(() {
      chats.remove(chat);
      onLongPressActivate = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(children: [
        onLongPressActivate
            ? AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => setState(() {
                    onLongPressActivate = false;
                    chats = chats.map((c) {
                      c.isSelected = false;
                      return c;
                    }).toList();
                  }),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () => {_showDialog(context)},
                  ),
                ],
              )
            : const SizedBox(),
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
                    onLoangPressCallback: () => onLongPressCallback(chat),
                    onDelete: () => onDelete(),
                    onDeleteCancelCallback: () => onCancelDeleteCallback(),
                  ))
              .toList(),
        )
      ]),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(
            Icons.delete_outline_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text("Delete conversation?"),
          content: Text(
              "This conversation will be removed from all your synced devices. This action cannot be undone."),
          actions: [
            TextButton(
                onPressed: () => {Navigator.pop(context)},
                child: Text("Cancel")),
            TextButton(
                onPressed: () {
                  onDeleteIntent();
                  Navigator.pop(context);
                },
                child: Text("Delete"))
          ],
        );
      },
    );
  }
}
