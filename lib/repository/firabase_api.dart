import 'dart:io';

import 'package:books_app/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart' as UserApp;

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

  Future<String?> storeUserInFireStorage(UserApp.User user) async {
    try {
      var db = FirebaseFirestore.instance;
      final document =
          await db.collection('user')
              .doc(user.uid)
              .set(user.toJson());
      return user.uid;
    } on FirebaseException catch (e) {
      print('FirebaseCFException ${e.code}');
      print('FirebaseCFException ${e.message}');
      return e.code;
    }
  }

 Future<String?> createBook(Book book, File? image) async {
    return "";
 }
}
