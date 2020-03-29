import 'package:flutter/material.dart';

class MyappBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp示例',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LayoutDemo(),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //头部元素,比如:左侧返回按钮,中间标题,右侧菜单
      appBar: AppBar(
        title: Text("AppBar脚手架组件示例"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.add),
            tooltip: '添加',
            onPressed: (){},
          ),
        ],
      ),
      body: Center(
        child: Text("Scaffold"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}



