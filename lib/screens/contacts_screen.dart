import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => {},
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
            child: Text(
              "Contacts",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: SearchBar(
              hintText: "Search",
              leading: Icon(Icons.search),
              elevation: MaterialStatePropertyAll(0),
              padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16)),
            ),
          ),
        ],
      )),
    );
  }
}
