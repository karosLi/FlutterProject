// To parse this JSON data, do
//
//     final fcMealModel = fcMealModelFromJson(jsonString);

import 'dart:convert';

FCMealModel fcMealModelFromJson(String str) => FCMealModel.fromJson(json.decode(str));

String fcMealModelToJson(FCMealModel data) => json.encode(data.toJson());

const List<String> complex = ["简单", "中等", "困难"];

class FCMealModel {
  FCMealModel({
    this.id,
    this.categories,
    this.title,
    this.affordability,
    this.complexity,
    this.complexityText,
    this.imageUrl,
    this.duration,
    this.ingredients,
    this.steps,
    this.isGlutenFree,
    this.isVegan,
    this.isVegetarian,
    this.isLactoseFree,
  });

  String id;
  List<String> categories;
  String title;
  int affordability;
  int complexity;
  String complexityText;
  String imageUrl;
  int duration;
  List<String> ingredients;
  List<String> steps;
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;

  factory FCMealModel.fromJson(Map<String, dynamic> json) => FCMealModel(
    id: json["id"],
    categories: List<String>.from(json["categories"].map((x) => x)),
    title: json["title"],
    affordability: json["affordability"],
    complexity: json["complexity"],
    complexityText: complex[json["complexity"]],
    imageUrl: json["imageUrl"],
    duration: json["duration"],
    ingredients: List<String>.from(json["ingredients"].map((x) => x)),
    steps: List<String>.from(json["steps"].map((x) => x)),
    isGlutenFree: json["isGlutenFree"],
    isVegan: json["isVegan"],
    isVegetarian: json["isVegetarian"],
    isLactoseFree: json["isLactoseFree"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "title": title,
    "affordability": affordability,
    "complexity": complexity,
    "imageUrl": imageUrl,
    "duration": duration,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
    "steps": List<dynamic>.from(steps.map((x) => x)),
    "isGlutenFree": isGlutenFree,
    "isVegan": isVegan,
    "isVegetarian": isVegetarian,
    "isLactoseFree": isLactoseFree,
  };
}
