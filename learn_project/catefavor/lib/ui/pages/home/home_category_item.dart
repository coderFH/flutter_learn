import 'package:catefavor/core/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catefavor/core/extension/int_extension.dart';

class FHHomeCategoryItem extends StatelessWidget {
  final FHCategoryModel _category;
  FHHomeCategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    final bgColor = _category.cColor;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.px),
        gradient: LinearGradient(
          colors: [
            bgColor.withOpacity(.5),
            bgColor
          ]
        )
      ),
      alignment: Alignment.center,
      child: Text(_category.title,style: Theme.of(context).textTheme.display2.copyWith(
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
