import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';

class Anchor {
  String nickname;
  String roomName;
  String imageUrl;

  Anchor({
    this.nickname,
    this.roomName,
    this.imageUrl
  });

  Anchor.withMap(Map<String, dynamic> parsedMap) {
    this.nickname = parsedMap["nickname"];
    this.roomName = parsedMap["roomName"];
    this.imageUrl = parsedMap["roomSrc"];
  }
}

Future<List<Anchor>> getAnchors() async {
  //1.读取json文件
  String jsonString = await rootBundle.loadString("assets/yz.json");

  //2.转成List或者Map类型
  final jsonResult = json.decode(jsonString);

  //3.遍历List,并转成Anchor对象放到另一个List中
  List<Anchor> anchors = new List();
  for(Map<String,dynamic> map in jsonResult) {
    anchors.add(Anchor.withMap(map));
  }
  return anchors;
}