import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('导航页面实例'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('查看商品详情页面'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
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
        title: Text('导航页面实例'),
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