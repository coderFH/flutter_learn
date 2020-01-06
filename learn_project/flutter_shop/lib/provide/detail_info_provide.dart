import 'package:flutter/material.dart';
import '../model/detail_model.dart';
import '../service/service_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier {

  DetailsModel goodsDetail = null;
  bool isLeft = true;
  bool isRight = false;

  // DetailsModel get goodsDetail => _goodsDetail;

  getGoodsInfo(String id) async {
    var formData = {'goodId':id,};
    await request('getGoodDetailById',formData: formData).then((val){
      var responseData = json.decode(val.toString());
      goodsDetail = DetailsModel.fromJson(responseData);
      notifyListeners();
    });
  }

  changeLeftAndRight(String changeState) {
    if (changeState == "left") {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}
