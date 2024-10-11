import 'package:books_app/models/response_api_app_master_get.dart';
import 'package:flutter/material.dart';

import '../../repository/app_master_api.dart';
import 'app_master_new_book_page.dart';

class MyBooksAppMasterPage extends StatefulWidget {
  const MyBooksAppMasterPage({super.key});

  @override
  State<MyBooksAppMasterPage> createState() => _MyBooksAppMasterPageState();
}

class _MyBooksAppMasterPageState extends State<MyBooksAppMasterPage> {
  final AppMasterAPI appMasterAPI = AppMasterAPI();
  List<Data> bookLst = <Data>[];

  Future _getBooks() async {
    var results = await appMasterAPI.getBooks();
    setState(() {
      bookLst.addAll(results.data as Iterable<Data>);
    });
  }

  void _onAddButtonClicked() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AppMasterNewBookPage()));
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
                    title: Text(book.name ?? 'No title'),
                    subtitle: Text(book.author ?? 'No author'),
                    leading: Image.network(
                      book.urlPicture ?? '',
                      errorBuilder: (BuildContext ccntext, Object exception,
                          StackTrace? trace) {
                        return const Image(
                          image: AssetImage('assets/images/logo.png'),
                        );
                      },
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => DetailApiBookPage(book)));
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _onAddButtonClicked, child: const Icon(Icons.add)),
    );
  }
}
