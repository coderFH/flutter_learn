import 'package:catefavor/core/model/category_model.dart';
import 'package:catefavor/core/model/meal_model.dart';
import 'package:catefavor/core/viewmodel/meal_view_model.dart';
import 'package:catefavor/ui/widgets/meal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FHMealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as FHCategoryModel;

    return Selector<FHMealViewModel,List<FHMealModel>>(
//        shouldRebuild: (prev,next) => !ListEquality().equals(prev, next),
        builder: (ctx,meals,child) {
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx,index){
              return FHMealItem(meals[index]);
            });
        },
        selector: (ctx,mealVM) {
          return mealVM.meals.where((meal){
            return meal.categories.contains(category.id);
          }).toList();
        }
    );
  }
}
