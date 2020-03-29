import 'package:flutter/material.dart';
import 'package:learn_flutter/FHRouter.dart';

import 'package:provider/provider.dart';

import '08-状态管理/02-initialize_providers.dart';

import 'FHInitWidget.dart';

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
        routes: FHRouter.routerList,
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
          BasicWidget(context),
          layoutWidget(context),
          ContainerWidget(context),
          ScrollableWidget(context),
          ProjectWidget(context),
          BaseStudy(context),
          NetWorkWidget(context),
          StateManageWidget(context),
          RouterWidget(context),
          EventWidget(context),
          AnimalWidget(context),
          TesstWidget(context),
        ],
      ),
    );
  }
}