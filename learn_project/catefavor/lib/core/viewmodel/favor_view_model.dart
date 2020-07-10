import 'package:catefavor/core/model/meal_model.dart';
import 'package:catefavor/core/viewmodel/base_view_model.dart';

class FHFavorViewModel extends BaseMealViewModel {
  void addMeal(FHMealModel meal) {
    originMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(FHMealModel meal) {
    originMeals.remove(meal);
    notifyListeners();
  }

  void handleMeal(FHMealModel meal) {
    if(isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }

  bool isFavor(FHMealModel meal) {
    return originMeals.contains(meal);
  }
}