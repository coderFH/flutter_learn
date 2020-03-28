import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FHHeartDemo1 extends StatefulWidget {
  @override
  _FHHeartDemoState createState() => _FHHeartDemoState();
}

class _FHHeartDemoState extends State<FHHeartDemo1> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  Animation _sizeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3)
    );

    _animation = CurvedAnimation(parent: _controller,curve: Curves.linear);

    _sizeAnim = Tween(begin: 50.0,end: 150.0).animate(_animation);

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
        child: FHAnimatedIcon(_sizeAnim),
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

class FHAnimatedIcon extends AnimatedWidget {
  FHAnimatedIcon(Animation anim): super(listenable: anim);

  @override
  Widget build(BuildContext context) {
    //AnimatedWidget有一个listenable属性,构造函数中把anim直接赋值给了listenable属性
    //所以这里直接赋值,拿到anim
    Animation anim = listenable;
    return Icon(Icons.favorite, color: Colors.red, size: anim.value,);
  }
}
