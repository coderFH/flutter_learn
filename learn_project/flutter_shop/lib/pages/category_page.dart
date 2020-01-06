import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/widget/category/right_category_nav.dart';
import 'package:flutter_shop/widget/category/right_goods_list.dart';
import '../widget/category/left_category_nav.dart';

// 分类页
class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("商品分类"),
      ),
      body: Row(
        children: <Widget>[
          LeftCategoryNav(),
          Expanded(
            child: Column(
              children: <Widget>[
                RightCategoryNav(),
                RigthGoodsList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
