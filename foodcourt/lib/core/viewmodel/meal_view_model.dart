import 'package:flutter/material.dart';
import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/services/meal_request.dart';

class FCMealViewModel extends ChangeNotifier {
  List<FCMealModel> _meals = [];

  List<FCMealModel> get meals {
    return _meals;
  }

  FCMealViewModel() {
    FCMealRequest.getMealData().then((value) {
      _meals = value;
      this.notifyListeners();
    });
  }
}