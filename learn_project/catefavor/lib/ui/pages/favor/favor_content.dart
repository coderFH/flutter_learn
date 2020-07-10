import 'package:catefavor/core/viewmodel/favor_view_model.dart';
import 'package:catefavor/ui/widgets/meal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FHFavorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FHFavorViewModel>(
      builder: (ctx,favorVM,child){
        if(favorVM.meals.length == 0) {
          return Center(
            child: Text("未收藏美食"),
          );
        }
        return ListView.builder(
          itemCount: favorVM.meals.length,
          itemBuilder: (itemCtx,index) {
            return FHMealItem(favorVM.meals[index]);
          }
        );
      },
    );
  }
}
