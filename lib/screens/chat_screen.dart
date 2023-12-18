import 'package:flutter/material.dart';
import 'package:message_app/models/ChatModel.dart';
import 'package:message_app/models/MessageModel.dart';
import 'package:message_app/screens/profile_screen.dart';
import 'package:message_app/widgets/message_received.dart';
import 'package:message_app/widgets/message_send.dart';

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
            title: InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(chat: widget.chat),
                    ))
              },
              child: Text(
                widget.chat.name,
                style: theme.textTheme.titleLarge,
              ),
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
                  child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                reverse: true,
                itemBuilder: (context, index) {
                  MessageModel messageModel = widget.chat.messages[index];
                  return messageModel.send
                      ? MessageSend(message: messageModel)
                      : MessageReceived(
                          message: messageModel, avatar: widget.chat.avatar);
                },
                itemCount: widget.chat.messages.length,
              )),
            ),
            Container(
              padding: EdgeInsets.only(left: 8, top: 16, bottom: 16, right: 16),
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
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32)))),
                    child: const TextField(
                      maxLines: 2,
                      minLines: 1,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          hintText: "Message",
                          border: InputBorder.none),
                    ),
                  ))
                ],
              ),
            )
          ],
        )));
  }
}
