import 'package:books_app/models/response_api_nyt_books.dart';
import 'package:books_app/pages/sections/detail_api_book_page.dart';
import 'package:books_app/repository/nyt_api.dart';
import 'package:flutter/material.dart';

class ApiBooksPage extends StatefulWidget {
  const ApiBooksPage({super.key});

  @override
  State<ApiBooksPage> createState() => _ApiBooksPageState();
}

class _ApiBooksPageState extends State<ApiBooksPage> {
  final NYTimesAPI nyTimesAPI = NYTimesAPI();
  List<Books> bookLst = <Books>[];

  Future _getBooks() async {
    var results = await nyTimesAPI.getBooks();
    setState(() {
      results.results?.lists?.forEach((list) {
        bookLst.addAll(list.books as Iterable<Books>);
      });
    });
  }

  @override
  void initState() {
    _getBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Expanded(
            child: ListView.builder(
              itemCount: bookLst.length,
              itemBuilder: (BuildContext context, int index) {
                var book = bookLst[index];
                return Card(
                  child: ListTile(
                    title: Text(book.title ?? 'No title'),
                    subtitle: Text(book.author ?? 'No author'),
                    leading: Image.network(book.bookImage ?? ''),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailApiBookPage(book)));
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
