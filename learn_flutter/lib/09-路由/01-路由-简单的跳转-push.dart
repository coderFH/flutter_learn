import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('主页'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('查看商品详情页面'),
            onPressed: (){
//              Navigator.of(context).push(route) 两种写法一直
              Navigator.push(context, //他本质还是调用上边的那个方法
                MaterialPageRoute(
                    builder: (context) => SecondScreen()
                )
              );
            },
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情页'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('返回页面'),
        ),
      ),
    );
  }
}