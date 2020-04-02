import 'package:flutter/material.dart';

import '01-基础组件/00-生命周期.dart';

import '05-豆瓣案例/douban_main.dart';

import '06-W-E-RO/02-Key的使用.dart';
import '06-W-E-RO/03-GlobalKey的使用.dart';

import '07-网络请求/01-dio的封装.dart';

import '08-状态管理/01-InheritedWidget.dart';
import '08-状态管理/02-ProviderWidget.dart';

import '10-事件处理/01-pointer_gesture.dart';
import '10-事件处理/02-gesture手势.dart';
import '10-事件处理/03-冒泡方式的处理.dart';
import '10-事件处理/04-event_bus.dart';

import '11-动画/01-动画-心跳.dart';
import '11-动画/02-动画-心跳-AnimatedWidget.dart';
import '11-动画/03-动画-心跳-AnimatedBuilder.dart';
import '11-动画/04-动画-交织动画.dart';
import '11-动画/05-动画-路由的跳转动画补充.dart';
import '11-动画/06-动画-Hero动画.dart';
import '11-动画/07-动画-present弹出.dart';

import '12-主题/01-主题的学习.dart';
import '12-主题/02-暗黑模式适配.dart';

import '13-屏幕适配/01-屏幕适配.dart';

import '00-测试控件/28-maperialapp_appbar.dart';
import '00-测试控件/29-maperialapp_bottomnavigationbar.dart';
import '00-测试控件/30-maperialapp_drawer.dart';
import '00-测试控件/31-maperialapp_scaffold.dart';
import '00-测试控件/32-maperialapp_tabbar.dart';
import '00-测试控件/33-maperialapp_tabbar2.dart';
import '00-测试控件/34-cupertino_loading.dart';
import '00-测试控件/35-showDialog.dart';
import '00-测试控件/01-折叠-ExpansionTitle.dart';

Widget BasicWidget(BuildContext context) {
  return  ExpansionTile(
    title: Text("1-基础组件"),
    children: <Widget>[
      _newListViewItem(context, '生命周期', HYHomeDemo()),
      _listViewItem(context,'基础控件-Text','/text'),
      _listViewItem(context,'基础控件-image','/image'),
      _listViewItem(context,'基础控件-button','/button'),
      _listViewItem(context,'基础控件-checkBox','/checkBox'),
      _listViewItem(context,'基础控件-textField','/textField'),
      _listViewItem(context,'基础控件-progress','/progress'),
      _listViewItem(context,'基础控件-有状态组件','/fullWidget'),
    ],
  );
}

Widget layoutWidget(BuildContext context) {
  return  ExpansionTile(
    title: Text("2-布局组件"),
    children: <Widget>[
      _listViewItem(context,'布局组件-Row_Column','/rowColumn'),
      _listViewItem(context,'布局组件-wrap_flow','/wrapFlow'),
      _listViewItem(context,'布局组件-Stack','/myStack'),
      _listViewItem(context,'布局组件-Align_Center', '/alignCenter'),
    ],
  );
}

Widget ContainerWidget(BuildContext context) {
  return  ExpansionTile(
    title: Text("3-容器组件"),
    children: <Widget>[
      _listViewItem(context,'容器组件-Padding', '/padding'),
      _listViewItem(context,'容器组件-限定大小', '/size'),
      _listViewItem(context,'容器组件-DecoratedBox', '/decoratedBox'),
      _listViewItem(context,'容器组件-transform', '/transform'),
      _listViewItem(context,'容器组件-Container', '/container'),
      _listViewItem(context,'容器组件-Clip', '/Clip'),
    ],
  );
}

Widget ScrollableWidget(BuildContext context) {
  return  ExpansionTile(
    title: Text("4-可滚动组件"),
    children: <Widget>[
      _listViewItem(context,'滚动组件-SingleChildScrollView', '/singleChildScrollView'),
      _listViewItem(context,'滚动组件-ListView使用方式1', '/listView1'),
      _listViewItem(context,'滚动组件-ListView使用方式2', '/listView2'),
      _listViewItem(context,'滚动组件-ListView-ListTile', '/listTitle'),
      _listViewItem(context,'滚动组件-ListView-scrollDirection', '/scrollDirection'),
      _listViewItem(context,'滚动组件-ListView-ListView.build', '/listBuild'),
      _listViewItem(context,'滚动组件-ListView-ListView.build动态加载数据', '/listBuild1'),
      _listViewItem(context,'滚动组件-ListView- ListView.separated', '/listSeparated'),
      _listViewItem(context,'滚动组件-gride1', '/gridView'),
      _listViewItem(context,'滚动组件-gride2', '/gridView1'),
      _listViewItem(context,'滚动组件-gride.build', '/gridViewBuild'),
      _listViewItem(context,'滚动组件-Slivers', '/slivers'),
      _listViewItem(context,'滚动组件-CustomScrollView', '/customScrollView'),
      _listViewItem(context,'滚动组件-CustomScrollView1', '/customScrollView1'),
      _listViewItem(context,'滚动组件-滚动监听', '/scrollListen1'),
      _listViewItem(context,'滚动组件-滚动监听-NotificationListener', '/scrollListen2'),
    ],
  );
}

