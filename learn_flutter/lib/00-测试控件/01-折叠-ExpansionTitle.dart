import 'package:flutter/material.dart';

class FHExpansionTileDemo extends StatefulWidget {
  @override
  _FHExpansionTileDemo createState() => _FHExpansionTileDemo();
}

class _FHExpansionTileDemo extends State<FHExpansionTileDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("折叠组件"),
      ),
      body: ListView(
        children: <Widget>[
          content1(),
          content1()
        ],
      )
    );
  }

  Widget content1() {
    return  ExpansionTile(
      title: Text("测试1"),
      children:List.generate(20, (index){
        return ListTile(
          title: Text("$index"),
        );
      }).toList(),
    );
  }
}


