import 'package:flutter/material.dart';

/*
  Row/Column: 继承自Flex
  Flex: CSS Flex布局, 直接使用的较少
  Axis.vertical: Column
  Axis.horizontal: Row
*/

class MyRowColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row-Column'),
      ),

      /*
        RowDemo1(),
        ButtonRowDemo(),
        RowDemo2(),
        ColumnDemo(),
        RowExpanded(),
        ColumnExpanded(),
       */
      body: ColumnExpanded()
    );
  }
}

//============================== 14. Row =============================

/*
 * Row特点:
 *  - 水平方向尽可能占据比较大的空间
 *    * 水平方向也是希望包裹内容, 那么设置mainAxisSize = min
 *  - 垂直方向包裹内容
 * MainAxisAlignment:
 *  - start: 主轴的开始位置挨个摆放元素(默认值)
 *  - end: 主轴的结束位置挨个摆放元素
 *  - center: 主轴的中心点对齐
 *  - spaceBetween: 左右两边的间距为0, 其它元素之间平分间距
 *  - spaceAround: 左右两边的间距是其它元素之间的间距的一半
 *  - spaceEvenly: 所有的间距平分空间
 * CrossAxisAlignment:
 *  - start: 交叉轴的起始位置对齐
 *  - end: 交叉轴的结束位置对齐
 *  - center: 中心点对齐(默认值)
 *  - baseline: 基线对齐(必须有文本的时候才起效果)
 *  - stretch: 先Row占据交叉轴尽可能大的空间, 将所有的子Widget交叉轴的高度, 拉伸到最大
 */

//1.------------------------- Row的基本使用 -------------------------
class RowDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch, //外层包了一个Container,并且高度是300,设置为stretch的时候,会尽量的拉伸到最大
        mainAxisSize: MainAxisSize.max, //默认是最大,如果改为min,其实就是包裹内容了
        textBaseline: TextBaseline.ideographic, //如果交叉轴设置基线对齐,需要此属性说明依据哪个基线
        children: <Widget>[
          Container(width: 80,height: 60,color: Colors.red,child: Text("hello",style:TextStyle(fontSize: 20),),),
          Container(width: 120,height: 100,color: Colors.green,child: Text("world",style:TextStyle(fontSize: 30),),),
          Container(width: 90,height: 80,color: Colors.blue,child: Text("cxba",style:TextStyle(fontSize: 12),),),
          Container(width: 50,height: 120,color: Colors.orange,child: Text("hello",style:TextStyle(fontSize: 40),),),
        ],
      ),
    );
  }
}

//2.------------------------- 利用Row来实现一个按钮的例子(这个按钮左边是图片,右边是文字
class ButtonRowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.red,
      child: Row(
        mainAxisSize: MainAxisSize.min, //如果不指定min,水平方向尽可能占据比较大的空间,即一行展示
        children: <Widget>[
          Icon(Icons.bug_report),
          Text("bug报告"),
        ],
      ),
      onPressed: () => print("按钮被点击了"),
    );
  }
}


//3.------------------------- textDirection -------------------------
// textDirection: TextDirection.rtl, 排版从右到左的话,MainAxisAlignment.star也是从右边开始了
class RowDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl, //是从左往右,还是从右到左
      mainAxisAlignment: MainAxisAlignment.start, // mainAxisSize 值为 MainAxisSize.min，则此属性无意义，因为子组件的宽度等于Row的宽度
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(color: Colors.redAccent,width: 20,height: 60,),
        Container(color: Colors.blue,width: 80,height: 80,),
        Container(color: Colors.green,width: 70,height: 70,),
        Container(color: Colors.orange,width: 100,height: 100,),
//        Container(color: Colors.orange,width: 200,height: 100,), //row默认只有一行,超出了就会报错
      ],
    );
  }
}

//4.------------------------- Column -------------------------
class ColumnDemo extends StatelessWidget {
  const ColumnDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      verticalDirection: VerticalDirection.down, //和Row的textDirection的作用一致,不过他是作用于竖向的
      mainAxisSize: MainAxisSize.max, //同样,如果设置成min,Column的高度就包括了内容,你主轴再怎么设置展示方式都没用
      children: <Widget>[
        Container(
          width: 80,
          height: 60,
          color: Colors.red,
          child: Text(
            "Hellxo",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          width: 120,
          height: 100,
          color: Colors.green,
          child: Text(
            "Woxrld",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
          width: 90,
          height: 80,
          color: Colors.blue,
          child: Text(
            "abxc",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          width: 50,
          height: 120,
          color: Colors.orange,
          child: Text(
            "cxba",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ],
    );
  }
}

//5.------------------------- Row-Expanded -------------------------
/*
Flexible中的属性:
* - flex
* Expanded(更多) -> Flexible(fit: FlexFit.tight)

Expanded 其实是继承Flexible,并且把Flexible的属性fit: FlexFit.tight
*/

class RowExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(color: Colors.redAccent,height: 60,),
        ),
        Container(color: Colors.blue, width: 80, height: 80),
        Container(color: Colors.green, width: 70, height: 70),
        Expanded(
          flex: 1,
          child: Container(color: Colors.orange,height: 100,),
        )
      ],
    );
  }
}

//6.------------------------- Column-Expanded -------------------------
class ColumnExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(color: Colors.redAccent,width: 60,),
        ),
        Container(color: Colors.blue, width: 80, height: 80),
        Container(color: Colors.green, width: 70, height: 70),
        Expanded(
          flex: 1,
          child: Container(color: Colors.orange, width: 100),
        )
      ],
    );
  }
}




