import 'package:flutter/material.dart';
import 'pages/main/index_main_pages.dart';

class DouBan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣',
      theme: ThemeData(
        primaryColor: Colors.green,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent, //取消点击的水波纹效果
      ),
      home: FHMainPage(),
    );
  }
}
