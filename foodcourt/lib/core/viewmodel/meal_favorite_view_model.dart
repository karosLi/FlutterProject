import 'package:flutter/material.dart';
import 'package:foodcourt/core/model/meal_model.dart';

class FCFavoriteViewModel extends ChangeNotifier {
  List<FCMealModel> _favorites = [];

  List<FCMealModel> get favorites {
    return _favorites;
  }

  void addFavorite(FCMealModel meal) {
    _favorites.add(meal);
    this.notifyListeners();
  }

  void removeFavorite(FCMealModel meal) {
    _favorites.remove(meal);
    this.notifyListeners();
  }

  bool isFavorite(FCMealModel meal) {
    return _favorites.contains(meal);
  }

  void switchFavorite(FCMealModel meal) {
    if (this.isFavorite(meal)) {
      this.removeFavorite(meal);
    } else {
      this.addFavorite(meal);
    }
  }
}