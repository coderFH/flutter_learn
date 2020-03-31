import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FHDarkDemo extends StatefulWidget {
  @override
  _FHThemeDemoState createState() => _FHThemeDemoState();
}

class _FHThemeDemoState extends State<FHDarkDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "我是在切换程序中显示的(安卓有效)",
      theme: ThemeData(
        primaryColor: Colors.purple,
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 16, color: Colors.red),
        )
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.grey,
        textTheme: TextTheme(
            body1: TextStyle(fontSize: 16, color: Colors.blue),
          )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('主题'),
        ),
        body: Center(
          child: Text("Hello World"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                title: Text("首页"),
                icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                title: Text("分类"),
                icon: Icon(Icons.category)
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.category),
            onPressed: () {}
        ),
      ),
    );
  }
}

