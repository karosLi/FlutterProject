import 'package:flutter/material.dart';
import 'package:foodcourt/core/model/category_model.dart';
import 'package:foodcourt/ui/pages/meal/meal_content.dart';

class FCMealPage extends StatelessWidget {
  static const String routeName = "/meal";

  @override
  Widget build(BuildContext context) {
    // 获取参数
    final category = ModalRoute.of(context).settings.arguments as FCCategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body:FCMealContent(),
    );
  }
}
