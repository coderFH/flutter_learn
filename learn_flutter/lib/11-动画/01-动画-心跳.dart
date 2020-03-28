import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FHHeartDemo extends StatefulWidget {
  @override
  _FHHeartDemoState createState() => _FHHeartDemoState();
}

class _FHHeartDemoState extends State<FHHeartDemo> with SingleTickerProviderStateMixin {
  // 创建AnimationController
  AnimationController _controller;
  Animation _animation;
  Animation _sizeAnim;

  @override
  void initState() {
    super.initState();
    // 1.创建AnimationController
    //vsync:屏幕刷新的同步信号,这里传入this,指的是当前控件,但vsync接受的是TickerProvider类型
    //而Dart不支持多继承,所以这里需要混入,
    //当我们混入某个类时,其实当前的这个类就具备混入这个类的相关功能,并且具有混入类的所用相关属性和相关方法,有点类似于继承了
    //而我们混入的SingleTickerProviderStateMixin类,是有实现TickerProvider这个接口的,所以这里传this就没问题
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3)
    );

    // 2.设置Curve的值
    _animation = CurvedAnimation(parent: _controller,curve: Curves.linear);

    //3.Tween
    _sizeAnim = Tween(begin: 50.0,end: 150.0).animate(_animation);

    //监听动画值的改变
    _controller.addListener((){setState(() {});});

    // 监听动画的状态改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    print("执行_FHHeartDemoState的build方法");
    return Scaffold(
      appBar: AppBar(
        title: Text("心跳动画"),
      ),
      body: Center(
        child: Icon(Icons.favorite,color: Colors.red,size: _sizeAnim.value,),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
          if (_controller.isAnimating) {
            _controller.stop();
            print(_controller.status);
          } else if (_controller.status == AnimationStatus.forward) {
            _controller.forward();
          } else if (_controller.status == AnimationStatus.reverse) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}




/**
 *  1.Animation: 抽象类
 *    * 监听动画值的改变
 *    * 监听动画状态的改变
 *    * value
 *    * status
 *  2.AnimationController继承自Animation
 *    * vsync: 同步信号(this -> with SingleTickerProviderStateMixin)
 *    * forward(): 向前执行动画
 *    * reverse(): 反转执行动画
 *  3.CurvedAnimation:
 *    * 作用: 设置动画执行的速率(速度曲线)
 *  4.Tween: 设置动画执行的value范围
 *    * begin: 开始值
 *    * end: 结束值
 */
