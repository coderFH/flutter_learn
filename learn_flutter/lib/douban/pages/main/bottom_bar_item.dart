import 'package:flutter/material.dart';

class FHBottomBarItem extends BottomNavigationBarItem {
  FHBottomBarItem(String iconName , String title)
      : super(
      title : Text(title),
      //gaplessPlayback: true 解决是图片的情况下,第一次点击时闪烁的现象
      icon: Image.asset("assets/images/tabbar/$iconName.png", width: 32,gaplessPlayback: true,),
      activeIcon: Image.asset("assets/images/tabbar/${iconName}_active.png", width: 32,),
    );

}