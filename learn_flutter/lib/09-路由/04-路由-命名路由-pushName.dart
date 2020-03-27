import 'package:flutter/material.dart';

class PushNameDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        FirstPushName.routeName : (BuildContext context) => FirstPushName(),
        SecondScreen.routeName: (BuildContext context) => SecondScreen(),
      },
      initialRoute: '/',
      onGenerateRoute: (settings) { //如果这里代码太多了,都可以往外抽取
        if(settings.name == AboutPage.routeName) {
          return MaterialPageRoute(
            builder: (ctx) {
              return AboutPage(settings.arguments);
            }
          );
        }
        return null;
      },
      onUnknownRoute: (settings)  {
        return MaterialPageRoute(
          builder: (ctx) {
            return Unknown();
          }
        );
      },
    );
  }
}

//======================= 首页 =======================
class FirstPushName extends StatefulWidget {

  static const String routeName = "/";

  @override
  _FirstPushNameState createState() => _FirstPushNameState();
}

class _FirstPushNameState extends State<FirstPushName> {
  String message = '';
  String aboutStr = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主页'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("查看商品详情-$message"),
              onPressed: (){
                Future result =  Navigator.pushNamed(context,SecondScreen.routeName,arguments: '我是传递的参数');
                result.then((res){
                  setState(() {
                    message = res;
                  });
                });
              },
            ),
            RaisedButton(
              child: Text("跳转关于页面-$aboutStr"),
              onPressed: (){
                Future result =  Navigator.pushNamed(context,AboutPage.routeName,arguments: '我是传递关于的参数');
                result.then((res){
                  setState(() {
                    aboutStr = res;
                  });
                });
              },
            ),
            RaisedButton(
              child: Text("跳转一个不存在的页面"),
              onPressed: (){
                Navigator.pushNamed(context,'/qqqqq',arguments: '我是传递关于的参数');
              },
            ),
          ],
        ),
      ),
    );
  }
}


//======================= 1.测试普通跳转并传递数据 =======================
class SecondScreen extends StatelessWidget {

  static const String routeName = "/second";

  const SecondScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final message = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情页'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pop(context,"我是返回的参数");
          },
          child: Text('返回页面-$message'),
        ),
      ),
    );
  }
}

//======================= 2.有构造函数的页面 =======================
class AboutPage extends StatelessWidget {

  static const String routeName = "/about";

  final String info;
  AboutPage(this.info);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("关于"),
      ),
      body:Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pop(context,"我是返回关于的参数");
          },
          child: Text('返回页面-$info'),
        ),
      ),
    );
  }
}

//======================= 3.没有匹配到的都进入错误页面 =======================
class Unknown extends StatelessWidget {

  static const String routeName = "/unknown";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("您跳转的页面不存在"),
      ),
      body:Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('您跳转的页面不存在-点击返回'),
        ),
      ),
    );
  }
}