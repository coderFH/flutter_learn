import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/category_child_provide.dart';
import 'package:provide/provide.dart';
import '../../model/category_model.dart';
import 'package:flutter_shop/provide/category_goods_list_Provide.dart';
import 'package:flutter_shop/model/category_list_model.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'dart:convert';

class RightCategoryNav extends StatefulWidget {
  RightCategoryNav({Key key}) : super(key: key);

  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Provide<ChildCategoryPrivode>(
         builder: (context,child,childCategory) {
           return Container(
            height: ScreenUtil().setHeight(80),
            width: ScreenUtil().setWidth(570),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 1,color: Colors.red
                )
              )
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: childCategory.childCategoryList.length,
              itemBuilder: (context,index) {
                return _rightInkWell(index,childCategory.childCategoryList[index]);
              },
            ),
          );
         },
       )
    );
  }

  Widget _rightInkWell(int index,BxMallSubDto  item) {
    bool isChecked = false;
    isChecked = (index == Provide.value<ChildCategoryPrivode>(context).childIndex) ? true : false;
    return InkWell(
      onTap: (){
        _getGoodList(categorySubId: item.mallSubId);
        Provide.value<ChildCategoryPrivode>(context).changeChildIndex(index, item.mallSubId);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item.mallSubName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28),
            color: isChecked ? Colors.pink : Colors.black
          ),
        ),
      ),
    );
  }

  //获取商品列表数据
  void _getGoodList({String categorySubId}) async {
    var data = {
      'categoryId': Provide.value<ChildCategoryPrivode>(context).categoryId,
      'categorySubId':categorySubId,
      'page':1
    };
    await request('getMallGoods',formData:data).then((val) {
      var data = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      if (goodsList.data == null) {
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);
      } else {
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data);
      }
    });
  }
}
