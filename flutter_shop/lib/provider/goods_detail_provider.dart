import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:flutter_shop/network/http_request.dart';
import 'package:flutter_shop/provider/service_url.dart';
import 'package:flutter_shop/model/goods_detail_model.dart';

class GoodsDetailProvider with ChangeNotifier {
  String goodsId;
  GoodsDetailModel model;

  bool isLeft = true;
  bool isRight = false;

  GoodsDetailProvider(this.goodsId);

  Future<void> fetchGoodsDetail() async {
    model = await getGoodsListDetail();
    notifyListeners();
  }

  /// 获取商品详情
  Future<GoodsDetailModel> getGoodsListDetail() async {
    final formData = {
      'goodId': goodsId,
    };

    try {
      HttpResponse<String> response = await HttpRequest.request(ServiceUrl.goodsDetailUrl, method: 'POST', data: formData, contentType: 'application/x-www-form-urlencoded');
      var map = json.decode(response.data);
      return GoodsDetailModel.fromJson(map['data']);
    } catch (e) {
      print(e);
      return GoodsDetailModel();
    }
  }

  void changeLeftOrRight(String tabName) {
    if (tabName == 'left') {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}