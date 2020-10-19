// To parse this JSON data, do
//
//     final categoryGoodsModel = categoryGoodsModelFromJson(jsonString);

import 'dart:convert';

CategoryGoodsModel categoryGoodsModelFromJson(String str) => CategoryGoodsModel.fromJson(json.decode(str));

String categoryGoodsModelToJson(CategoryGoodsModel data) => json.encode(data.toJson());

class CategoryGoodsModel {
  CategoryGoodsModel({
    this.image,
    this.oriPrice,
    this.presentPrice,
    this.goodsName,
    this.goodsId,
  });

  String image;
  double oriPrice;
  double presentPrice;
  String goodsName;
  String goodsId;

  factory CategoryGoodsModel.fromJson(Map<String, dynamic> json) => CategoryGoodsModel(
    image: json["image"],
    oriPrice: json["oriPrice"].toDouble(),
    presentPrice: json["presentPrice"].toDouble(),
    goodsName: json["goodsName"],
    goodsId: json["goodsId"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "oriPrice": oriPrice,
    "presentPrice": presentPrice,
    "goodsName": goodsName,
    "goodsId": goodsId,
  };
}
