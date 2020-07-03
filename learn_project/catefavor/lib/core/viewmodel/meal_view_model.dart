import 'package:catefavor/core/services/meal_request.dart';
import 'package:catefavor/core/viewmodel/base_view_model.dart';

class FHMealViewModel extends BaseMealViewModel {
  FHMealViewModel() {
    FHMealRequest.getMealData().then((res){
      meals = res;
    });
  }
}