import 'package:flutter/material.dart';

class MyCounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyCounterState();
  }
}

class MyCounterState extends State<MyCounterWidget> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
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
          Text("当前计数:$counter",style: TextStyle(fontSize: 30),)
        ],
      ),
    );
  }
}