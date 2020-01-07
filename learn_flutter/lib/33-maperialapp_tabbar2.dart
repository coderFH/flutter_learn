import 'package:flutter/material.dart';

class ItemView {
  final String title;//标题
  final IconData icon; //图标
  const ItemView({this.title,this.icon}); //构造方法
}

class MyTabbar1 extends StatelessWidget {
  final List<ItemView> items = [
    ItemView(title: "自驾",icon: Icons.directions_car),
    ItemView(title: "自行车",icon: Icons.directions_bike),
    ItemView(title: "轮船",icon: Icons.directions_boat),
    ItemView(title: "公交车",icon: Icons.directions_bus),
    ItemView(title: "火车",icon: Icons.directions_railway),
    ItemView(title: "步行",icon: Icons.directions_walk),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: DefaultTabController(
        length: items.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("TabBar选项卡示例"),
            bottom: TabBar(
              isScrollable: true, //设置可滚动
              tabs: items.map((ItemView item) {
                return Tab(
                  text: item.title,
                  icon: Icon(item.icon),
                );
              }).toList(),
          ),
        ),
          body:  TabBarView(
            children: items.map((ItemView item){
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: SelectedView(item: item,),
              );
            }).toList(),
        ),
      ),
      )
    );
  }
}

class SelectedView extends StatelessWidget {
  //视图数据
  final ItemView item;
  const SelectedView({Key key,this.item}) : super(key : key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,// 垂直方向最小化处理
          crossAxisAlignment: CrossAxisAlignment.center, //水平方向居中对齐
          children: <Widget>[
            Icon(item.icon,size: 128.0,color: Colors.red,),
            Text(item.title),
          ],
        ),
      ),
    );
  }
}



