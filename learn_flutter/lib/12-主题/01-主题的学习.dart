import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FHThemeDemo extends StatefulWidget {
  @override
  _FHThemeDemoState createState() => _FHThemeDemoState();
}

class _FHThemeDemoState extends State<FHThemeDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "我是在切换程序中显示的(安卓有效)",
      theme: ThemeData(
        //1.亮度
        brightness: Brightness.light,//如果是dark,就是暗黑模式

        //2.经测试,目前发现能影响的控件有导航栏,底部TabBar,安卓风格Switch按钮,FloatingActionButton....
        //primarySwatch传入不是Color, 而是MaterialColor(包含了primaryColor和accentColor)
        primarySwatch: Colors.red, //主题风格就是红色

        //3.primaryColor: 单独设置导航和TabBar的颜色
        primaryColor: Colors.teal,

        // 4.accentColor: 单独设置FloatingActionButton\Switch
        accentColor: Colors.green,

        // 5.Button的主题
        buttonTheme: ButtonThemeData(
            height: 25,
            minWidth: 10, //也可以在这里改按钮的最小宽度
            buttonColor: Colors.orange
        ),

        // 6.Card的主题
        cardTheme: CardTheme(
          color: Colors.greenAccent,
          elevation: 10 //设置阴影的便宜
        ),

        // 7.Text的主题
        textTheme: TextTheme(
          //默认文本的字体大小就是14,如果想修改可以修改body1
          body1: TextStyle(fontSize: 16, color: Colors.red),

          //body2默认是body1的粗体
          body2: TextStyle(fontSize: 20,color: Colors.blue),

          display1: TextStyle(fontSize: 14),
          display2: TextStyle(fontSize: 16),
          display3: TextStyle(fontSize: 18),
          display4: TextStyle(fontSize: 20),
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('主题'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Switch(value: true,onChanged: (value){},),
              CupertinoSwitch(value: true,onChanged: (value){},activeColor: Colors.yellow,),
              RaisedButton(child: Text("R"), onPressed: () {},),
              Card(child: Text("你好啊,李银河", style: TextStyle(fontSize: 50),),),

              Text("Hello World1"), //使用设置了默认的16号字,使用的是body1设置的
              Text("Hello World2",style: Theme.of(context).textTheme.body1,), //明确的是用body1 //有问题,为什么明确使用body1,没按body1的样式走
              Text("Hello World3", style: TextStyle(fontSize: 16),),//明确指定16号字体,由此可见是一样大的

              Text("Hello World4", style: TextStyle(fontSize: 20,color: Colors.purple),),
              Text("Hello World5", style: Theme.of(context).textTheme.body2,),//有问题,为什么明确使用body2,没按body2的样式走

              Text("display3", style: Theme.of(context).textTheme.display3,),

            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              title: Text("首页"),
              icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                title: Text("分类"),
                icon: Icon(Icons.category)
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.category),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) {
                return FHDetailPage();
              }
            ));
          }
        ),
      ),
    );
  }
}

class FHDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          primaryColor: Colors.purple
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Text("detail pgae"),
        ),
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                  secondary: Colors.pink
              )
          ),
          child: FloatingActionButton(
            child: Icon(Icons.pets),
            onPressed: () {
            },
          ),
        ),
      ),
    );
  }
}
