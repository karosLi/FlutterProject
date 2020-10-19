import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:foodcourt/core/model/category_model.dart';
import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/viewmodel/meal_view_model.dart';
import 'package:foodcourt/ui/pages/meal/meal_item.dart';
import 'package:provider/provider.dart';

class FCMealContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 获取参数
    final category = ModalRoute.of(context).settings.arguments as FCCategoryModel;

    return FCMealContentSelector(category: category);
  }
}

/// Selector - 可以决定是否需要重新 build
class FCMealContentSelector extends StatelessWidget {
  const FCMealContentSelector({
    Key key,
    @required this.category,
  }) : super(key: key);

  final FCCategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Selector<FCMealViewModel, List<FCMealModel>> (
      selector: (context, mealVM) => mealVM.meals.where((meal) {
        return meal.categories.contains(category.id);
      }).toList(),
      shouldRebuild: (List<FCMealModel> pre, List<FCMealModel> next) {
        return !ListEquality().equals(pre, next);
      },
      builder: (context, List<FCMealModel> meals, child) {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            FCMealModel meal = meals[index];
            return FCMealItem(meal);
          }
        );
      },
    );
  }
}

/// Consumer - 每次都需要重新build
class FCMealContentConsumer extends StatelessWidget {
  const FCMealContentConsumer({
    Key key,
    @required this.category,
  }) : super(key: key);

  final FCCategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Consumer<FCMealViewModel>(
      builder: (context, mealVM, child) {
        final List<FCMealModel> meals = mealVM.meals.where((meal) {
          return meal.categories.contains(category.id);
        }).toList();

        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            FCMealModel meal = meals[index];
            return ListTile(
              title: Text("${meal.title}"),
            );
          }
        );
      }
    );
  }
}
