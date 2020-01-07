import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LayoutDemo(),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer抽屉组件示例"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //设置用户信息,头像,用户名,Emial等
            UserAccountsDrawerHeader(
              accountName: Text("wfh"),
              accountEmail: Text("wfh@11.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/1.jpeg'),
              ),
              onDetailsPressed: (){},
              otherAccountsPictures: <Widget>[
                Container(
                  child: Image.asset('images/code.jpeg'),
                ),
              ],
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.color_lens),),
              title: Text("个性装扮"),
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.photo),),
              title: Text("我的相册"),
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.wifi),),
              title: Text("免流量特权"),
            ),
          ],
        ),
      ),
    );
  }
}

