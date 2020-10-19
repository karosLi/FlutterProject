import 'package:flutter/material.dart';
import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/viewmodel/meal_favorite_view_model.dart';
import 'package:foodcourt/ui/pages/meal/meal_item.dart';
import 'package:provider/provider.dart';

class FCFavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏"),
      ),
      body: Consumer<FCFavoriteViewModel>(
        builder: (context, vm, child) {
          if (vm.favorites.length == 0) {
            return Center(
              child: Text("未收藏美食", style: TextStyle(fontSize: 18)),
            );
          }

          return ListView.builder(
            itemCount: vm.favorites.length,
            itemBuilder: (context, index) {
              FCMealModel meal = vm.favorites[index];
              return FCMealItem(meal);
            }
          );
        }
      )
    );
  }
}
