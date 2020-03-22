import 'package:flutter/material.dart';
import 'anchor.dart';

/*
ListView
ListView.builder
ListView.separated
*/

//============================== 1. ListView常见使用方式1 =============================

class MyListView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ProductItem("Apple1", "Macbook Product1", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
            ProductItem("Apple2", "Macbook Product2", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
            ProductItem("Apple3", "Macbook Product3", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;

  ProductItem(this.title,this.desc,this.imageURL);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all()
      ),
      child:  Column(
        children: <Widget>[
          Text(title,style: TextStyle(fontSize: 24)),
          Text(desc,style: TextStyle(fontSize: 18)),
          SizedBox(height: 10,),
          Image.network(imageURL)
        ],
      ),
    );
  }
}

//============================== 2. ListView常见使用方式2 =============================
class MyListView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("人的一切痛苦，本质上都是对自己无能的愤怒。",
              style: TextStyle(
                  color:Colors.redAccent
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("人活在世界上，不可以有偏差；而且多少要费点劲儿，才能把自己保持到理性的轨道上。"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("我活在世上，无非想要明白些道理，遇见些有趣的事。"),
          ),
        ],
      ),
    );
  }
}

//============================== 3. ListTile =============================
class MyListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
        children: List.generate(100, (index){ //使用List.generate快速的造数据
          return ListTile(
            leading: Icon(Icons.people),
            trailing: Icon(Icons.delete),
            title: Text("联系人${index + 1}"),
            subtitle: Text("联系人电话号码:18866665555"),
          );
        }),
      ),
    );
  }
}

//============================== 4. scrollDirection =============================
class MyScrollDirection extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        itemExtent: 200,//设置横向滚动,需要设置高度
        children: <Widget>[
          Container(color: Colors.redAccent, width: 200,),
          Container(color: Colors.green, width: 200,),
          Container(color: Colors.blue, width: 200,),
          Container(color: Colors.purple, width: 200,),
          Container(color: Colors.orange, width: 200,),
        ],
      ),
    );
  }
}

//============================== 5.  ListView.build =============================
class MyBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 100, //一共多少个数据
        itemExtent: 180, //高度
        itemBuilder: (BuildContext context,int index) {
          return ListTile(title: Text("标题$index"),subtitle: Text("详情内容$index"));
        }
      ),
    );
  }
}

//============================== 6. ListView.build动态加载数据 =============================
class MyListBuild extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyListBuildState();
  }
}

class MyListBuildState extends State<MyListBuild> {
  List<Anchor> anchors = [];

  //初始化方法中加载数据
  @override
  void initState() {

    getAnchors().then((anchors) {
      setState(() {
        this.anchors = anchors;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: anchors.length,
        itemBuilder: (BuildContext context,int index) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  anchors[index].imageUrl,
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 8,),
                Text(anchors[index].nickname,style: TextStyle(fontSize: 20),),
                SizedBox(height: 5,),
                Text(anchors[index].roomName)
              ],
            ),
          );
        }
      ),
    );
  }
}

//============================== 7.  ListView.separated =============================
class MySeparatedDemo extends StatelessWidget {

  Divider blueColor = Divider(color: Colors.blue,);
  Divider redClolr = Divider(color: Colors.redAccent,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (BuildContext context,int index) {
          return ListTile(
            leading: Icon(Icons.people),
            title: Text("联系人${index+1}"),
            subtitle: Text("联系人电话${index+1}"),
          );
        },

//        separatorBuilder: (BuildContext context,int index) {
//          return index % 2 ==0 ? redClolr : blueColor;
//        },

        separatorBuilder: (BuildContext context,int index) {
          return Divider(
            color: Colors.red,
            height: 100,   //分割先所占的范围
            indent: 50,   //分割线前边有多少空白
            endIndent: 50,//分割线后边有多少空白
            thickness: 1, //分割线的高度
          );
        },
        itemCount: 100
      ),
    );
  }
}