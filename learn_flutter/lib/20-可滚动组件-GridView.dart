import 'package:flutter/material.dart';
import 'anchor.dart';

//============================== 1. GridView =============================
class MyGridCountDemo extends StatelessWidget {
  List<Widget> getGridWidgets() {
    return List.generate(100, (index){
      return Container(
        color: Colors.purple,
        alignment: Alignment(0, 0),
        child: Text("item$index",style: TextStyle(fontSize: 20,color: Colors.white),),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        child: GridView(
          scrollDirection : Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.5
          ),
          children: getGridWidgets(),
        ),
      ),
    );
  }
}

class MyGridCountDemo1 extends StatelessWidget {
  List<Widget> getGridWidgets() {
    return List.generate(100, (index){
      return Container(
        color: Colors.purple,
        alignment: Alignment(0, 0),
        child: Text("item$index",style: TextStyle(fontSize: 20,color: Colors.white),),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.0
        ),
        children: getGridWidgets(),
      ),
    );
  }
}

//============================== 2. GridView.build =============================

class MyGrideViewDemo2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GridViewBuildDemoState();
  }
}

class _GridViewBuildDemoState extends State<MyGrideViewDemo2> {
  List<Anchor> anchors = [];

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.2
          ),
          itemCount: anchors.length,
          itemBuilder: (BuildContext context,int index) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(anchors[index].imageUrl),
                  SizedBox(height: 5,),
                  Text(anchors[index].nickname,style: TextStyle(fontSize: 16),),
                  Text(anchors[index].roomName,maxLines: 1,overflow: TextOverflow.ellipsis,),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}