import 'package:catefavor/core/model/meal_model.dart';
import 'package:catefavor/core/services/http_request.dart';

class FHMealRequest {
  static Future<List<FHMealModel>> getMealData() async {
      //1. 发送网络请求
    final url = "/meal";
    final result = await HttpRequest.request(url);

    print(result);

    // 2. json转modal
    final mealArray = result["meal"];

    List<FHMealModel> meals = [];
    for(var json in mealArray) {
      meals.add(FHMealModel.fromJson(json));
    }

    return meals;
  }
}