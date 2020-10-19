import 'package:flutter/cupertino.dart';

class FCCategoryModel {
  String id;
  String title;
  String color;
  Color finalColor;

  FCCategoryModel({this.id, this.title, this.color});

  FCCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    int colorInt = int.parse(color, radix: 16);
    colorInt = colorInt | 0xFF000000;
    finalColor = Color(colorInt);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}