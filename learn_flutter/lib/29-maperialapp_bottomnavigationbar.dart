import 'package:flutter/material.dart';

class MybottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp示例',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage1(),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage1> {
  int _selectedIndex = 1;
  final _widgetOptions = [
    Text("Index 0:信息"),
    Text("Index 1:通讯录"),
    Text("Index 2:发现"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomNavigationBar示例"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), //居中显示某一个文本
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat),title: Text("信息")),
          BottomNavigationBarItem(icon: Icon(Icons.contacts),title: Text("通讯录")),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),title: Text("发现")),
        ],
        currentIndex: _selectedIndex, // 当前选中项的索引
        fixedColor: Colors.deepPurple, //选项中项的颜色
        onTap: _onItemTapped, //选择按下处理
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}




