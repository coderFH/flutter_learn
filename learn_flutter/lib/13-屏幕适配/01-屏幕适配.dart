import 'dart:ui';
import 'package:flutter/material.dart';
import 'size_fit.dart';
import 'extension/double_extension.dart';
import 'extension/int_extension.dart';

class FHScreenFit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //注意:初始化一般是放到MyApp中的,因为我这个项目为了看案例方便,进行了抽取
    FHSizeFit.initialize();

    // 1.手机的物理分辨率
    double physicalWidth = window.physicalSize.width;
    double physicalHeight = window.physicalSize.height;

    // 2.获取dpr
    double dpr = window.devicePixelRatio;

    // 3.宽度和高度
    double screenWidth = physicalWidth / dpr;
    double screenHeight = physicalHeight / dpr;

    // 4.状态栏高度
    double  statusHeight = window.padding.top / dpr;

    double rpx = screenWidth / 750;
    double px = screenWidth / 750 * 2;

    print("physicalWidth=$physicalWidth");
    print("physicalHeight=$physicalHeight");
    print("dpr=$dpr");
    print("screenWidth=$screenWidth");
    print("screenHeight=$screenHeight");
    print("statusHeight=$statusHeight");
    print("rpx=$rpx");
    print("px=$px");


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
          width: 400.rpx,//FHSizeFit.setRpx(400),
          height: 200.px,//FHSizeFit.setPx(200),
          color: Colors.red,
          alignment: Alignment.center,
          child: Text("Hello World", style: TextStyle(fontSize: 40 * FHSizeFit.rpx),),
        ),
      ),
    );
  }
}