import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:flutter_shop/network/http_request.dart';
import 'package:flutter_shop/provider/service_url.dart';
import 'package:flutter_shop/model/category_model.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categoryModels = [];


  Future<void> fetchContent() async {
    categoryModels = await getCategoryList();
    notifyListeners();
  }

  /// 获取分类列表
  Future<List<CategoryModel>> getCategoryList() async {
    final formData = {
    };

    try {
      HttpResponse<String> response = await HttpRequest.request(ServiceUrl.categoryPageCategoryUrl, method: 'POST', data: formData, contentType: 'application/x-www-form-urlencoded');
      var map = json.decode(response.data);
      return List<CategoryModel>.from(map['data'].map((x) => CategoryModel.fromJson(x)));
    } catch (e) {
      print(e);
      return null;
    }
  }
}