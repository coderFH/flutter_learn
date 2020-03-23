import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FHKey extends StatefulWidget {
  @override
  _FHKeyState createState() => _FHKeyState();
}

class _FHKeyState extends State<FHKey> {
  final List<String> names = ["aaa","bbb","ccc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: names.map((item) {
          return ListItemFul(item,key: UniqueKey(),); //UniqueKey()系统提供的一个唯一的key
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: (){
          setState(() {
            names.removeAt(0);
          });
        },
      ),
    );
  }
}

/*
当我们使用StatelessWidget,点击删除第一个时候,发现随机色也是跟着变
说明了重走了build方法,所有的widget重新创建
假如我们改成StatefulWidget又会如何呢??
* */
class ListItemLess extends StatelessWidget {
  final String name;
  final Color randomColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));
  ListItemLess(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name),
      height: 80,
      color:  randomColor,
    );
  }
}




/*
我们发现一个很奇怪的现象，颜色不变化，但是数据向上移动了
  这是因为在删除第一条数据的时候，Widget对应的Element并没有改变；
  而Element中对应的State引用也没有发生改变；
  在更新Widget的时候，Widget使用了没有改变的Element中的State；

  源码中的代码
  static bool canUpdate(Widget oldWidget, Widget newWidget) {
    return oldWidget.runtimeType == newWidget.runtimeType
      && oldWidget.key == newWidget.key;
  }

  所以我们可以传参的时候绑定一个key,保证key是唯一的,这样就能保证强制刷新,而不会产生复用问题

  Key本身是一个抽象，不过它也有一个工厂构造器，创建出来一个ValueKey
  直接子类主要有：LocalKey和GlobalKey
    LocalKey，它应用于具有相同父Element的Widget进行比较，也是diff算法的核心所在；
    GlobalKey，通常我们会使用GlobalKey某个Widget对应的Widget或State或Element


  LocalKey有三个子类
    ValueKey：
      ValueKey是当我们以特定的值作为key时使用，比如一个字符串、数字等等
    ObjectKey：
      如果两个学生，他们的名字一样，使用name作为他们的key就不合适了
      我们可以创建出一个学生对象，使用对象来作为key
  UniqueKey
      如果我们要确保key的唯一性，可以使用UniqueKey；
      比如我们之前使用随机数来保证key的不同，这里我们就可以换成UniqueKey；

  3.6.2. GlobalKey
    GlobalKey可以帮助我们访问某个Widget的信息，包括Widget或State或Element等对象
*/

class ListItemFul  extends StatefulWidget {
  final String name;
  ListItemFul(this.name, {Key key}) : super(key : key);

  @override
  _ListItemFulState createState() => _ListItemFulState();
}

class _ListItemFulState extends State<ListItemFul> {

  final Color randColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 30),),
      height: 80,
      color: randColor,
    );
  }
}


