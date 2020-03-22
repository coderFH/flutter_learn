import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('限定大小'),
      ),
      body: Column(
        children: <Widget>[
          MyConstrainedBox(),
          MySizedBox(),
          MyUnconstrainedBox(),
        ],
      ),
    );
  }
}

class MyConstrainedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity,//宽度尽可能的大
        minHeight: 50.0 //最小高度为50像素
      ),
      child: Container(
        height: 5.0, //虽然给了高度是5.但是限定最低的高度是50
        color: Colors.red,
      ),
    );
  }
}

class MySizedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.0,
      height: 80.0,
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}

//如果没有中间的UnconstrainedBox，那么根据上面所述的多重限制规则，
// 那么最终将显示一个90×100的红色框。
// 但是由于UnconstrainedBox “去除”了父ConstrainedBox的限制，
// 则最终会按照子ConstrainedBox的限制来绘制redBox，即90×20：
class MyUnconstrainedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
        child: UnconstrainedBox( //“去除”父级限制
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
            child: Container(
              color: Colors.red,
            ),
          ),
        )
    );
  }
}