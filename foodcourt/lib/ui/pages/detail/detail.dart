import 'package:flutter/material.dart';
import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/viewmodel/meal_favorite_view_model.dart';
import 'package:foodcourt/ui/pages/detail/detail_content.dart';
import 'package:provider/provider.dart';

class FCMealDetailPage extends StatelessWidget {
  static const String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    // 获取参数
    final meal = ModalRoute.of(context).settings.arguments as FCMealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: FCDetailContent(meal),
      floatingActionButton: Consumer<FCFavoriteViewModel>(
        builder: (context, vm, child) {
          final bool isFavorite = vm.isFavorite(meal);
          return FloatingActionButton(
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.black,
            ),
            onPressed: () {
              vm.switchFavorite(meal);
            },
          );
        },
      ),
    );
  }
}