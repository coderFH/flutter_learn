import 'package:catefavor/core/model/meal_model.dart';
import 'package:flutter/cupertino.dart';

class BaseMealViewModel extends ChangeNotifier {
  List<FHMealModel> _meals = [];

  List<FHMealModel> get meals => _meals;

  set meals(List<FHMealModel> value) {
    _meals = value;
    notifyListeners();
  }
}