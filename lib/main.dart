import 'package:flutter/material.dart';
import 'package:message_app/routes_app.dart';
import 'package:message_app/screens/chat_screen.dart';
import 'package:message_app/screens/chats_screen.dart';
import 'package:message_app/screens/contacts_screen.dart';
import 'package:message_app/screens/new_contact_screen.dart';
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
        colorScheme: const ColorScheme.light(
            primary: Color(0xff1B72C0),
            primaryContainer: Color(0xFFD3E4FF),
            onPrimaryContainer: Color(0xff001C38),
            surface: Color(0xffF3F4F9),
            surfaceVariant: Color(0xffEFF1F8),
            background: Color(0xffFCFCFF),
            secondary: Color(0xff001E2F),
            secondaryContainer: Color(0xff74777F)),
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
              fontSize: 12,
              color: Color(0xFF74777F),
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25,
            ),
            titleLarge: TextStyle(
              fontFamily: "Roboto",
              fontSize: 22,
              color: Color(0xff001E2F),
              fontWeight: FontWeight.w500,
            )),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(
            primary: Color(0xffA2C9FF),
            primaryContainer: Color(0xFF2F4156),
            onPrimaryContainer: Color(0xffD7E2FF),
            surface: Color(0xff13232C),
            surfaceVariant: Color(0xff1E2A32),
            background: Color(0xff0E181E),
            secondary: Color(0xffE0F1FF),
            secondaryContainer: Color(0xffA8ADBD)),
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
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      drawer: SafeArea(
          child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  decoration: ShapeDecoration(
                      shape: OvalBorder(), color: theme.colorScheme.primary),
                ),
                Text(
                  "Message App",
                  style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
            ListTile(
              title: Text(
                "Home",
                style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w500),
              ),
              leading: Icon(Icons.home),
              onTap: () {
                setState(() {
                  _currentPage = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                "Contacts",
                style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w500),
              ),
              leading: Icon(Icons.people_alt),
              onTap: () {
                setState(() {
                  _currentPage = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                "Settings",
                style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w500),
              ),
              leading: Icon(Icons.settings_outlined),
              onTap: () {
                setState(() {
                  _currentPage = 2;
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
      )),
      body: [ChatsScreen(), ContactsScreen(), SettingScreen()][_currentPage],
      floatingActionButton: _currentPage == 2
          ? const SizedBox()
          : FloatingActionButton(
              onPressed: () {
                if (_currentPage != 1) return;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewContactScreen(),
                    ));
              },
              child: Icon(_currentPage == 0 ? Icons.edit_outlined : Icons.add),
            ),
      bottomNavigationBar: NavigationBar(
          indicatorColor: theme.colorScheme.primaryContainer,
          backgroundColor: theme.colorScheme.surface,
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
