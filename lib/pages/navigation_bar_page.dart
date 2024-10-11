import 'package:books_app/pages/sections/api_books_page.dart';
import 'package:books_app/pages/sections/book_stores_page.dart';
import 'package:books_app/pages/sections/my_books_app_master_page.dart';
import 'package:books_app/pages/sections/my_books_page.dart';
import 'package:books_app/pages/sections/profile_page.dart';
import 'package:flutter/material.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    MyBooksPage(),
    MyBooksAppMasterPage(),
    ApiBooksPage(),
    BookStoresPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: const Text("My books"),
      )),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "My books",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "My books App Master",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.api),
            label: "My books",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: "My books",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "My books",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
