import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

final eventBus = EventBus();

//1.创建全局的EventBus对象
class UserInfo {
  String nickName;
  int level;

  UserInfo(this.nickName,this.level);
}

class FHEventBusDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FHButton(),
            FHText()
          ],
        ),
      ),
    );
  }
}

class FHButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('按钮'),
      onPressed: (){
        //2.发出事件
        final info = UserInfo("wfh",18);
        eventBus.fire(info);
      },
    );
  }
}

class FHText extends StatefulWidget {
  @override
  _FHTextState createState() => _FHTextState();
}

class _FHTextState extends State<FHText> {
  String _message = "hello world";

  @override
  void initState() {
    super.initState();
    //3.监听事件类型
    eventBus.on<UserInfo>().listen((data){
      print(data.nickName);
      print(data.level);
      setState(() {
        _message = "${data.nickName}-${data.level}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message,style: TextStyle(fontSize: 20),);
  }
}

