import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/response_api_nyt_books.dart';

class NYTimesAPI {
  Future<ResponseApiNyTimes> getBooks() async {
    final response = await http.get(Uri.parse(
        'https://api.nytimes.com/svc/books/v3/lists/full-overview.json?api-key=1xAnYjGBe6aAQ7efyogI4khFX74GKGqF'));

    print("DAAT Resultado ${response.body}");

    if (response.statusCode == 200) {
      return ResponseApiNyTimes.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error calling API service');
    }
  }
}
