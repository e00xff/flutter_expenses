import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_expenses/models/Category.dart';

class ApiService {

  ApiService();

  final String baseUrl = 'http://127.0.0.1:8000/api/';

  Future<List<Category>> fetchCategories() async {
    http.Response response = await http.get(Uri.parse(baseUrl + 'categories'));

    List categories = jsonDecode(response.body);

    return categories.map((category) => Category.fromJson(category)).toList();
  }

  Future<Category> updateCategory(id, name) async {

    String uri = baseUrl + 'categories/' + id.toString();

    http.Response response = await http.put(Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      },
      body: jsonEncode({ 'name': name }),
    );

    if(response.statusCode != 200) {
      throw Exception('Error happend on update');
    }

    return Category.fromJson(jsonDecode(response.body));
  }

}