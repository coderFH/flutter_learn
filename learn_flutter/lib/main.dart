import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '01-基础控件-Text.dart';
import '02-基础控件-Image.dart';
import '03-基础控件-Button.dart';
import '04-基础控件-CheckBox.dart';
import '05-基础控件-TextField.dart';
import '06-基础控件-progress.dart';
import '07-基础控件-有状态组件.dart';
import '08-布局组件-Row_Column.dart';
import '09-布局组件-Wrap_Flow.dart';
import '10-布局组件-Stack.dart';
import '11-布局组件-Align_Center.dart';
import '12-容器组件-Padding.dart';
import '13-容器组件-限定大小.dart';
import '14-容器组件-DecoratedBox.dart';
import '15-容器组件-Transform.dart';
import '16-容器组件-Container.dart';
import '17-容器组件-Clip.dart';
import '18-可滚动组件-SingleChildScrollView.dart';
import '19-可滚动组件-ListView.dart';
import "20-可滚动组件-GridView.dart";
import '21-可滚动组件-Slivers.dart';
import '22-可滚动组件-CustomScrollView.dart';
import '23-可滚动组件-滚动监听.dart';
import '24-状态管理-Provider.dart';
import '24-counter.dart';
import '25-路由-简单的跳转.dart';
import '26-路由-传递数据.dart';
import '27-路由-回带数据.dart';
import '28-maperialapp_appbar.dart';
import '29-maperialapp_bottomnavigationbar.dart';
import '30-maperialapp_drawer.dart';
import '31-maperialapp_scaffold.dart';
import '32-maperialapp_tabbar.dart';
import '33-maperialapp_tabbar2.dart';
import '34-cupertino_loading.dart';

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
      providers: [
        ChangeNotifierProvider(
          create: (context) => Counter(0),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter学习',
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
        routes: {
          '/text' : (BuildContext context) => MyText(),
          '/image' : (BuildContext context) => MyImage(),
          '/button' : (BuildContext context) => CustomButton(),
          '/checkBox' : (BuildContext context) => MyCheckBoxWidget(),
          '/textField' : (BuildContext context) => MyTextField(),
          '/progress' : (BuildContext context) => MyProgress(),
          '/fullWidget' : (BuildContext context) => MyCounterWidget(),
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
          '/scrollListen1' : (BuildContext context) => MyHomePage(),
          '/scrollListen2' : (BuildContext context) => MyHomeNotificationDemo(),
          '/provide' : (BuildContext context) => CartPage(),
          '/myrouter' : (BuildContext context) => FirstScreen(),
          '/myProduct' : (BuildContext context) => ProductList(),
          '/myCallPhone' : (BuildContext context) => FirstPage(),
        },
        home: FirstListPage(),
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
          _listViewItem(context,'容器组件-Clip', '/Clip'),
          _listViewItem(context,'滚动组件-SingleChildScrollView', '/singleChildScrollView'),
          _listViewItem(context,'滚动组件-ListView使用方式1', '/listView1'),
          _listViewItem(context,'滚动组件-ListView使用方式2', '/listView2'),
          _listViewItem(context,'滚动组件-ListView-ListTile', '/listTitle'),
          _listViewItem(context,'滚动组件-ListView-scrollDirection', '/scrollDirection'),
          _listViewItem(context,'滚动组件-ListView-ListView.build', '/listBuild'),
          _listViewItem(context,'滚动组件-ListView-ListView.build动态加载数据', '/listBuild1'),
          _listViewItem(context,'滚动组件-ListView- ListView.separated', '/listSeparated'),
          _listViewItem(context,'可滚动组件-gride1', '/gridView'),
          _listViewItem(context,'可滚动组件-gride2', '/gridView1'),
          _listViewItem(context,'可滚动组件-gride.build', '/gridViewBuild'),
          _listViewItem(context,'可滚动组件-Slivers', '/slivers'),
          _listViewItem(context,'可滚动组件-CustomScrollView', '/customScrollView'),
          _listViewItem(context,'可滚动组件-滚动监听', '/scrollListen1'),
          _listViewItem(context,'可滚动组件-滚动监听-NotificationListener', '/scrollListen2'),
          _listViewItem(context,'状态管理-provider', '/provide'),
          _listViewItem(context,'路由-简单的跳转', '/myrouter'),
          _listViewItem(context,'路由-数据传递', '/myProduct'),
          _listViewItem(context,'路由-回带数据', '/myCallPhone'),

          _newListViewItem(context, 'maperialapp-appbar', MyappBar()),
          _newListViewItem(context, 'maperialapp_bottomnavigationbar', MybottomNavigationBar()),
          _newListViewItem(context, 'maperialapp-drawer', MyDrawer()),
          _newListViewItem(context, 'maperialapp-scaffold', MyScaffold()),
          _newListViewItem(context, 'maperialapp-tabbar', MyTabbar()),
          _newListViewItem(context, 'maperialapp-tabbar2', MyTabbar1()),
          _newListViewItem(context, 'cupertino_loading', MyLoading()),
        ],
      ),
    );
  }

  Widget _listViewItem(BuildContext context, String name,String routeUrl) {
    return ListTile(
      leading: Icon(Icons.access_time,size: 18,),
      title: Text(name),
      trailing: Icon(Icons.arrow_right),
      onTap: (){
        Navigator.pushNamed(context, routeUrl);
      },
    );
  }

  Widget _newListViewItem(BuildContext context,String name,Object w) {
    return ListTile(
      leading: Icon(Icons.access_time,size: 18,),
      title: Text(name),
      trailing: Icon(Icons.arrow_right),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => w));
      },
    );
  }
}