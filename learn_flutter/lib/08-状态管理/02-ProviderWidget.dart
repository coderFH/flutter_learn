import 'package:flutter/material.dart';
import '02-user_view_model.dart';
import 'package:provider/provider.dart';
import '02-counter_view_model.dart';

/*
 1.创建自己需要共享的数据 (比如我们创建的viewmodel文件)
 2.在应用程序的顶层ChangeNotifierProvider (也就是在runApp那里套一个MultiProvider)
 3.在其它位置使用共享的数据
     > Provider.of: 当Provider中的数据发生改变时, Provider.of所在的Widget整个build方法都会重新构建
     > Consumer(相对推荐): 当Provider中的数据发生改变时, 执行重新执行Consumer的builder
     > Selector: 1.selector方法(作用,对原有的数据进行转换) 2.shouldRebuild(作用,要不要重新构建)
 */
class FHProviderDomo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("provide练习"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Number1(),
            Number2(),
            Text3(),
            MyButton(),
          ],
        ),
      ),
    );
  }
}

class Number1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Number1 的 build 方法走了");

    //Provider.of所在的Widget整个build方法都会重新构建
    var value = Provider.of<FHCounterViewModel>(context).counter;

    return Container(
        child: Text('$value',style: Theme.of(context).textTheme.display1),
    );
  }
}

class Number2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Number2 的 build 方法走了");

    return Container(
      child: Consumer<FHCounterViewModel>( //Consumer(相对推荐): 当Provider中的数据发生改变时, 执行重新执行Consumer的builder
        builder: (ctx,counterVM,child) {
          print("Number2 Consumer build方法被执行");
          return Text('当前计数:${counterVM.counter}',style: Theme.of(context).textTheme.display1);
        },
      ),
    );
  }
}

//如果我一个控件关联两个viewModel,可以使用Consumer2
class Text3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Text3 的 build 方法走了");

    return Container(
      child: Consumer2<FHCounterViewModel,FHUserViewModel>(
        builder: (ctx,counterVM,userVM,child) {
          print("Text3 Consumer build方法被执行");
          return Text('当前计数:${counterVM.counter} ${userVM.user.nickname}',
              style: Theme.of(context).textTheme.display1);
        },
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //当我们使用Consumer时候,这里只是一个增加数据的操作,没有必要刷新Consumer内部的控件
      //这种情况下就可以使用Selector
//      child: Consumer<FHCounterViewModel>(
//        builder: (context,counterVM, child) {
//          print("RaisedButton build Selector 方法被执行");
//          return RaisedButton(
//            onPressed: (){
//              counterVM.counter ++;
//            },
//            child: Text("递增"),
//          );
//        }
//      ),

      child: Selector<FHCounterViewModel,FHCounterViewModel>(
        selector: (ctx,counterVM) => counterVM,
        //最新版本有个参数 shouldRebuild: (prev, next) => false, 要不要重新构建
        builder: (ctx,counterVM,child) {
        print("RaisedButton build Selector 方法被执行");
        return RaisedButton(
          onPressed: (){
            counterVM.counter ++;
          },
          child: child,
        );
      },
        child: Text("递增"), //按钮的文字用这个参数传进入,这样他的子控件也不会重新构建了
      ),
    );
  }
}