import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:flutter_shop/network/http_request.dart';
import 'package:flutter_shop/provider/service_url.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'package:flutter_shop/model/category_goods_model.dart';

class ChildCategoryProvider with ChangeNotifier {
  /// 选中的分类
  CategoryModel selectedCategory;
  int selectedCategoryIndex = -1;

  /// 选中的子分类
  BxMallSubDto selectedSubCategory;
  int selectedSubCategoryIndex = 0;

  /// 分类下的商品
  List<CategoryGoodsModel> categoryGoodsModels;
  bool hasNoMoreCategoryGoodsModels = false;
  int _page = 1;
  int _pageSize = 20;

  /// 选择分类
  void selectCategory(CategoryModel selectedCategory, int selectedCategoryIndex) {
    if (selectedCategory != null) {
      this.selectedCategory = selectedCategory;
      this.selectedCategoryIndex = selectedCategoryIndex;

      selectSubCategory(selectedCategory.bxMallSubDto.first, 0);
    } else {
      this.categoryGoodsModels = [];
      notifyListeners();
    }
  }

  /// 选择子分类
  void selectSubCategory(BxMallSubDto selectedSubCategory, int selectedSubCategoryIndex) {
    this.selectedSubCategory = selectedSubCategory;
    this.selectedSubCategoryIndex = selectedSubCategoryIndex;
    refreshGoodsList();
  }

  Future<void> refreshGoodsList() async {
    _page = 1;
    hasNoMoreCategoryGoodsModels = false;
    if (categoryGoodsModels != null) {
      categoryGoodsModels.removeRange(0, categoryGoodsModels.length);
    }
    categoryGoodsModels = await getCategoryGoodsList();
    notifyListeners();
  }

  Future<void> loadMore() async {
    print('page $_page');
    List<CategoryGoodsModel> categoryGoodsModels = await getCategoryGoodsList();
    if (categoryGoodsModels != null && categoryGoodsModels.length > 0) {
      this.categoryGoodsModels += categoryGoodsModels;
    }
    notifyListeners();
  }

  /// 获取分类商品列表
  Future<List<CategoryGoodsModel>> getCategoryGoodsList() async {
    if (selectedCategory == null) {
      return [];
    }

    final formData = {
      'categoryId': selectedCategory.mallCategoryId,
      'categorySubId': selectedSubCategoryIndex == 0  ? '' : selectedSubCategory.mallSubId,
      'page': _page
    };

    try {
      HttpResponse<String> response = await HttpRequest.request(ServiceUrl.categoryPageMallGoodsUrl, method: 'POST', data: formData, contentType: 'application/x-www-form-urlencoded');
      var map = json.decode(response.data);
      print(map);
      List<CategoryGoodsModel> list =  List<CategoryGoodsModel>.from(map['data'].map((x) => CategoryGoodsModel.fromJson(x)));
      if (list.length == _pageSize) {
        _page++;
      } else {
        hasNoMoreCategoryGoodsModels = true;
      }

      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }
}