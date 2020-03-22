import 'package:flutter/material.dart';

//============================== 26. 滚动 =============================
class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePagesState();
  }
}

class MyHomePagesState extends State<MyHomePage> {
  ScrollController _controller;
  bool _isShowTop = false;

  @override
  void initState() {
    //初始化ScrollController
    _controller = ScrollController();

    //监听滚动
    _controller.addListener((){
      var tempSsShowTop = _controller.offset >= 1000;
      if(tempSsShowTop != _isShowTop) {
        setState(() {
          _isShowTop = tempSsShowTop;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView展示"),
      ),
      body: ListView.builder(
          itemCount: 100,
          itemExtent: 60,
          controller: _controller,
          itemBuilder: (BuildContext context,int index) {
            return ListTile(title: Text("item$index"),);
          }
      ),

      floatingActionButton: !_isShowTop ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          _controller.animateTo(0, duration: Duration(milliseconds: 1000), curve: Curves.ease);
        },
      ),
    );
  }
}

//============================== 26. NotificationListener =============================
class MyHomeNotificationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomeNotificationDemoState();
}

class MyHomeNotificationDemoState extends State<MyHomeNotificationDemo> {
  int _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          //1.判断监听事件的类型
          if(notification is ScrollStartNotification) {
            print("开始滚动.....");
          } else  if(notification is ScrollUpdateNotification) {
            //当前滚动的位置和总长度
            final currentPixel = notification.metrics.pixels;
            final totalPixel = notification.metrics.maxScrollExtent;
            double progress = currentPixel / totalPixel;
            setState(() {
              _progress = (progress * 100).toInt();
            });
            print("正在滚动：${notification.metrics.pixels} - ${notification.metrics.maxScrollExtent}");
          } else if(notification is ScrollEndNotification) {
            print("结束滚动....");
          }
          return false;
        },
        child: Stack(
          alignment: Alignment(.9, .9),
          children: <Widget>[
            ListView.builder(
              itemCount: 100,
              itemExtent: 60,
              itemBuilder: (BuildContext context,int index) {
                return ListTile(title: Text("item$index"),);
              }
            ),
            CircleAvatar(
              radius: 30,
              child: Text("$_progress%"),
              backgroundColor: Colors.black54,
            )
          ],
        )
      ),
    );
  }
}