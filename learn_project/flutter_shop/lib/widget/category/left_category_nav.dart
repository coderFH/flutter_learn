import 'dart:convert';
import 'package:provide/provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'package:flutter_shop/provide/category_child_provide.dart';
import 'package:flutter_shop/service/service_method.dart';
import '../../model/category_list_model.dart';
import '../../provide/category_goods_list_Provide.dart';

class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list = [];
  var listIndex = 0;

  @override
  void initState() { 
    _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,index) {
          return _leftInkWel(index);
        },
      ),
    );
  }

  Widget _leftInkWel(int index) {
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;

    return InkWell(
      onTap: (){
        setState(() {
          listIndex = index;
        });
        var childList = list[index].bxMallSubDto;
        Provide.value<ChildCategoryPrivode>(context).setChildCategory(childList,list[listIndex].mallCategoryId);
        _getCategoryGoodsList(categoryId: list[index].mallCategoryId);
      },
      child: Container(
        height: ScreenUtil().setHeight(80),
        padding: EdgeInsets.only(left: 20,top: 20),
        decoration: BoxDecoration(
          color: isClick?Color.fromRGBO(236, 238, 239, 1.0): Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12
            )
          )
        ),
        child: Text(list[index].mallCategoryName,style: TextStyle(fontSize:ScreenUtil().setSp(28)),),
      ),
    );
  }

  //获取一级分类
  void _getCategory() async {
    await request('getCategory').then((value){
      var data = json.decode(value);
      CategoryModel category = CategoryModel.fromJson(data);
      setState(() {
        list = category.data;
      });
      Provide.value<ChildCategoryPrivode>(context).setChildCategory(list[listIndex].bxMallSubDto,list[listIndex].mallCategoryId);
      _getCategoryGoodsList(categoryId: list[listIndex].mallCategoryId);
    });
  }

  //获取商品列表
  void _getCategoryGoodsList({String categoryId}) async {
    var data = {
      'categoryId': categoryId,
      'categorySubId':"",
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