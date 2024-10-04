import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/book.dart';
import '../../repository/firebase_api.dart';

class NewBookPage extends StatefulWidget {
  const NewBookPage({super.key});

  @override
  State<NewBookPage> createState() => _NewBookPageState();
}

class _NewBookPageState extends State<NewBookPage> {
  final FirebaseApi _firebaseApi = FirebaseApi();
  final _name = TextEditingController();
  final _author = TextEditingController();
  final _pages = TextEditingController();
  double _rating = 3.0;
  bool _isActionGenre = false,
      _isAdventureGenre = false,
      _isThrillerGenre = false;
  bool _isComicGenre = false;
  bool _isSuspenseGenre = false;


  Future<void> _saveBook() async {
    var book = Book("", _name.text, _author.text, _pages.text, _rating,
        _isActionGenre, _isAdventureGenre, _isThrillerGenre, _isComicGenre, "");
    var result = await _firebaseApi.createBook(book, image!);
    if (result == "network-request-failed") {
      showMessage("Network issue");
    } else {
      //Creacion exitosa
      Navigator.pop(context);
    }
  }

  void showMessage(String msg) {
    SnackBar snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                height: 170,
                child: Stack(
                  children: [
                    image != null
                        ? Image.file(image!, width: 150, height: 150)
                        : const Image(
                            image: AssetImage('assets/images/logo.png'),
                            width: 150,
                            height: 150,
                          ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        alignment: Alignment.bottomLeft,
                        onPressed: () async {
                          pickImage();
                        },
                        icon: const Icon(Icons.camera_alt),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Name'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _author,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Author'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                  controller: _pages,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Pages'),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      value!.isNumber() ? null : "Input numbers only"),
              const SizedBox(
                height: 16.0,
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  _rating = rating;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                "Book's Genre",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text('Action'),
                      value: _isActionGenre,
                      selected: _isActionGenre,
                      onChanged: (bool? value) {
                        setState(() {
                          _isActionGenre = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text('Adventure'),
                      value: _isAdventureGenre,
                      selected: _isAdventureGenre,
                      onChanged: (bool? value) {
                        setState(() {
                          _isAdventureGenre = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text('Comics'),
                      value: _isComicGenre,
                      selected: _isComicGenre,
                      onChanged: (bool? value) {
                        setState(() {
                          _isComicGenre = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text('Thriller'),
                      value: _isThrillerGenre,
                      selected: _isThrillerGenre,
                      onChanged: (bool? value) {
                        setState(() {
                          _isThrillerGenre = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text('Suspense'),
                      value: _isSuspenseGenre,
                      selected: _isSuspenseGenre,
                      onChanged: (bool? value) {
                        setState(() {
                          _isSuspenseGenre = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _saveBook();
                },
                child: const Text('Save book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on String {
  bool isNumber() {
    return RegExp(r'^[0-9]+$').hasMatch(this);
  }
}
