import 'package:flutter/material.dart';
import '../model/category_model.dart';

class ChildCategoryPrivode with ChangeNotifier {

  List<BxMallSubDto> _childCategoryList = [];
  String _categoryId = '4'; //大类id
  String _subId = ''; //小类id
  int _childIndex = 0;//二级分类默认角标
  int page = 1;//列表页数，当改变大类或者小类时进行改变
  String noMoreText = ''; //显示更多的标识

  List get childCategoryList => _childCategoryList;
  int get childIndex => _childIndex;
  String get categoryId => _categoryId;
  String get subId => _subId;

  setChildCategory(List<BxMallSubDto> list,String id) {
    _categoryId = id;
    _subId = '';// 点击大类时，把子类ID清空
    _childIndex = 0;

    //改变大类时,重置
    page = 1;
    noMoreText = '';

    //右侧分类前加上全部
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '';
    all.mallCategoryId = '';
    all.mallSubName = '全部';
    all.comments = 'null';
    _childCategoryList = [all];
    _childCategoryList.addAll(list);
    notifyListeners();
  }

  //更新角标
  changeChildIndex(int index,String id) {
    _childIndex = index;
    _subId = id;

    //改变小类时,重置
    page = 1;
    noMoreText = '';
    notifyListeners();
  }

  //更新页面
  addPage() {
    page++;
    notifyListeners();
  }

  //更新提示文本
  changeNoMore(String text) {
    noMoreText = text;
    notifyListeners();
  }
}