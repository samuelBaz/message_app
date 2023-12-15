import 'package:flutter/material.dart';
import 'package:message_app/widgets/chat_widget.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SearchBar(
            backgroundColor: MaterialStatePropertyAll(Color(0xffEFF1F8)),
            hintText: "Search",
            leading: Icon(Icons.search),
            elevation: MaterialStatePropertyAll(0),
            padding:
                MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
          ),
        ),
        ChatWidget()
      ]),
    );
  }
}
