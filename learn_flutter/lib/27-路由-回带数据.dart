import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("打客服电话")),
      body:Center(
        child: RouteButton(),
      )
    );
  }
}

//跳转的Button
class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed:(){
        _navigateToService(context);
      },
      child: Text('找客服'),
    );
  }

  _navigateToService(BuildContext context) async{ //async是启用异步方法
    final result = await Navigator.push(//等待
      context, 
      MaterialPageRoute(builder: (context)=> Service())
      );
      Scaffold.of(context).showSnackBar(SnackBar(content:Text('$result')));
  }
}

class Service extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('我是客服')
      ),
      body:Center(
        child:Column(
          children: <Widget>[
            RaisedButton(
              child: Text('联通客服'),
              onPressed: (){
                Navigator.pop(context,'联通:10011');
              },
            ) ,
            RaisedButton(
              child: Text('移动客服'),
              onPressed: (){
                Navigator.pop(context,'移动:10086');
              },
            ) ,
          ],
        ) 
      ) ,
    );
  }
}