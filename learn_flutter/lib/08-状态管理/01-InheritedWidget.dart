import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FHCounterdWidget extends InheritedWidget {
  //1.共享的数据
  final int counter;

  //2.定义构造方法
  FHCounterdWidget({this.counter,Widget child}) : super(child : child);


  //3.获取组件最近的当前InheritedWidget
  static FHCounterdWidget of(BuildContext context) {
    //沿着Element树,去找到最近的FHCounterElement, 从Element中取出Widget对象
    //return context.dependOnInheritedWidgetOfExactType(); //最新版本的写法
    return context.inheritFromWidgetOfExactType(FHCounterdWidget) as FHCounterdWidget;
  }

  // 4.决定要不要回调State中的didChangeDependencies
  // 如果返回true: 执行依赖当期的InheritedWidget的State中的didChangeDependencies
  @override
  bool updateShouldNotify(FHCounterdWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}

//-------------------- 修改数据  --------------------
class FHInheritedDemo extends StatefulWidget {
  @override
  _FHInheritedDemoState createState() => _FHInheritedDemoState();
}

class _FHInheritedDemoState extends State<FHInheritedDemo> {
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FHCounterdWidget(
        counter: _counter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FHInheritedData1(),
              FHInheritedData2(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}

//-------------------- 数据展示1 --------------------
class FHInheritedData1 extends StatefulWidget {
  @override
  _FHInheritedData1State createState() => _FHInheritedData1State();
}

class _FHInheritedData1State extends State<FHInheritedData1> {
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("执行了_FHInheritedData1State中的didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {

    int counter = FHCounterdWidget.of(context).counter;

    return Card(
      color: Colors.red,
      child: Text("当前计数:$counter"),

    );
  }
}

//-------------------- 数据展示2 --------------------
class FHInheritedData2 extends StatefulWidget {
  @override
  _FHInheritedData2State createState() => _FHInheritedData2State();
}

class _FHInheritedData2State extends State<FHInheritedData2> {
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("执行了_FHInheritedData2State中的didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {

    int counter = FHCounterdWidget.of(context).counter;

    return Card(
      color: Colors.blue,
      child: Text("当前计数:$counter"),
    );
  }
}

