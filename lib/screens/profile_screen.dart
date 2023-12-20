import 'package:flutter/material.dart';
import 'package:message_app/models/ChatModel.dart';
import 'package:message_app/widgets/item_option.dart';

class ProfileScreen extends StatefulWidget {
  final ChatModel chat;
  const ProfileScreen({super.key, required this.chat});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () => {},
        )
      ], backgroundColor: theme.colorScheme.background),
      body: SafeArea(
          child: Column(
        children: [
          Column(
            children: [
              Container(
                width: 120,
                height: 120,
                alignment: Alignment.center,
                child: Image.asset(
                  widget.chat.avatar,
                  fit: BoxFit.contain,
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                widget.chat.name,
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontSize: 32, color: theme.colorScheme.secondary),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.chat.phone,
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                theme.colorScheme.primary)),
                        onPressed: () => {},
                        icon: Icon(
                          Icons.edit_outlined,
                          color: isDarkMode
                              ? theme.colorScheme.background
                              : Colors.white,
                        )),
                    Text(
                      "Message",
                      style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                theme.colorScheme.primary)),
                        onPressed: () => {},
                        icon: Icon(
                          Icons.call_outlined,
                          color: isDarkMode
                              ? theme.colorScheme.background
                              : Colors.white,
                        )),
                    Text(
                      "Call",
                      style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                theme.colorScheme.primary)),
                        onPressed: () => {},
                        icon: Icon(
                          Icons.notifications_outlined,
                          color: isDarkMode
                              ? theme.colorScheme.background
                              : Colors.white,
                        )),
                    Text(
                      "Mute",
                      style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(16),
            child: Text(
              "More actions",
              style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const ItemOption(icon: Icons.image_outlined, title: "View Media"),
          const ItemOption(
              icon: Icons.search_outlined, title: "Search in conversation"),
          const ItemOption(
              icon: Icons.notifications_outlined, title: "Notifications"),
        ],
      )),
    );
  }
}
