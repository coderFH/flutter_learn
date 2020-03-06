import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮控件'),
      ),
      body: ListView(
        children: <Widget>[
          MyButton2(),
        ],
      ),
    );
  }
}

class MyButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FloatingActionButton(
          child: Text("FloatingActionButton"),
          onPressed: (){
            print("FloatingActionButton click");
          },
        ),
        RaisedButton(
          child: Text("RaisedButton"),
          onPressed: (){
            print("RaisedButton click");
          },
        ),
        FlatButton(
          child: Text("FlatButton"),
          onPressed: (){
            print("FlatButton click");
          },
        ),
        OutlineButton(
          child: Text("OutlineButton"),
          onPressed: (){
            print("OutlineButton click");
          },
        ),

        RaisedButton(
          child: Text("同意协议",style: TextStyle(color: Colors.white)),
          color: Colors.orangeAccent,
          highlightColor: Colors.orange[700],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          onPressed: (){
            print("同意协议");
          },
        ),
        // 5.自定义button: 图标-文字-背景-圆角
        FlatButton(
          color: Colors.amberAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.favorite, color: Colors.red,),
              Text("喜欢作者")
            ],
          ),
          onPressed: () {},
        )
      ],
    );
  }
}