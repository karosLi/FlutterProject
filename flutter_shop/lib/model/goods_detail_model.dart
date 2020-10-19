// To parse this JSON data, do
//
//     final goodsDetailModel = goodsDetailModelFromJson(jsonString);

import 'dart:convert';

GoodsDetailModel goodsDetailModelFromJson(String str) => GoodsDetailModel.fromJson(json.decode(str));

String goodsDetailModelToJson(GoodsDetailModel data) => json.encode(data.toJson());

class GoodsDetailModel {
  GoodsDetailModel({
    this.goodInfo,
    this.goodComments,
    this.advertesPicture,
  });

  GoodInfo goodInfo;
  List<dynamic> goodComments;
  AdvertesPicture advertesPicture;

  factory GoodsDetailModel.fromJson(Map<String, dynamic> json) => GoodsDetailModel(
    goodInfo: GoodInfo.fromJson(json["goodInfo"]),
    goodComments: List<dynamic>.from(json["goodComments"].map((x) => x)),
    advertesPicture: AdvertesPicture.fromJson(json["advertesPicture"]),
  );

  Map<String, dynamic> toJson() => {
    "goodInfo": goodInfo.toJson(),
    "goodComments": List<dynamic>.from(goodComments.map((x) => x)),
    "advertesPicture": advertesPicture.toJson(),
  };
}

class AdvertesPicture {
  AdvertesPicture({
    this.pictureAddress,
    this.toPlace,
    this.urlType,
  });

  String pictureAddress;
  String toPlace;
  int urlType;

  factory AdvertesPicture.fromJson(Map<String, dynamic> json) => AdvertesPicture(
    pictureAddress: json["PICTURE_ADDRESS"],
    toPlace: json["TO_PLACE"],
    urlType: json["urlType"],
  );

  Map<String, dynamic> toJson() => {
    "PICTURE_ADDRESS": pictureAddress,
    "TO_PLACE": toPlace,
    "urlType": urlType,
  };
}

class GoodInfo {
  GoodInfo({
    this.image5,
    this.amount,
    this.image3,
    this.image4,
    this.goodsId,
    this.isOnline,
    this.image1,
    this.image2,
    this.giftCouponsOffline,
    this.typeShip,
    this.goodsSerialNumber,
    this.oriPrice,
    this.presentPrice,
    this.comPic,
    this.state,
    this.shopId,
    this.goodsName,
    this.goodsDetail,
  });

  String image5;
  int amount;
  String image3;
  String image4;
  String goodsId;
  String isOnline;
  String image1;
  String image2;
  String giftCouponsOffline;
  int typeShip;
  String goodsSerialNumber;
  double oriPrice;
  double presentPrice;
  String comPic;
  int state;
  String shopId;
  String goodsName;
  String goodsDetail;

  factory GoodInfo.fromJson(Map<String, dynamic> json) => GoodInfo(
    image5: json["image5"],
    amount: json["amount"],
    image3: json["image3"],
    image4: json["image4"],
    goodsId: json["goodsId"],
    isOnline: json["isOnline"],
    image1: json["image1"],
    image2: json["image2"],
    giftCouponsOffline: json["gift_coupons_offline"],
    typeShip: json["TYPE_SHIP"],
    goodsSerialNumber: json["goodsSerialNumber"],
    oriPrice: json["oriPrice"].toDouble(),
    presentPrice: json["presentPrice"].toDouble(),
    comPic: json["comPic"],
    state: json["state"],
    shopId: json["shopId"],
    goodsName: json["goodsName"],
    goodsDetail: json["goodsDetail"],
  );

  Map<String, dynamic> toJson() => {
    "image5": image5,
    "amount": amount,
    "image3": image3,
    "image4": image4,
    "goodsId": goodsId,
    "isOnline": isOnline,
    "image1": image1,
    "image2": image2,
    "gift_coupons_offline": giftCouponsOffline,
    "TYPE_SHIP": typeShip,
    "goodsSerialNumber": goodsSerialNumber,
    "oriPrice": oriPrice,
    "presentPrice": presentPrice,
    "comPic": comPic,
    "state": state,
    "shopId": shopId,
    "goodsName": goodsName,
    "goodsDetail": goodsDetail,
  };
}
