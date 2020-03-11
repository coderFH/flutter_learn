import 'package:flutter/material.dart';

class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: StackDemo2()
    );
  }
}

class StackDemo0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
return Stack(
    children: <Widget>[
      Container(
          color: Colors.purple,
          width: 300,
          height: 300,
        ),
        Positioned(
          left: 20,
          top: 20,
          child: Icon(Icons.favorite,size: 50,color: Colors.white,),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Text("你好啊,麦迪",style: TextStyle(fontSize: 20,color: Colors.white),),
        )
      ],
    );
  }
}


class StackDemo1 extends StatelessWidget {
  const StackDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
//        fit: StackFit.expand,
//      overflow: Overflow.visible,
      children: <Widget>[
        Image.asset(
          "images/juren.jpeg",
          width: 300,
          fit: BoxFit.cover,
        ),
        Positioned(
            left: 20,
            bottom: -50,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.red,
            )),
        Positioned(
            right: 10,
            bottom: 20,
            child: Text(
              "进击的巨人",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ))
      ],
    );
  }
}

class StackDemo2 extends StatelessWidget {
  const StackDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * Stack默认的大小是包裹内容的
     *  - alignment: 从什么位置开始排布所有的子Widget
     *  - fit: expand(很少) 将子元素拉伸到尽可能大
     *  - overflow: 超出部分如何处理
     * Positioned
     */
    return Stack(
      children: <Widget>[
        Image.asset("images/juren.jpeg"),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            color: Color.fromARGB(150, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "进击的巨人挺不错的",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  onPressed: () => print("点击了收藏"),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

