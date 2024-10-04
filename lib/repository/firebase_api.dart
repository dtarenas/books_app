import 'dart:io';

import 'package:books_app/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/user.dart' as user_app;

class FirebaseApi {
  Future<String?> registerUser(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException ${e.code}");
      return e.code;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }

  Future<String?> signIn(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException ${e.code}");
      return e.code;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }

  Future<String?> storeUserInFireStorage(user_app.User user) async {
    try {
      var db = FirebaseFirestore.instance;
      await db.collection('user').doc(user.uid).set(user.toJson());
      return user.uid;
    } on FirebaseException catch (e) {
      print('FirebaseCFException ${e.code}');
      print('FirebaseCFException ${e.message}');
      return e.code;
    }
  }

  Future<String> createBook(Book book, File? image) async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      final document = FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("books")
          .doc();
      book.id = document.id;

      final storageRef = FirebaseStorage.instance.ref();
      final bookPictureRef = storageRef.child("books").child("${book.id}.jpg");
      await bookPictureRef.putFile(image!);
      book.urlPicture = await bookPictureRef.getDownloadURL();

      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("books")
          .doc(document.id)
          .set(book.toJson());

      await FirebaseFirestore.instance
          .collection("books")
          .doc(document.id)
          .set(book.toJson());

      return document.id;
    } on FirebaseException catch (e) {
      print("FirebaseCFException ${e.code}");
      return e.code;
    }
  }


  Future<String> deleteBook(QueryDocumentSnapshot<Object?> book) async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("books")
          .doc(book.id)
          .delete();

      await FirebaseFirestore.instance
          .collection("books")
          .doc(book.id)
          .delete();

      return uid!;
    } on FirebaseException catch (e) {
      print('FirebaseCFException ${e.code}');
      print('FirebaseCFException ${e.message}');
      return e.code;
    }
  }
}
