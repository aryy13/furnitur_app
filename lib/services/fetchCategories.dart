import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:furnitur_app/models/categories.dart';

Future<List<Category>> fetchCategories() async {
  const String apiUrl =
      "https://5f210aa42f001666535e.mockapi.io/api/categories";

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List<Category> products = (json.decode(response.body) as List)
        .map((data) => Category.fromjson(data))
        .toList();

    return products;
  } else {
    throw Exception('Failed to load');
  }
}
