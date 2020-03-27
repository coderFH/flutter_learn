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

  _navigateToService(BuildContext context) {
      Future result = Navigator.push(context,MaterialPageRoute(builder: (context)=> Service()));
      result.then((res){
        Scaffold.of(context).showSnackBar(SnackBar(content:Text('$res')));
      });
  }
}

class Service extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //方法为true时,可以自动返回(flutter帮助我们执行返回操作)
      //当返回为false时,自行写返回代码
      onWillPop: () {
        Navigator.pop(context,'您未做任何选择');
        return Future.value(false);
      },
      child: Scaffold(
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
      ),
    );
  }
}