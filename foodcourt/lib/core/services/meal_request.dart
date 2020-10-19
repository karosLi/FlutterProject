import 'package:foodcourt/core/model/meal_model.dart';
import 'package:foodcourt/core/services/http_request.dart';

class FCMealRequest {
  static Future<List<FCMealModel>> getMealData() async {
    final String url = "/meal";
    final result = await HttpRequest.request(url);

    final List resultList = result["meal"];
    final List<FCMealModel> models = [];
    for (var json in resultList) {
      models.add(FCMealModel.fromJson(json));
    }

    return models;
  }
}