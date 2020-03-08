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
          MyButtonDemo()
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

//============================ 按钮的补充 ============================
/*
1.默认情况下Button上下有一定的间距,使用属性 materialTapTargetSize: MaterialTapTargetSize.shrinkWrap 去除间隙
2.Button变小: ButtonTheme 默认button是有宽高的,因为他继承的MaterialButton,在MaterialButton的build方法里,会去除一个ButtonThemeData
而这个样式是有一个最小的宽高,想要修改就要在最外层包括一个ButtonTheme,这样因为他继承的MaterialButton从上下文取Theme的时候,就会取到你定义的这个
3.Button内部有间隙,修改Button的内边距

*/
class MyButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ButtonTheme(
          minWidth: 30,
          height: 10,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            color: Colors.red,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Text("Flat Button1"),
            textColor: Colors.white,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
