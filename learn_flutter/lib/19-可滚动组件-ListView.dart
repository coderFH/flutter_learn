import 'package:flutter/material.dart';
import 'anchor.dart';

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
      children: <Widget>[
          ListTile(
            leading: Icon(Icons.people,size: 36,),
            title: Text("联系人"),
            subtitle: Text("联系人信息"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.people,size: 36,),
            title: Text("联系人"),
            subtitle: Text("联系人信息"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.email,size: 36,),
            title: Text("邮箱"),
            subtitle: Text("邮箱地址信息"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.message,size: 36,),
            title: Text("消息"),
            subtitle: Text("消息详情信息"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.map,size: 36,),
            title: Text("地址"),
            subtitle: Text("地址详情信息"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
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
        itemExtent: 200,
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
        itemCount: 100,
        itemExtent: 80,
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
        separatorBuilder: (BuildContext context,int index) {
          return index % 2 ==0 ? redClolr : blueColor;
        },
        itemCount: 100
      ),
    );
  }
}