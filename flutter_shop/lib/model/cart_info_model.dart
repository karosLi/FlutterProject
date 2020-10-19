import 'dart:convert';

class CartInfoModel {
  CartInfoModel({
    this.goodsId,
    this.goodsName,
    this.images,
    this.price,
    this.count,
    this.isCheck = true
  });

  String goodsId;
  String goodsName;
  String images;
  double price;
  int count;
  bool isCheck;

  factory CartInfoModel.fromJson(Map<String, dynamic> json) =>
      CartInfoModel(
        goodsId: json["goodsId"],
        goodsName: json["goodsName"],
        images: json["images"],
        price: json["price"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() =>
      {
        "goodsId": goodsId,
        "goodsName": goodsName,
        "images": images,
        "price": price,
        "count": count,
      };
}