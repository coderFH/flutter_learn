import 'package:flutter/material.dart';

class FHBubblingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BubblingDemo2(),
    );
  }
}

//1.我想分别监听黄色和红色的点击,但是当点击红色view的时候,有几率响应黄色的view
class BubblingDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (details) {
          print('黄色view点击了');
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.yellow,
          alignment: Alignment.center,
          child: GestureDetector(
            onTapDown: (details) {
              print('红色view点击了');
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

//2.解决点击红色view,会偶尔响应黄色view事件的问题
class BubblingDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GestureDetector(
            onTapDown: (details) {
              print('黄色view点击了');
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.yellow,
            ),
          ),
          GestureDetector(
            onTapDown: (details) {
              print('红色view点击了');
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}


//3. 阻止红色view的事件
class BubblingDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GestureDetector(
            onTapDown: (details) {
              print('黄色view点击了');
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.yellow,
            ),
          ),
          IgnorePointer(
            child: GestureDetector(
              onTapDown: (details) {
                print('红色view点击了');
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

