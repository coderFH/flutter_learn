import 'dart:convert';

import 'package:catefavor/core/model/category_model.dart';
import 'package:flutter/services.dart';

class FHJsonParse {
  static Future<List<FHCategoryModel>> getCategoryData() async {
    // 1. 加载json文件
    final jsonString = await rootBundle.loadString("assets/json/category.json");

    // 2. 将jsonString转换成Map/list
    final result = json.decode(jsonString);


    // 3.将map中的内容转成一个个对象
    final resultList = result["category"];
    List<FHCategoryModel> categories = [];
    for(var json in resultList) {
      categories.add(FHCategoryModel.fromJson(json));
    }

    return categories;
  }
}