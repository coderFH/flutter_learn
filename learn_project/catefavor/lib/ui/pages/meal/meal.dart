import 'package:catefavor/core/model/category_model.dart';
import 'package:catefavor/ui/pages/meal/meal_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FHMealScreen extends StatelessWidget {
  static const String routeName = "/meal";

  @override
  Widget build(BuildContext context) {
    // 获取参数
    final category = ModalRoute.of(context).settings.arguments as FHCategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: FHMealContent(),
    );
  }
}
