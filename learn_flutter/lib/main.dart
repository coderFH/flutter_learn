import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '01-基础控件-Text.dart';
import '02-基础控件-Image.dart';
import '03-基础控件-Button.dart';
import '04-基础控件-CheckBox.dart';
import '05-基础控件-TextField.dart';
import '06-基础控件-progress.dart';
import '07-基础控件-状态管理.dart';
import '08-布局组件-Row_Column.dart';
import '09-布局组件-Wrap_Flow.dart';
import '10-布局组件-Stack.dart';
import '11-布局组件-Align_Center.dart';
import '12-容器组件-Padding.dart';
import '13-容器组件-限定大小.dart';
import '14-容器组件-DecoratedBox.dart';
import '15-容器组件-Transform.dart';
import '16-容器组件-Container.dart';
import '17-容器组件-Clip.dart';
import '18-可滚动组件-SingleChildScrollView.dart';
import '19-可滚动组件-ListView.dart';
import "20-可滚动组件-GridView.dart";
import '21-可滚动组件-Slivers.dart';
import '22-可滚动组件-CustomScrollView.dart';
import '23-可滚动组件-滚动监听.dart';
import '24-状态管理-Provide.dart';
import '24-counter.dart';

//============================== 1.最原始的写法 ================================
/*main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("wfh"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
                value: true,
                onChanged: (value) => print('hello world')),
            Text(
              'hello world',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 36),
            ),
          ],
        ),
      ),
    ),
  ),
  );
}*/

//============================== 2.代码抽离 ================================

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              value: true,
              onChanged: (value) => print("hello world")
          ),
          Text("同意协议",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}

main(List<String> args) {
  var counter = Counter(0);
  var providers = Providers();
  providers.provide(Provider<Counter>.value(counter));
  runApp(ProviderNode(child:MyApp(),providers:providers));
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("wfh"),
        ),
        body:CartPage(),
      ),
    );
  }
}