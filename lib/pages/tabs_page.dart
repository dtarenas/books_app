import 'package:books_app/pages/sections/api_books_page.dart';
import 'package:books_app/pages/sections/book_stores_page.dart';
import 'package:books_app/pages/sections/my_books_page.dart';
import 'package:books_app/pages/sections/profile_page.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                  tabs: [
                     Tab(icon: Icon(Icons.list, color: Colors.black)),
                     Tab(icon: Icon(Icons.list, color: Colors.black)),
                     Tab(icon: Icon(Icons.list, color: Colors.black)),
                     Tab(icon: Icon(Icons.list, color: Colors.black)),
                  ],
              ),
              title: const Text("My books"),
            ),
            body: const TabBarView(
                children: [
                  MyBooksPage(),
                  ApiBooksPage(),
                  BookStoresPage(),
                  ProfilePage()
                ],
            ),
          ),
      )

    );
  }
}
