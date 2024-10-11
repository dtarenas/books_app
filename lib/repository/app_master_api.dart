import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/ResponseApiAppMasterPost.dart';
import '../models/request_new_book_app_master.dart';
import '../models/response_api_app_master_get.dart';
import '../models/response_api_delete_book_app_master.dart';


class AppMasterAPI {
  Future<ResponseApiAppMasterGet> getBooks() async {
    final apiResponse =
        await http.get(Uri.parse('https://wgreosi-app.apms.io/api/get_books/'));

    if (apiResponse.statusCode == 200) {
      return ResponseApiAppMasterGet.fromJson(jsonDecode(apiResponse.body));
    } else {
      throw Exception('Error loading the books');
    }
  }

  Future<ResponseApiAppMasterPost> createBook(RequestNewBookAppMaster book) async {
    final apiResponse = await http.post(
        Uri.parse('https://wgreosi-app.apms.io/api/create_book/'),
        body: jsonEncode(book.toJson()));

    if (apiResponse.statusCode == 200) {
      return ResponseApiAppMasterPost.fromJson(
          jsonDecode(apiResponse.body));
    } else {
      throw Exception('failed to create books');
    }
  }

  Future<ResponseApiDeleteBookAppMaster> deleteBook(int id) async {
    final apiResponse = await http.delete(
        Uri.parse('https://wgreosi-app.apms.io/api/delete_book/'),
        body: jsonEncode(<String, int>{
          'id': id,
        }));
    print("apiResponse: ${apiResponse.statusCode}");
    if (apiResponse.statusCode == 200) {
      return ResponseApiDeleteBookAppMaster.fromJson(
          jsonDecode(apiResponse.body));
    } else {
      throw Exception('failed to create books');
    }
  }
}
