import 'package:flutter/cupertino.dart';

class sss extends StatefulWidget {
  @override
  _sssState createState() => _sssState();
}

class _sssState extends State<sss> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class FHTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Opacity(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("1111"),
            ),
          ),
        ],
      ),
    );
  }
}
/*

Flutter中组件分为两大类
1.组装的widget,不会生成RenderObject
  eg:
    Container()
    Text()
    FHTest()

  继承关系:
    组件 -> StatelessWidget -> Widget

2.渲染的widget,会生成RenderObject
  eg:
    Padding()
    Row()

  继承关系:
    组件 -> SingleChildRenderObjectWidget -> RenderObjectWidget -> Widget

  RenderObjectWidget类中有一个createRenderObject方法,他是抽象类,定义的方法必须由子类实现
  可以看到 Padding 中 实现了 createRenderObject这个方法
  具体的显示方法
  return RenderPadding(
      padding: padding,
      textDirection: Directionality.of(context),
  );
  可见返回了一个RenderPadding对象,RenderPadding的继承关系
  RenderPadding -> RenderShiftedBox -> RenderBox -> RenderObject

  RenderPadding的源码中有个这样的实现
  set padding(EdgeInsetsGeometry value) {
    assert(value != null);
    assert(value.isNonNegative);
    if (_padding == value)
      return;
    _padding = value;
    _markNeedResolution();
  }
  1. 如果传入的_padding和原来保存的value一样，那么直接return；
  2. 如果不一致，调用_markNeedResolution，而_markNeedResolution内部调用了markNeedsLayout；
  3. 而markNeedsLayout的目的就是标记在下一帧绘制时，需要重新布局performLayout；
  4. 如果我们找的是Opacity，那么RenderOpacity是调用markNeedsPaint，RenderOpacity中是有一个paint方法的


  element是什么?
    RenderObjectWidget中有个抽象方法
      RenderObjectElement createElement();
    对于padding来说,子类SingleChildRenderObjectWidget中有个实现
      SingleChildRenderObjectElement createElement() => SingleChildRenderObjectElement(this);

    而对于Container来说,Widget中有个抽象方法
      StatelessElement createElement() => StatelessElement(this);
    子类StatelessWidget中有这个实现
      StatelessElement createElement() => StatelessElement(this);

    而对于StatefulWidget来说,自己实现了父类的StatelessElement方法
      StatefulElement createElement() => StatefulElement(this);

    说明在创建Widget中,Element也被创建,并且在创建时,将this(Widget)传入了
    Element就保存了对Widget的引用
    所有的Widget都会创建一个对象的Element对象
    只不过不同的Widget,会创建不同的Element对象

    StatelessElement和StatefulElement都继承ComponentElement,
    但StatefulElement会比StatelessElement多一个_state的引用,
    所以对于 StatefulWidget 而言,创建的 StatefulElement 的 _state 属性会对 StatefulWidget
    的State有个引用

   总结一下控件的创建过程:
    1.自己写一个Widget
    2.对于可渲染的Widget,会创建RenderObject
    3.每一个Widget都会创建一个Element对象
    4.1 对于 ComponentElement 父类 Element 中有个 mount方法
      子类ComponentElement实现了该方法 依次调用;
       mount方法 -> firstBuild -> rebuild -> performBuild -> build -> _widget.build(这里就调用了我们每次重写的那个build方法了)
       在StatelessElement中 实现了一个 Widget build() => widget.build(this); 这里的this 其实就是Element
       所以Widget build(BuildContext context) 这里的context 其实就是当前控件对应的Element
    4.2 对于SingleChildRenderObjectElement 我们看他父类(super点上去)的mount 主要是进行一些挂载的操作
      子类中有个一个_renderObject = widget.createRenderObject(this); 就进行绘制操作
    5.由此可见 ComponentElement 最主要的职责是进行build操作
           而 SingleChildRenderObjectElement 最主要的目的是创建我们的RenderObject
*/
