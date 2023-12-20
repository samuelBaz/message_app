import 'package:flutter/material.dart';

class ItemOption extends StatefulWidget {
  final String title;
  final IconData icon;
  const ItemOption({super.key, required this.icon, required this.title});

  @override
  State<ItemOption> createState() => _ItemOptionState();
}

class _ItemOptionState extends State<ItemOption> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(children: [
        Icon(widget.icon, color: theme.colorScheme.primary),
        const SizedBox(
          width: 16,
        ),
        Text(
          widget.title,
          style: theme.textTheme.bodyLarge!
              .copyWith(color: theme.colorScheme.secondary),
        )
      ]),
    );
  }
}
