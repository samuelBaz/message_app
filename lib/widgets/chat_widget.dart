import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(children: [
        Container(
          height: 70,
          width: 70,
          color: Colors.black,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nombre chat",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text("mensaje que se envio")
            ],
          ),
        ),
        Column(
          children: [
            Text("Fecha"),
            Badge(
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: Text("2"),
            )
          ],
        )
      ]),
    );
  }
}
