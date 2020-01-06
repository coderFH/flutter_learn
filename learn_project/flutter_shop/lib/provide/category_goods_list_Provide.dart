import 'package:flutter/material.dart';
import '../model/category_list_model.dart';

class CategoryGoodsListProvide with ChangeNotifier {
  List<CategoryListData> _goodsList = [];

  List get goodsList => _goodsList;

  //点击大类时更换商品列表
  getGoodsList(List<CategoryListData> list) {
    _goodsList = list;
    notifyListeners();
  }

  addGoodsList(List<CategoryListData> goodsList) {
    _goodsList.addAll(goodsList);
    notifyListeners();
  }
}