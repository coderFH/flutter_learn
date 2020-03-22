import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文本控件'),
      ),
      body: ListView(
       children: <Widget>[
         MyTextView(),
         MyTextViewRich(),
         MyTextView1(),
         MyDefaultTextStyle(),
       ],
      ),
    );
  }
}

class MyTextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      /*
      * 注意:
      * 1.如果文字很短的时候,虽然设置了居中,但有可能文字并未居中,那是因为Text默认的宽度是包裹文字的,也就是
      宽度不够,这种情况下要想居中,可以外层包裹一个Row,然后设置主轴居中,
      * 2.Text是不能设置宽度和高度的
      * */
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: 0.5, //缩放因子
      style: TextStyle(
        fontSize: 20,
        color: Colors.red
      ),
    );
  }
}


//============================== 富文本 =============================
class MyTextViewRich extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "《定风波》", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
          TextSpan(text: "苏轼", style: TextStyle(fontSize: 18, color: Colors.redAccent)),
          TextSpan(text: "\n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。")
        ]
      ),
      style: TextStyle(fontSize: 20,color: Colors.purple),
      textAlign: TextAlign.left,
    );
  }
}

//============================== 样式 =============================
class MyTextView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "红色+黑色删除线+25号",
          style: TextStyle(
            color: Color(0xffff0000),
            decoration: TextDecoration.lineThrough,
            decorationColor: Color(0xff0000),
            fontSize: 25.0,
          ),
        ),
        Text(
          "橙色+下划线+24号",
          style: TextStyle(
            color: Color(0xfff999000),
            decoration: TextDecoration.underline,
            fontSize: 24.0,
            height: 5,
          ),
        ),
        Text(
          "虚线上划线+23号+倾斜",
          style: TextStyle(
            decoration: TextDecoration.overline,
            decorationStyle: TextDecorationStyle.dashed,
            fontSize: 23.0,
            fontStyle: FontStyle.italic
          ),
        ),
        Text(
          "24号+加粗",
          style: TextStyle(
            fontSize: 23.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            letterSpacing: 6.0,
          ),
        ),
      ],
    );
  }
}

//============================== DefaultTextStyle  =============================
class MyDefaultTextStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      //1.设置文本默认样式
      style: TextStyle(
        color:Colors.red,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.start,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("hello world"),
          Text("I am Jack"),
          Text("I am Jack",
            style: TextStyle(
                inherit: false, //2.不继承默认样式
                color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }
}
