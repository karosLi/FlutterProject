import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_shop/model/goods_detail_model.dart';
import 'package:flutter_shop/model/cart_info_model.dart';

class CartProvider with ChangeNotifier {
  List<CartInfoModel> cartGoodsList = [];

  int totalCount = 0;
  String totalPrice = "0.00";
  bool allCheck = false;

  void addToCart(GoodInfo goods, int count) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String cartGoodsListStr = preferences.getString("cartInfoList");
    var temp = cartGoodsListStr == null ? [] : json.decode(cartGoodsListStr);
    List<Map> tempList = (temp as List).cast();

    bool isHave = false;
    int i = 0;
    tempList.forEach((item) {
      if (item["goodsId"] == goods.goodsId) {
        item["count"] = item["count"] + count;
        if (i < cartGoodsList.length) {
          cartGoodsList[i].count = cartGoodsList[i].count + count;
        }

        isHave = true;
      }
      i++;
    });

    if (!isHave) {
      Map<String, dynamic> map = {
        "goodsId": goods.goodsId,
        "goodsName": goods.goodsName,
        "count": count,
        "price": goods.presentPrice,
        "images": goods.image1
      };

      tempList.add(map);
      CartInfoModel item = CartInfoModel.fromJson(map);
      item.isCheck = true;
      cartGoodsList.add(item);
    }

    preferences.setString("cartInfoList", json.encode(tempList).toString());
    print("购物车模型 ${cartGoodsList.first.count}");
    calcTotal();
    notifyListeners();
  }

  void remove() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("cartInfoList");
    cartGoodsList = [];
    calcTotal();
    notifyListeners();
  }

  void loadCartInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String cartGoodsListStr = preferences.getString("cartInfoList");
    if (cartGoodsListStr == null) {
      cartGoodsList = [];
    } else {
      var temp = json.decode(cartGoodsListStr);
      List<Map> tempList = (temp as List);
      tempList.forEach((item) {
        cartGoodsList.add(CartInfoModel.fromJson(item));
      });
    }
    notifyListeners();
  }

  void updateIemCount(CartInfoModel updateItem, int count) async {
    Map<String, dynamic> map = updateItem.toJson();
    GoodInfo goods = GoodInfo();
    goods.goodsId = updateItem.goodsId;
    goods.goodsName = updateItem.goodsName;
    goods.image1 = updateItem.images;
    goods.presentPrice = updateItem.price;
    addToCart(goods, count);
  }

  void switchItemCheck(CartInfoModel item) async {
    item.isCheck = !item.isCheck;
    calcTotal();
    notifyListeners();
  }

  void removeItem(CartInfoModel goods) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String cartGoodsListStr = preferences.getString("cartInfoList");
    var temp = cartGoodsListStr == null ? [] : json.decode(cartGoodsListStr);
    List<Map> tempList = (temp as List).cast();

    var needToDeleteItem;
    for (var item in tempList) {
      if (item["goodsId"] == goods.goodsId) {
        needToDeleteItem = item;
        break;
      }
    }

    if (needToDeleteItem != null) {
      tempList.remove(needToDeleteItem);
      cartGoodsList.remove(goods);
      preferences.setString("cartInfoList", json.encode(tempList).toString());
    }

    calcTotal();
    notifyListeners();
  }

  void switchAllItemCheck(bool check) async {
    for (var item in cartGoodsList) {
      item.isCheck = check;
    }

    allCheck = check;
    calcTotal();
    notifyListeners();
  }

  void calcTotal() async {
    int count = 0;
    double price = 0;

    for (var item in cartGoodsList) {
      if (!item.isCheck) {
        continue;
      }

      count += item.count;
      price += item.price * item.count;
    }

    /// https://sites.google.com/site/dartlangexamples/api/dart-core/interfaces/comparable-hashable/num/double
    totalCount = count;
    totalPrice = price.toStringAsFixed(2);
  }
}