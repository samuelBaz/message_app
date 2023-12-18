import 'package:flutter/material.dart';
import 'package:message_app/models/MessageModel.dart';

class MessageReceived extends StatefulWidget {
  final MessageModel message;
  final String avatar;
  const MessageReceived(
      {super.key, required this.message, required this.avatar});

  @override
  State<MessageReceived> createState() => _MessageReceivedState();
}

class _MessageReceivedState extends State<MessageReceived> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(children: [
        Container(
          margin: EdgeInsets.only(right: 8),
          width: 44,
          height: 44,
          alignment: Alignment.center,
          child: Image.asset(
            widget.avatar,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: ShapeDecoration(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22))),
              color: isDarkMode ? theme.colorScheme.surface : Colors.white),
          child: Text(
            widget.message.message,
            style: theme.textTheme.bodyLarge!
                .copyWith(color: theme.colorScheme.secondary),
          ),
        )
      ]),
    );
  }
}
