import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodcourt/core/model/category_model.dart';

class JsonParse {
  static Future<List<FCCategoryModel>> getCategoryData() async {
    final String jsonString = await rootBundle.loadString("assets/json/category.json");

    final Map result = json.decode(jsonString);
    final List resultList = result["category"];

    List<FCCategoryModel> models = [];
    for (var json in resultList) {
      models.add(FCCategoryModel.fromJson(json));
    }

    return models;
  }
}