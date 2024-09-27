import 'package:books_app/pages/new_book_page.dart';
import 'package:flutter/material.dart';

class MyBooksPage extends StatefulWidget {
  const MyBooksPage({super.key});

  @override
  State<MyBooksPage> createState() => _MyBooksPageState();
}

class _MyBooksPageState extends State<MyBooksPage> {

  void _onAddButtonClicked() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewBookPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("My Books Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAddButtonClicked,
        child: const Icon(Icons.add),
      ),
    );
  }
}
