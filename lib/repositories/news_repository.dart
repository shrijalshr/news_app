import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:news_app/models/news_article_model.dart';
import 'package:news_app/repositories/api.dart';

class NewsRepository {
  Future<List<NewsArticleModel>> fetchNews(apiUrl) async {
    var response = await Network().getData("/news-list");

    var data = jsonDecode(response.body);
    print(data);
    List<NewsArticleModel> _articleModelList = [];

    if (response.statusCode == 200) {
      for (var item in data["data"]) {
        NewsArticleModel _articleModel = NewsArticleModel.fromJson(item);
        _articleModelList.add(_articleModel);
      }
      return _articleModelList;
    } else {
      return _articleModelList; // empty list
    }
  }
}
