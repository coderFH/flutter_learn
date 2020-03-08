import 'package:flutter/material.dart';

class MyCon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body:  ListView(
        children: <Widget>[
          MyContainer(),
          MyContainer0(),
          MyContainer1(),
          MyContainer2(),
          MyContainer3(),
          MyContainer4()
        ],
      ),
    );
  }
}
class MyContainer extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50,left: 120), //容器外填充
      constraints: BoxConstraints.tightFor(width: 200,height: 150), //卡片大小
      decoration: BoxDecoration(//背景装饰
          gradient: RadialGradient( //背景径向渐变
              colors: [Colors.red, Colors.orange],
              center: Alignment.topLeft,
              radius: .98
          ),
          boxShadow: [ //卡片阴影
            BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0
            )
          ]
      ),
      // transform: Matrix4.rotationZ(.2), //卡片倾斜变换
      alignment: Alignment.center, //卡片内文字居中
      child: Text( //卡片文字
        "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
      ),
    );
  }
}

//============================== 13. Container =============================

class MyContainer0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromRGBO(3, 3, 255, .5),
        width: 500,
        height: 400,
        child: Text("Hello Dart"),
        padding: EdgeInsets.fromLTRB(10.0, 100.0, 0.0, 0.0),
        margin: EdgeInsets.all(10.0),
      ),
    );
  }
}

class MyContainer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        child: Icon(Icons.pets,size: 32,color: Colors.white,),
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(
            color: Colors.redAccent,
            width: 3,
            style: BorderStyle.solid
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 5),
              color: Colors.purple,
              blurRadius: 5
            )
          ],
          gradient: LinearGradient(colors: [
            Colors.green,
            Colors.redAccent
          ])
        ),
      ),
    );
  }
}

class MyContainer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg")
          ),
        ),
      ),
    );
  }
}


class MyContainer3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
//            color: Colors.blue, //设置了decoration,就不能设置color属性,否则会报错
        //添加边框装饰效果
        decoration: BoxDecoration(
          color: Colors.redAccent,
          //设置上下左右四个边框样式
          border: Border.all(
            color: Colors.grey, //边框颜色
            width: 8.0, //边框粗细
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)), //边框的弧度
        ),
        child: Text(
          "Flutter",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28.0),
        ),
      ),
    );
  }
}

class MyContainer4  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.red,
      width: 50,
      height: 50,
      alignment: Alignment(0, 0),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      child: Text("Hello World"),
//      transform: Matrix4.rotationZ(50),
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
              width: 5,
              color: Colors.purple
          ),
//        borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Colors.orange, offset: Offset(10, 10), spreadRadius: 5, blurRadius: 10),
            BoxShadow(color: Colors.blue, offset: Offset(-10, 10), spreadRadius: 5, blurRadius: 10),
          ]
      ),
    );
  }
}




