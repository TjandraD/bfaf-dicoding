import '../model/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static final String _baseUrl = 'https://newsapi.org/v2/';
  static final String _apiKey = '493a576280ac4785b538c298d9af0714';
  static final String _category = 'business';
  static final String _country = 'id';

  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(_baseUrl +
        'top-headlines?country=$_country&category=$_category&apiKey=$_apiKey');

    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
