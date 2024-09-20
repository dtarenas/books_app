import 'package:books_app/pages/sections/api_books_page.dart';
import 'package:books_app/pages/sections/book_stores_page.dart';
import 'package:books_app/pages/sections/my_books_page.dart';
import 'package:books_app/pages/sections/profile_page.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    MyBooksPage(),
    ApiBooksPage(),
    BookStoresPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My books"),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      drawer: Drawer(
        child: ListView(
          children:  [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("My books header"),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text("My books"),
              onTap: () => {
                _onItemTapped(0),
                Navigator.pop(context)
              },
            ),
            ListTile(
              leading: const Icon(Icons.api),
              title: const Text("Api"),
              onTap: () => {
                _onItemTapped(1),
                Navigator.pop(context)
              },
            ),
            ListTile(
              leading: const Icon(Icons.store),
              title: const Text("Stores"),
              onTap: () => {
                _onItemTapped(2),
                Navigator.pop(context)
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () => {
                _onItemTapped(3),
                Navigator.pop(context)
              },
            )
          ],
        ),
      ),
    );
  }
}
