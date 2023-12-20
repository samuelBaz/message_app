import 'package:flutter/material.dart';
import 'package:message_app/widgets/item_option.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: [
        AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          actions: [
            IconButton(onPressed: () => {}, icon: Icon(Icons.search_outlined)),
            IconButton(onPressed: () => {}, icon: Icon(Icons.more_vert))
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: Text(
            "Settings",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/contact1.png",
                  width: 56,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daniela",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "+591 69354585",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              TextButton(
                onPressed: () => {},
                child: Text(
                  "Edit",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Color(0xff1B1C1F), fontWeight: FontWeight.w500),
                ),
                style: ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 24)),
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.surface)),
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(16),
          child: Text(
            "General",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500),
          ),
        ),
        const ItemOption(
            icon: Icons.notifications_outlined, title: "Notifications"),
        const ItemOption(icon: Icons.image_outlined, title: "Appearaance"),
        const ItemOption(icon: Icons.lock_outline, title: "Privacity"),
        const ItemOption(icon: Icons.storage_outlined, title: "Storage & Data"),
        const ItemOption(icon: Icons.image_outlined, title: "About"),
      ],
    ));
  }
}
