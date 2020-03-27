import 'package:flutter/material.dart';

class FHGestureDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDemo(),
    );
  }
}

class GestureDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (details) {
          print("手指按下");
          print(details.globalPosition);
          print(details.localPosition);
        },
        onTapUp: (details) {
          print("手指抬起");
        },
        onTapCancel: () {
          print("手势取消");
        },
        onTap: () {
          print("手势点击");
        },
        onDoubleTap: () {
          print("手指双击");
        },
        onLongPress: () {
          print("长按手势");
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
      ),
    );
  }
}

