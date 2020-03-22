import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyTrans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('transform'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: MyTransform(),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: MyTranslate(),
          ),
          SizedBox(height: 50,),
          MyRotate(),
          SizedBox(height: 50,),
          MyScale(),
        ],
      ),
    );
  }
}
class MyTransform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          color: Colors.black,
          // child: Transform(
          //   alignment: Alignment.topRight,//相对于坐标系原点的对齐方式
          //   // transform: Matrix4.skewY(0.3),//沿Y轴倾斜0.3弧度
          //   child: Container(
          //     padding: EdgeInsets.all(8.0),
          //     color: Colors.orange,
          //     child: Text("我旋转了"),
          //   ),
          // ),
        ),
    );
  }
}

class MyTranslate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Transform.translate(
        offset: Offset(-20, -5),
        child: Text("Hello World"),
      ),
    );
  }
}

class MyRotate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration:BoxDecoration(color: Colors.red),
      child: Transform.rotate(
        //旋转90度
        angle:math.pi/2 ,
        child: Text("Hello world"),
      ),
    );
  }
}

class MyScale extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration:BoxDecoration(color: Colors.red),
        child: Transform.scale(
            scale: 1.5, //放大到1.5倍
            child: Text("Hello world")
        )
    );
  }
}