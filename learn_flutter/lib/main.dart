import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '01-基础组件/00-生命周期.dart';
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

import '05-豆瓣案例/douban_main.dart';

import '06-W-E-RO/02-Key的使用.dart';
import '06-W-E-RO/03-GlobalKey的使用.dart'
;
import '07-网络请求/01-dio的封装.dart';

import '08-状态管理/01-InheritedWidget.dart';
import '08-状态管理/02-initialize_providers.dart';
import '08-状态管理/02-ProviderWidget.dart';

import '09-路由/01-路由-简单的跳转-push.dart';
import '09-路由/02-路由-传递数据-push.dart';
import '09-路由/03-路由-回带数据-push.dart';
import '09-路由/04-路由-命名路由-pushName.dart';

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

import '28-maperialapp_appbar.dart';
import '29-maperialapp_bottomnavigationbar.dart';
import '30-maperialapp_drawer.dart';
import '31-maperialapp_scaffold.dart';
import '32-maperialapp_tabbar.dart';
import '33-maperialapp_tabbar2.dart';
import '34-cupertino_loading.dart';
import '35-showDialog.dart';


/*
* 运行一个Flutter项目:
* 1.冷启动(从零启动1m-5m)
* 2.热重载(最主要是执行build方法)
* 3.热重启(重新运行整个APP)
*
*
* 进去Flutter的widget的源码中,我们会看到一些使用@required修饰的可选参数
* 被这个修饰的属性,是必须赋值的
* 那为什么不传成必传参数,而是放入命名可选参数中呢?
* 因为这样就可以不用按照必须的顺序去传参,我传参的顺序可以是无序的
*
*
* android/ios 命令式编程 - 没有状态一说,有的就是属性-数据
* vue-react-angular 声明式编程(只需要管理好状态就可以)
* */

//============================== 1.最原始的写法 ================================
/*main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("wfh"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
                value: true,
                onChanged: (value) => print('hello world')),
            Text(
              'hello world',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 36),
            ),
          ],
        ),
      ),
    ),
  ),
  );
}*/

//============================== 2.代码抽离 ================================
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              value: true,
              onChanged: (value) => print("hello world")
          ),
          Text("同意协议",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: initproviders,
      child: MaterialApp(
        title: 'Flutter学习',
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
        routes: {
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
        },

        initialRoute: "/",
//        home: FirstListPage(), //如果配置了路由信息,这一句可以用上边一句代替
      ),
    );
  }
}

class FirstListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluter学习"),
      ),
      body: ListView(
        children: <Widget>[
          _newListViewItem(context, '生命周期', HYHomeDemo()),

          _listViewItem(context,'基础控件-Text','/text'),
          _listViewItem(context,'基础控件-image','/image'),
          _listViewItem(context,'基础控件-button','/button'),
          _listViewItem(context,'基础控件-checkBox','/checkBox'),
          _listViewItem(context,'基础控件-textField','/textField'),
          _listViewItem(context,'基础控件-progress','/progress'),
          _listViewItem(context,'基础控件-有状态组件','/fullWidget'),

          _listViewItem(context,'布局组件-Row_Column','/rowColumn'),
          _listViewItem(context,'布局组件-wrap_flow','/wrapFlow'),
          _listViewItem(context,'布局组件-Stack','/myStack'),
          _listViewItem(context,'布局组件-Align_Center', '/alignCenter'),

          _listViewItem(context,'容器组件-Padding', '/padding'),
          _listViewItem(context,'容器组件-限定大小', '/size'),
          _listViewItem(context,'容器组件-DecoratedBox', '/decoratedBox'),
          _listViewItem(context,'容器组件-transform', '/transform'),
          _listViewItem(context,'容器组件-Container', '/container'),
          _listViewItem(context,'容器组件-Clip', '/Clip'),

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

          _newListViewItem(context, "豆瓣案例", DouBan()),

          _newListViewItem(context, "key的使用", FHKey()),
          _newListViewItem(context, "GlobalKey的使用", FHGolbalKeyDemo()),

          _newListViewItem(context, "dio的封装使用", DioDemo()),

          _newListViewItem(context, "状态管理-InheritedWidget", FHInheritedDemo()),
          _newListViewItem(context, "状态管理-ProvideWidget", FHProviderDomo()),

          _newListViewItem(context, "事件处理-pointer_gusture", FHPointGestureDemo()),
          _newListViewItem(context, "事件处理-Gesture手势", FHGestureDemo()),
          _newListViewItem(context, "事件处理-冒泡方式的处理", FHBubblingDemo()),
          _newListViewItem(context, "事件处理-event_bus", FHEventBusDemo()),

          _listViewItem(context,'路由-简单的跳转', '/myrouter'),
          _listViewItem(context,'路由-数据传递', '/myProduct'),
          _listViewItem(context,'路由-回带数据', '/myCallPhone'),
          _listViewItem(context,'路由-命名路由-pushName', '/PushNameDemo'),

          _newListViewItem(context, "动画-心跳动画", FHHeartDemo()),
          _newListViewItem(context, "动画-心跳动画-AnimatedWidget", FHHeartDemo1()),
          _newListViewItem(context, "动画-心跳动画-AnimatedBuilder", FHHeartDemo2()),
          _newListViewItem(context, "动画-交织动画", FHStaggeredDemo()),
          _newListViewItem(context, "动画-路由跳转的动画补充", FHAnimalRouter()),
          _newListViewItem(context, "动画-Hero动画", FHHeroDemo()),

          _newListViewItem(context, 'maperialapp-appbar', MyappBar()),
          _newListViewItem(context, 'maperialapp_bottomnavigationbar', MybottomNavigationBar()),
          _newListViewItem(context, 'maperialapp-drawer', MyDrawer()),
          _newListViewItem(context, 'maperialapp-scaffold', MyScaffold()),
          _newListViewItem(context, 'maperialapp-tabbar', MyTabbar()),
          _newListViewItem(context, 'maperialapp-tabbar2', MyTabbar1()),
          _newListViewItem(context, 'cupertino_loading', MyLoading()),
          _newListViewItem(context, 'showDialog', MyDialog()),
        ],
      ),
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
}