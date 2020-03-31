import 'package:flutter/material.dart';
import 'size_fit.dart';


class FHScreenFit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //注意:初始化一般是放到MyApp中的,因为我这个项目为了看案例方便,进行了抽取
    FHSizeFit.initialize();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: FHHomePage(),
    );
  }
}

class FHHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // 2.手机屏幕的大小(逻辑分辨率)
    //通过MediaQuery去拿信息,如果直接放到MyApp中,是拿不到的,因为控件还没有创建
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final statusHeight = MediaQuery.of(context).padding.top;
    print("屏幕宽高: $width * $height");
    print("状态栏的高度: $statusHeight");
    print(FHSizeFit.screenWidth);

    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Container(
          width: FHSizeFit.setRpx(400),
          height: FHSizeFit.setPx(200),
          color: Colors.red,
          alignment: Alignment.center,
          child: Text("Hello World", style: TextStyle(fontSize: 40 * FHSizeFit.rpx),),
        ),
      ),
    );
  }
}