import 'package:flutter/material.dart';
import 'package:message_app/models/ContactModel.dart';

class ContactItem extends StatefulWidget {
  final ContactModel contact;
  const ContactItem({super.key, required this.contact});

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            SizedBox(
              width: 12,
              child: Text(
                widget.contact.group,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              child: Image.asset(widget.contact.avatar),
            ),
            Expanded(
                child: Text(
              widget.contact.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ))
          ],
        ));
  }
}
