import 'dart:convert';

import 'package:news_app/models/category_model.dart';

import 'api.dart';

class CategoryRepository {
  Future<List<CategoryModel>> fetchCategory() async {
    var response = await Network().getData("/category-list");

    var data = jsonDecode(response.body);
    print(data);
    List<CategoryModel> _categoryList = [];

    if (response.statusCode == 200) {
      data.forEach((e) {
        print(e);
        CategoryModel _articleModel = CategoryModel.fromJson(e);
        print(_articleModel.category);
        _categoryList.add(_articleModel);
      });

      return _categoryList;
    } else {
      return _categoryList; // empty list
    }
  }
}
