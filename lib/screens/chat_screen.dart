import 'package:flutter/material.dart';
import 'package:message_app/models/ChatModel.dart';

class ChatScreen extends StatefulWidget {
  final ChatModel chat;
  const ChatScreen({super.key, required this.chat});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
        backgroundColor: isDarkMode
            ? theme.colorScheme.background
            : theme.colorScheme.surface,
        appBar: AppBar(
            backgroundColor: isDarkMode
                ? theme.colorScheme.background
                : theme.colorScheme.surface,
            title: Text(
              widget.chat.name,
              style: theme.textTheme.titleLarge,
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.call_outlined),
                onPressed: () => {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: IconButton(
                  icon: Icon(Icons.search_outlined),
                  onPressed: () => {},
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () => {},
              )
            ]),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: SizedBox.expand(
                child: ListView(
                  children: [
                    Text("Chats"),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => {},
                      icon: Icon(
                        Icons.camera_alt,
                        color: theme.colorScheme.primary,
                      )),
                  IconButton(
                      onPressed: () => {},
                      icon: Icon(
                        Icons.image,
                        color: theme.colorScheme.primary,
                      )),
                  Expanded(
                      child: Container(
                    decoration: ShapeDecoration(
                        color: isDarkMode
                            ? theme.colorScheme.surface
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32)))),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Message", border: InputBorder.none),
                    ),
                  ))
                ],
              ),
            )
          ],
        )));
  }
}
