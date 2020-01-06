import 'package:flutter/material.dart';

//============================== 14. Row =============================
class MyWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
      spacing: 8.0, //主轴方向间距
      runSpacing: 4.0, //纵轴方向间距
      alignment: WrapAlignment.start,
      children: <Widget>[
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.black,
            child: Text('A'),
          ),
          label: Text("库里"),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.black,
            child: Text('B'),
          ),
          label: Text("周杰伦"),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.black,
            child: Text('C'),
          ),
          label: Text("今天是什么日子"),
        ),
        Container(color: Colors.blue,width: 80,height: 80,),
        Container(color: Colors.green,width: 70,height: 70,),
        Container(color: Colors.orange,width: 100,height: 100,),
//        Container(color: Colors.orange,width: 200,height: 100,), //row默认只有一行,超出了就会报错
      ],
    );
  }
}