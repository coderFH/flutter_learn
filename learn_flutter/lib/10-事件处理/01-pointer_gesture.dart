import 'package:flutter/material.dart';

class FHPointGestureDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListenerDemo(),
    );
  }
}

class ListenerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Listener(
        onPointerDown: (event) {
          print('指针按下: $event');
          print(event.position); //按下的点相对于整个屏幕的位置
          print(event.localPosition); // 按下的点在红色视图内的位置
        },
        onPointerMove: (event) {
          print('指针移动: $event');
        },
        onPointerUp: (event) {
          print('指针抬起: $event');
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

