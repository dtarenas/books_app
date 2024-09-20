import 'package:flutter/material.dart';

class BookStoresPage extends StatefulWidget {
  const BookStoresPage({super.key});

  @override
  State<BookStoresPage> createState() => _BookStoresPageState();
}

class _BookStoresPageState extends State<BookStoresPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Book Stores Page"),
      ),
    );
  }
}
