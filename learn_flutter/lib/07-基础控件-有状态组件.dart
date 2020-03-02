import 'package:flutter/material.dart';

class MyCounterWidget extends StatefulWidget {
  final message;
  MyCounterWidget(this.message); //比如外界给部件传递过来了一个信息,如何在State里拿到这个信息呢?看45行

  @override
  State<StatefulWidget> createState() {
    return MyCounterState();
  }
}

class MyCounterState extends State<MyCounterWidget> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('有状态组件'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("+1",style: TextStyle(color: Colors.white,fontSize: 20),),
                  color: Colors.redAccent,
                  onPressed: (){
                    this.setState(()=>counter++);
                  },
                ),
                RaisedButton(
                  child: Text("-1",style:  TextStyle(color: Colors.white,fontSize: 20),),
                  color: Colors.orangeAccent,
                  onPressed: (){
                    this.setState(()=>counter--);
                  },
                ),
              ],
            ),
            Text("当前计数:$counter",style: TextStyle(fontSize: 30),),
            Text(widget.message) //每个State里都有一个widgt属性,他就是创建这个State的部件
          ],
        ),
      ),
    );
  }
}