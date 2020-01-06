import 'package:flutter/material.dart';

class MyRowColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row-Column'),
      ),
      body: Stack(
        children: <Widget>[
          MyRow(), 
          MyRow1(),
          MyColumn()
        ],
      )
    );
  }
}

//============================== 14. Row =============================
class MyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr, //是从左往右,还是从右到左
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // mainAxisSize 值为 MainAxisSize.min，则此属性无意义，因为子组件的宽度等于Row的宽度
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(color: Colors.redAccent,width: 20,height: 60,),
        Container(color: Colors.blue,width: 80,height: 80,),
        Container(color: Colors.green,width: 70,height: 70,),
        Container(color: Colors.orange,width: 100,height: 100,),
//        Container(color: Colors.orange,width: 200,height: 100,), //row默认只有一行,超出了就会报错
      ],
    );
  }
}

class MyRow1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(color: Colors.redAccent,height: 60,),
        ),
        Container(color: Colors.blue, width: 80, height: 80),
        Container(color: Colors.green, width: 70, height: 70),
        Expanded(
          flex: 1,
          child: Container(color: Colors.orange,height: 100,),
        )
      ],
    );
  }
}

//============================== 15. Column =============================
class MyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(color: Colors.redAccent,width: 60,),
        ),
        Container(color: Colors.blue, width: 80, height: 80),
        Container(color: Colors.green, width: 70, height: 70),
        Expanded(
          flex: 1,
          child: Container(color: Colors.orange, width: 100),
        )
      ],
    );
  }
}