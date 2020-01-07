import 'package:flutter/material.dart';

class MyTabbar extends StatelessWidget {
  //选项卡数据
  final List<Tab> myTabs = [
    Tab(text: "选项卡一",),
    Tab(text: "选项卡二",),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
          length: myTabs.length,
          child: Scaffold(
            appBar: AppBar(
              //添加导航栏
              bottom: TabBar(tabs: myTabs),
            ),
            body: TabBarView(
              children: myTabs.map((Tab tab){
                return Center(
                  child: Text(tab.text)
                );
              }).toList(),
            )
          ),
      ),
    );
  }
}

