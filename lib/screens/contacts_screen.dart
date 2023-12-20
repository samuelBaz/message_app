import 'package:flutter/material.dart';
import 'package:message_app/models/ContactModel.dart';
import 'package:message_app/widgets/contact_item.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<ContactModel> contacts = [
    ContactModel("Alicia", "assets/contact1.png", 'A'),
    ContactModel("Anthony", "assets/contact2.png", ''),
    ContactModel("Ben", "assets/contact3.png", 'B'),
    ContactModel("Bryan", "assets/contact4.png", ''),
    ContactModel("Brianna", "assets/contact5.png", ''),
    ContactModel("Carla", "assets/contact3.png", 'C'),
    ContactModel("Camilo", "assets/contact4.png", ''),
    ContactModel("Celier", "assets/contact5.png", ''),
    ContactModel("Dennis", "assets/contact3.png", 'D'),
    ContactModel("Danilo", "assets/contact4.png", ''),
    ContactModel("Daniela", "assets/contact5.png", ''),
  ];

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
      resizeToAvoidBottomInset: false,
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
          Expanded(
            child: ListView(
              children: contacts
                  .map((contact) => ContactItem(contact: contact))
                  .toList(),
            ),
          )
          // SizedBox.expand(
          //   child: ListView(
          //     children: contacts
          //         .map((contact) => ContactItem(contact: contact))
          //         .toList(),
          //   ),
          // )
        ],
      )),
    );
  }
}
