import 'package:flutter/material.dart';
import 'package:message_app/models/ChatModel.dart';
import 'package:message_app/routes_app.dart';
import 'package:message_app/screens/chat_screen.dart';

class ChatWidget extends StatefulWidget {
  final ChatModel chat;
  final VoidCallback onLoangPressCallback;
  final VoidCallback onDelete;
  final VoidCallback onDeleteCancelCallback;
  const ChatWidget(
      {super.key,
      required this.chat,
      required this.onLoangPressCallback,
      required this.onDelete,
      required this.onDeleteCancelCallback});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(chat: widget.chat),
          )),
      onLongPress: () => widget.onLoangPressCallback(),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          AnimatedOpacity(
            onEnd: () {
              if (!widget.chat.deleteIntent) return;
              widget.onDelete();
            },
            opacity: widget.chat.deleteIntent ? 0.0 : 1.0,
            duration: Duration(seconds: 4),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,
              height: 84,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              color: widget.chat.isSelected
                  ? theme.colorScheme.surface
                  : theme.colorScheme.background,
              child: Row(children: [
                Container(
                  height: 56,
                  width: 56,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 16),
                  child: Image.asset(widget.chat.avatar),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.chat.name,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: Text(
                            widget.chat.lastMessage.message,
                            style: theme.textTheme.bodyMedium,
                          )),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.chat.lastMessage.date,
                      style: theme.textTheme.bodySmall,
                    ),
                    widget.chat.noRead == 0
                        ? const SizedBox()
                        : Container(
                            width: 22,
                            height: 22,
                            margin: const EdgeInsets.only(top: 8),
                            alignment: Alignment.center,
                            decoration: const ShapeDecoration(
                              shape: OvalBorder(),
                              color: Color(0xff1B72C0),
                            ),
                            child: Text(
                              widget.chat.noRead.toString(),
                              style: theme.textTheme.bodySmall!
                                  .copyWith(color: Colors.white),
                            ),
                          )
                  ],
                )
              ]),
            ),
          ),
          widget.chat.deleteIntent
              ? TextButton(
                  onPressed: () => widget.onDeleteCancelCallback(),
                  child: Text("Cancel"))
              : const SizedBox()
        ],
      ),
    );
  }
}
