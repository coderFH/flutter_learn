import 'package:catefavor/ui/pages/favor/favor_content.dart';
import 'package:flutter/material.dart';

class HYFavorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
      body: Center(
        child: FHFavorContent(),
      ),
    );
  }
}
