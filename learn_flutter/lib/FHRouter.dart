import 'package:flutter/cupertino.dart';
import 'package:learn_flutter/main.dart';
import '01-基础组件/01-基础控件-Text.dart';
import '01-基础组件/02-基础控件-Image.dart';
import '01-基础组件/03-基础控件-Button.dart';
import '01-基础组件/04-基础控件-CheckBox.dart';
import '01-基础组件/05-基础控件-TextField.dart';
import '01-基础组件/06-基础控件-progress.dart';
import '01-基础组件/07-基础控件-有状态组件.dart';

import '02-布局组件/08-布局组件-Row_Column.dart';
import '02-布局组件/09-布局组件-Wrap_Flow.dart';
import '02-布局组件/10-布局组件-Stack.dart';
import '02-布局组件/11-布局组件-Align_Center.dart';

import '03-容器组件/12-容器组件-Padding.dart';
import '03-容器组件/13-容器组件-限定大小.dart';
import '03-容器组件/14-容器组件-DecoratedBox.dart';
import '03-容器组件/15-容器组件-Transform.dart';
import '03-容器组件/16-容器组件-Container.dart';
import '03-容器组件/17-容器组件-Clip.dart';

import '04-可滚动组件/18-可滚动组件-SingleChildScrollView.dart';
import '04-可滚动组件/19-可滚动组件-ListView.dart';
import "04-可滚动组件/20-可滚动组件-GridView.dart";
import '04-可滚动组件/21-可滚动组件-Slivers.dart';
import '04-可滚动组件/22-可滚动组件-CustomScrollView.dart';
import '04-可滚动组件/23-可滚动组件-滚动监听.dart';

import '09-路由/01-路由-简单的跳转-push.dart';
import '09-路由/02-路由-传递数据-push.dart';
import '09-路由/03-路由-回带数据-push.dart';
import '09-路由/04-路由-命名路由-pushName.dart';

class FHRouter {
  static final Map<String, WidgetBuilder> routerList = {
    '/': (BuildContext context) => FirstListPage(),
    '/image' : (BuildContext context) => MyImage(),
    '/text' : (BuildContext context) => MyText(),
    '/image' : (BuildContext context) => MyImage(),
    '/button' : (BuildContext context) => CustomButton(),
    '/checkBox' : (BuildContext context) => MyCheckBoxWidget(),
    '/textField' : (BuildContext context) => MyTextField(),
    '/progress' : (BuildContext context) => MyProgress(),
    '/fullWidget' : (BuildContext context) => MyCounterWidget("测试Widget传值"),
    '/rowColumn' : (BuildContext context) => MyRowColumn(),
    '/wrapFlow' : (BuildContext context) => MyWrapTest(),
    '/myStack' : (BuildContext context) => MyStack(),
    '/alignCenter' : (BuildContext context) => AlignCenter(),
    '/padding' : (BuildContext context) => MyPadding(),
    '/size' : (BuildContext context) => MyBox(),
    '/decoratedBox' : (BuildContext context) => MyDecoratedBox(),
    '/transform' : (BuildContext context) => MyTrans(),
    '/container' : (BuildContext context) => MyCon(),
    '/Clip' : (BuildContext context) => ClipTestRoute(),
    '/singleChildScrollView' : (BuildContext context) => MySingleChildScrollViewTestRoute(),
    '/listView1' : (BuildContext context) => MyListView1(),
    '/listView2' : (BuildContext context) => MyListView2(),
    '/listTitle' : (BuildContext context) => MyListTile(),
    '/scrollDirection' : (BuildContext context) => MyScrollDirection(),
    '/listBuild' : (BuildContext context) => MyBuild(),
    '/listBuild1' : (BuildContext context) => MyListBuild(),
    '/listSeparated' : (BuildContext context) => MySeparatedDemo(),
    '/gridView' : (BuildContext context) => MyGridCountDemo(),
    '/gridView1' : (BuildContext context) => MyGridCountDemo1(),
    '/gridViewBuild' : (BuildContext context) => MyGrideViewDemo2(),
    '/slivers' : (BuildContext context) => MySlivers(),
    '/customScrollView' : (BuildContext context) => MyCustomScrollView(),
    '/customScrollView1' : (BuildContext context) => MyCustomScrollView1(),
    '/scrollListen1' : (BuildContext context) => MyHomePage(),
    '/scrollListen2' : (BuildContext context) => MyHomeNotificationDemo(),

    '/myrouter' : (BuildContext context) => FirstScreen(),
    '/myProduct' : (BuildContext context) => ProductList(),
    '/myCallPhone' : (BuildContext context) => FirstPage(),
    '/PushNameDemo' : (BuildContext context) => PushNameDemo(),
  };
}


