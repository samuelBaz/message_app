import 'package:flutter/material.dart';
import 'package:message_app/screens/chats_screen.dart';
import 'package:message_app/screens/contacts_screen.dart';
import 'package:message_app/screens/setting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, brightness: Brightness.light),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontFamily: "Roboto",
              fontSize: 16,
              color: Color(0xff001E2F),
              fontWeight: FontWeight.w400,
              letterSpacing: 0.15,
            ),
            bodyMedium: TextStyle(
              fontFamily: "Roboto",
              fontSize: 14,
              color: Color(0xFF74777F),
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25,
            ),
            bodySmall: TextStyle(
              fontFamily: "Roboto",
              fontSize: 14,
              color: Color(0xFF74777F),
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25,
            )),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [ChatsScreen(), ContactsScreen(), SettingScreen()][_currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.edit_outlined),
      ),
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
          selectedIndex: _currentPage,
          destinations: const [
            NavigationDestination(
              label: "Chats",
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              label: "Contacts",
              icon: Icon(Icons.people_alt_outlined),
              selectedIcon: Icon(Icons.people_alt),
            ),
            NavigationDestination(
              label: "Settings",
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
            )
          ]),
    );
  }
}
