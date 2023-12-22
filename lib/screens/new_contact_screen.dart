import 'package:flutter/material.dart';

class NewContactScreen extends StatefulWidget {
  const NewContactScreen({super.key});

  @override
  State<NewContactScreen> createState() => _NewContactScreenState();
}

class _NewContactScreenState extends State<NewContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Contact"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 56, right: 16),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 60),
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(56))),
                color: Theme.of(context).colorScheme.surface),
            child: Icon(
              Icons.image,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  alignment: Alignment.center,
                  child: Icon(Icons.person),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "First Name",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16)),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  alignment: Alignment.center,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Last Name",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16)),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
