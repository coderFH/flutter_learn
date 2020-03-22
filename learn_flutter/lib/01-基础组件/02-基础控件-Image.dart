import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片控件'),
      ),
      body: ListView(
        children: <Widget>[
          MyNetImage(),
          MyLocalImage(),
          FadeImageDemo(),
          IconExtensionDemo(),
          MyPhotoCircular1(),
          MyPhotoCircular2(),
          MyCircularImage(),
        ],
      ),
    );
  }
}

//网络图片
class MyNetImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.network("http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg",
          alignment: Alignment.topCenter, //Alignment(0, 0), 坐标从(-1,-1)到(1,1)
          color: Colors.redAccent, //这里的color不是真正意义上的红色,是根据colorBlendMode的混入的形式
          colorBlendMode: BlendMode.colorDodge,
          repeat: ImageRepeat.repeatY,
          fit: BoxFit.contain,
        ),
        width: 300,
        height: 300,
        color: Colors.yellow,
      ),
    );
  }
}

//本地图片
class MyLocalImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.yellow,
        child: Image.asset('images/1.png'),
      ),
    );
  }
}

//占位图的解决方式
class FadeImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1.占位图的问题: FadeInImage
    // 2.图片缓存: 1000张 100m
    return FadeInImage(
      fadeOutDuration: Duration(milliseconds: 1),
      fadeInDuration: Duration(milliseconds: 1),
      placeholder: AssetImage("assets/images/juren.jpeg"),
      image: NetworkImage("http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg"),
    );
  }
}

class IconExtensionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Icon字体图标和图片图标
    // 1.字体图标矢量图(放大的时候不会失真)
    // 2.字体图标可以设置颜色
    // 3.图标很多时, 占据空间更小
//    return Icon(Icons.pets, size: 300, color: Colors.orange,);
//    return Icon(IconData(0xe91d, fontFamily: 'MaterialIcons'), size: 300, color: Colors.orange,);
    // 1.0xe91d -> unicode编码
    // 2.设置对应的字体
    return Text("\ue91d", style: TextStyle(fontSize: 100, color: Colors.orange, fontFamily: "MaterialIcons"),);
  }
}


//圆角头像 方式1:CircleAvatar对象
class MyPhotoCircular1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 100,
        backgroundImage: NetworkImage('https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg'),
        child: Container(
          alignment: Alignment(0, .5),
          width: 200,
          height: 200,
          child: Text("兵长利威尔"),
        ),
      ),
    );
  }
}

//圆角头像 方式2:ClipOval,通常是在只有头像时使用
class MyPhotoCircular2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.network(
         "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}

//圆角头像 方式3:Container+BoxDecoration,讲解Container时来讲这种方式

//圆角图片 方式1:ClipRRect
class MyCircularImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
//圆角图片 方式2:Container+BoxDecoration,讲解Container时讲解