Widget ProjectWidget(BuildContext context) {
  return  ExpansionTile(
    title: Text("5-项目"),
    children: <Widget>[
      _newListViewItem(context, "豆瓣案例", DouBan()),
    ],
  );
}

Widget BaseStudy(BuildContext context) {
  return  ExpansionTile(
    title: Text("6-底层探索"),
    children: <Widget>[
      _newListViewItem(context, "key的使用", FHKey()),
      _newListViewItem(context, "GlobalKey的使用", FHGolbalKeyDemo()),
    ],
  );
}

Widget NetWorkWidget(BuildContext context) {
  return  ExpansionTile(
    title: Text("7-网络请求"),
    children: <Widget>[
      _newListViewItem(context, "dio的封装使用", DioDemo()),
    ],
  );
}

Widget StateManageWidget(BuildContext context) {
  return  ExpansionTile(
    title: Text("8-状态管理"),
    children: <Widget>[
      _newListViewItem(context, "状态管理-InheritedWidget", FHInheritedDemo()),
      _newListViewItem(context, "状态管理-ProvideWidget", FHProviderDomo()),
    ],
  );
}

Widget RouterWidget(BuildContext context) {
  return  ExpansionTile(
    title: Text("9-路由"),
    children: <Widget>[
      _listViewItem(context,'路由-简单的跳转', '/myrouter'),
      _listViewItem(context,'路由-数据传递', '/myProduct'),
      _listViewItem(context,'路由-回带数据', '/myCallPhone'),
      _listViewItem(context,'路由-命名路由-pushName', '/PushNameDemo'),
    ],
  );
}

Widget EventWidget(BuildContext context) {
  return  ExpansionTile(
    title: Text("10-事件处理"),
    children: <Widget>[
      _newListViewItem(context, "事件处理-pointer_gusture", FHPointGestureDemo()),
      _newListViewItem(context, "事件处理-Gesture手势", FHGestureDemo()),
      _newListViewItem(context, "事件处理-冒泡方式的处理", FHBubblingDemo()),
      _newListViewItem(context, "事件处理-event_bus", FHEventBusDemo()),
    ],
  );
}

Widget AnimalWidget(BuildContext context) {
  return  ExpansionTile(
    title: Text("11-动画"),
    children: <Widget>[
      _newListViewItem(context, "动画-心跳动画", FHHeartDemo()),
      _newListViewItem(context, "动画-心跳动画-AnimatedWidget", FHHeartDemo1()),
      _newListViewItem(context, "动画-心跳动画-AnimatedBuilder", FHHeartDemo2()),
      _newListViewItem(context, "动画-交织动画", FHStaggeredDemo()),
      _newListViewItem(context, "动画-路由跳转的动画补充", FHAnimalRouter()),
      _newListViewItem(context, "动画-Hero动画", FHHeroDemo()),
      _newListViewItem(context, "动画-present弹出", FHPresentDemo()),
    ],
  );
}

Widget ThemeWidget(BuildContext context) {
  return  ExpansionTile(
    title: Text("12-主题"),
    children: <Widget>[
      _newListViewItem(context, '主题的学习', FHThemeDemo()),
      _newListViewItem(context, '暗黑模式', FHDarkDemo()),
    ],
  );
}

Widget ScreenWidget(BuildContext context) {
  return  ExpansionTile(
    title: Text("13-屏幕适配"),
    children: <Widget>[
      _newListViewItem(context, '屏幕适配', FHScreenFit()),
    ],
  );
}


Widget TesstWidget(BuildContext context) {
  return  ExpansionTile(
    title: Text("测试组件"),
    children: <Widget>[
      _newListViewItem(context, '折叠组件', FHExpansionTileDemo()),
      _newListViewItem(context, 'maperialapp-appbar', MyappBar()),
      _newListViewItem(context, 'maperialapp_bottomnavigationbar', MybottomNavigationBar()),
      _newListViewItem(context, 'maperialapp-drawer', MyDrawer()),
      _newListViewItem(context, 'maperialapp-scaffold', MyScaffold()),
      _newListViewItem(context, 'maperialapp-tabbar', MyTabbar()),
      _newListViewItem(context, 'maperialapp-tabbar2', MyTabbar1()),
      _newListViewItem(context, 'cupertino_loading', MyLoading()),
      _newListViewItem(context, 'showDialog', MyDialog()),
    ],
  );
}

Widget _listViewItem(BuildContext context, String name, String routeUrl) {
  return ListTile(
    leading: Icon(Icons.access_time, size: 18,),
    title: Text(name),
    trailing: Icon(Icons.arrow_right),
    onTap: () {
      Navigator.pushNamed(context, routeUrl);
    },
  );
}

Widget _newListViewItem(BuildContext context, String name, Object w) {
  return ListTile(
    leading: Icon(Icons.access_time, size: 18,),
    title: Text(name),
    trailing: Icon(Icons.arrow_right),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => w));
    },
  );
}