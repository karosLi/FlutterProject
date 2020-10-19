import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:flutter_shop/network/http_request.dart';
import 'package:flutter_shop/provider/service_url.dart';
import 'package:flutter_shop/model/home_model.dart';
import 'package:flutter_shop/model/home_hot_model.dart';

class HomeProvider with ChangeNotifier {
  HomeModel model;
  List<HomeHotModel> hotModels = [];
  bool hasNoMoreHotModels = false;
  int _page = 1;
  int _pageSize = 20;

  Future<void> fetchContent() async {
    _page = 1;
    hotModels.removeRange(0, hotModels.length);
    hasNoMoreHotModels = false;
    model = await getHomePageContent();
    hotModels = await getHomePageHotContent() ?? [];
    notifyListeners();
  }

  Future<void> loadMore() async {
    print('page $_page');
    List<HomeHotModel> hotModels = await getHomePageHotContent();
    if (hotModels != null && hotModels.length > 0) {
      this.hotModels += hotModels;
    }
    notifyListeners();
  }

  /// 获取主页内容
  Future<HomeModel> getHomePageContent() async {
    final formData = {
      'lon': '115.02932',
      'lat': '35.76189'
    };

    try {
      HttpResponse<String> response = await HttpRequest.request(ServiceUrl.homePageContentUrl, method: 'POST', data: formData, contentType: 'application/x-www-form-urlencoded');
      var map = json.decode(response.data);
      return HomeModel.fromJson(map['data']);
    } catch (e) {
      print(e);
      return null;
    }
  }

  /// 获取主页火爆专区商品
  Future<List<HomeHotModel>> getHomePageHotContent() async {
    int page = _page;
    final formData = {
      'page': page
    };

    try {
      HttpResponse<String> response = await HttpRequest.request(ServiceUrl.homePageHotContentUrl, method: 'POST', data: formData, contentType: 'application/x-www-form-urlencoded');
      var map = json.decode(response.data);
      print(map);
      List<HomeHotModel> list =  List<HomeHotModel>.from(map['data'].map((x) => HomeHotModel.fromJson(x)));
      if (list.length == _pageSize) {
        _page++;
      } else {
        hasNoMoreHotModels = true;
      }

      return list;
    } catch (e) {
      return null;
    }
  }
}