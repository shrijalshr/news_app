import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:news_app/models/news_article_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/repositories/api.dart';

class NewsRepository {
  Future<List<NewsArticleModel>> fetchNewsList(apiUrl) async {
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

  Future<List<NewsModel>> fetchNews(int id, apiUrl) async {
    var response = await Network().getData("/news/$id");

    var data = jsonDecode(response.body);
    print(data);
    List<NewsModel> _newsModelList = [];

    if (response.statusCode == 200) {
      for (var item in data) {
        NewsModel _articleModel = NewsModel.fromJson(item);
        _newsModelList.add(_articleModel);
      }
      return _newsModelList;
    } else {
      return _newsModelList; // empty list
    }
  }
}
