import 'package:books_app/models/response_api_nyt_books.dart';
import 'package:flutter/material.dart';

class DetailApiBookPage extends StatefulWidget {
  final Books book;

  const DetailApiBookPage(this.book, {super.key});

  @override
  State<DetailApiBookPage> createState() => _DetailApiBookPageState(book);
}

class _DetailApiBookPageState extends State<DetailApiBookPage> {
  final Books book;

  _DetailApiBookPageState(this.book);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(book.title ?? 'No title'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(book.bookImage ?? ''),
              const SizedBox(height: 8),
              Text('Author: ${book.author}'),
              const SizedBox(height: 8.0),
              Text('Editorial: ${book.publisher}'),
              const SizedBox(height: 8.0),
              Text('Description: ${book.description}',
                  textAlign: TextAlign.justify),
            ],
          ),
        ));
  }
}
