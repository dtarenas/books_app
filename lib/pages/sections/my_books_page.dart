import 'package:books_app/pages/sections/new_book_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../repository/firebase_api.dart';

class MyBooksPage extends StatefulWidget {
  const MyBooksPage({super.key});

  @override
  State<MyBooksPage> createState() => _MyBooksPageState();
}

class _MyBooksPageState extends State<MyBooksPage> {
  final FirebaseApi _firebaseApi = FirebaseApi();

  void _onAddButtonClicked() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const NewBookPage()));
  }

  void _showAlertDialog(BuildContext context, QueryDocumentSnapshot book) {
    AlertDialog alert = AlertDialog(
      title: const Text('Warning'),
      content: Text("Are you sure to delete the book ${book['name']}?"),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('No')),
        TextButton(
            onPressed: () {
              _firebaseApi.deleteBook(book);
              Navigator.pop(context, 'Ok');
            },
            child: const Text('Yes'))
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  InkWell _buildCard(QueryDocumentSnapshot book) {
    var heading = book['name'];
    var subHeading = book['author'];
    var cardImage = book['urlPicture'] == ""
        ? const AssetImage('assets/images/logo.png') as ImageProvider
        : NetworkImage(book['urlPicture']);

    return InkWell(
      onTap: () => print('Tapped'),
      onLongPress: () {
        print('Long Tap');
        _showAlertDialog(context, book);
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            const SizedBox(height: 12),
            SizedBox(
              height: 100.0,
              width: 100.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(heading),
              subtitle: Text(subHeading),
              leading: Image.network(
                book['urlPicture'] ?? "",
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stacktrace) {
                  return Image.asset('assets/images/logo.png');
                },
              ),
            ),
            const SizedBox(
              height: 16.0,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('books').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text('Loading...');
              } else {
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      QueryDocumentSnapshot book = snapshot.data!.docs[index];
                      return _buildCard(book);
                    });
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAddButtonClicked,
        child: const Icon(Icons.add),
      ),
    );
  }
}
