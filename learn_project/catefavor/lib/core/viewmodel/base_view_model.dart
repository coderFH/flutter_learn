import 'package:catefavor/core/model/meal_model.dart';
import 'package:catefavor/core/viewmodel/filter_view_model.dart';
import 'package:flutter/cupertino.dart';

class BaseMealViewModel extends ChangeNotifier {
  List<FHMealModel> _meals = [];

  FHFilterViewModel _filterVM;

  void updateFilters(FHFilterViewModel filterVM) {
    _filterVM = filterVM;
  }

  List<FHMealModel> get meals {
    return _meals.where((meal){
      if(_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
     return true;
    }).toList();
  }

  List<FHMealModel> get originMeals {
    return _meals;
  }

  set meals(List<FHMealModel> value) {
    _meals = value;
    notifyListeners();
  }
}