import 'package:catefavor/core/model/meal_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/int_extension.dart';

class FHDetailContent extends StatelessWidget {

  final FHMealModel _meal;
  FHDetailContent(this._meal);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildBannerImage(),
          buildMakeTitle(context, "制作材料"),
          buildmakeMaterial(context),
          buildMakeTitle(context, "制作步骤"),
          buildMakeSetps(context)
        ],
      ),
    );
  }

  // 1.横幅图片
  Widget buildBannerImage() {
    return Container(
      width: double.infinity,
      child: Image.network(_meal.imageUrl),
    );
  }

  //2. 制作材料
  Widget buildmakeMaterial(BuildContext context) {
    return buildMakeContent(
      context: context,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _meal.ingredients.length,
        itemBuilder: (ctx,index){
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: Text(_meal.ingredients[index]),
            ),

          );
        })
    );
  }

  //3. 制作步骤
  Widget buildMakeSetps(BuildContext context) {
    return buildMakeContent(
      context: context,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
          itemBuilder: (ctx,index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text("#${index+1}"),
              ),
              title: Text(_meal.steps[index]),
            );
          },
          separatorBuilder: (ctx,index) {
            return Divider();
          },
          itemCount: _meal.steps.length
      )
    );
  }

  // 公共方法,设置标题
  Widget buildMakeTitle(BuildContext context,String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Text(title,style: Theme.of(context).textTheme.display3.copyWith(
        fontWeight: FontWeight.bold
      ),),
    );
  }

  // 公共方法,制作材料和步骤的外边框
  Widget buildMakeContent({BuildContext context,Widget child}) {
    return Container(
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.px)
      ),
      width: MediaQuery.of(context).size.width - 30.px,
      child: child);
  }
}
