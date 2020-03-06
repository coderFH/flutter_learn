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