import 'package:flutter/material.dart';

class ClipTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 头像  
    Widget avatar = Image.asset("images/1.png", width: 60.0);
    return Scaffold(
      appBar: AppBar(
        title: Text('Clip'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            avatar, //不剪裁
            ClipOval(child: avatar), //剪裁为圆形
            ClipRRect( //剪裁为圆角矩形
              borderRadius: BorderRadius.circular(5.0),
              child: avatar,
            ), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,//宽度设为原来宽度一半，另一半会溢出
                  child: avatar,
                ),
                Text("你好世界", style: TextStyle(color: Colors.green),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRect(//将溢出部分剪裁
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5,//宽度设为原来宽度一半
                    child: avatar,
                  ),
                ),
                Text("你好世界",style: TextStyle(color: Colors.green))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRect(//将溢出部分剪裁
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5,//宽度设为原来宽度一半
                    child:  Container(
                      decoration: BoxDecoration(
                        color: Colors.red
                      ),
                      child: ClipRect(
                        clipper: MyClipper(),
                        child: avatar,
                      ),
                    )
                  ),
                ),
                Text("你好世界",style: TextStyle(color: Colors.green))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}