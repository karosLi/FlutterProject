// To parse this JSON data, do
//
//     final homeHotModel = homeHotModelFromJson(jsonString);

import 'dart:convert';

HomeHotModel homeHotModelFromJson(String str) => HomeHotModel.fromJson(json.decode(str));

String homeHotModelToJson(HomeHotModel data) => json.encode(data.toJson());

class HomeHotModel {
  HomeHotModel({
    this.name,
    this.image,
    this.mallPrice,
    this.goodsId,
    this.price,
  });

  String name;
  String image;
  double mallPrice;
  String goodsId;
  double price;

  factory HomeHotModel.fromJson(Map<String, dynamic> json) => HomeHotModel(
    name: json["name"],
    image: json["image"],
    mallPrice: json["mallPrice"].toDouble(),
    goodsId: json["goodsId"],
    price: json["price"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "mallPrice": mallPrice,
    "goodsId": goodsId,
    "price": price,
  };
}
