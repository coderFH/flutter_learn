import 'package:flutter/material.dart';

class MyProgress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyProgressState();
  }
}

class MyProgressState extends State<MyProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('progress'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 30,),
          LinearProgressIndicator(
            backgroundColor: Colors.red,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          SizedBox(height: 30,),
          LinearProgressIndicator(
            backgroundColor: Colors.red,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),

          // 模糊进度条(会执行一个旋转动画)
          CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),

          SizedBox(
            height: 100,
            width: 100,
            //进度条显示50%，会显示一个半圆
            child:  CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
          ),

        ],
      ),
    );
  }
}