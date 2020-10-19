import 'package:flutter/material.dart';
import 'package:foodcourt/ui/pages/detail/detail.dart';
import 'package:foodcourt/ui/pages/main/main.dart';
import 'package:foodcourt/ui/pages/meal/meal.dart';

class FCRouter {
  static final String initialRoute = FCMainScreen.routeName;
  static final String mainPage = FCMainScreen.routeName;
  static final String mealPage = FCMealPage.routeName;
  static final String detailPage = FCMealDetailPage.routeName;

  static final Map<String, WidgetBuilder> routers = {
    mainPage: (context) => FCMainScreen(),
    mealPage: (context) => FCMealPage(),
    detailPage: (context) => FCMealDetailPage(),
  };

  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}