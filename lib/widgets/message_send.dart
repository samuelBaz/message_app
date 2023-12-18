import 'package:flutter/material.dart';
import 'package:message_app/models/MessageModel.dart';

class MessageSend extends StatefulWidget {
  final MessageModel message;
  const MessageSend({super.key, required this.message});

  @override
  State<MessageSend> createState() => _MessageSendState();
}

class _MessageSendState extends State<MessageSend> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      alignment: Alignment.centerRight,
      child: Container(
        decoration: ShapeDecoration(
            color: theme.colorScheme.primary,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(22)))),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(
          widget.message.message,
          style: theme.textTheme.bodyLarge!.copyWith(
              color: isDarkMode ? theme.colorScheme.surface : Colors.white),
        ),
      ),
    );
  }
}
