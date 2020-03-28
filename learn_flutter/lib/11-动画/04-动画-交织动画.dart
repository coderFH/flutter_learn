import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FHStaggeredDemo extends StatefulWidget {
  @override
  _FHHeartDemoState createState() => _FHHeartDemoState();
}

class _FHHeartDemoState extends State<FHStaggeredDemo> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  Animation _sizeAnim;
  Animation _colorAnim;
  Animation _opacityAnim;
  Animation _radiansAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3)
    );

    _animation = CurvedAnimation(parent: _controller,curve: Curves.linear);

    //这里的.animate(_controller)之所以传_controller,而不传_animation
    //是因为下边的Tween可能不支持curve: Curves.linear 这里设置的某些动画速率样式

    // 3.1.创建size的tween
    _sizeAnim = Tween(begin: 10.0, end: 200.0).animate(_controller);
    // 3.2.创建color的tween
    _colorAnim = ColorTween(begin: Colors.orange, end: Colors.purple).animate(_controller);
    // 3.3.创建opacity的tween
    _opacityAnim = Tween(begin: 0.0, end: 1.0).animate(_controller);
    // 3.4.创建radians的tween
    _radiansAnim = Tween(begin: 0.0, end: 2 * pi).animate(_controller);


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
        title: Text("交织动画"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder:(ctx,child) {
            return Opacity(
              opacity: _opacityAnim.value,
              child: Transform(
                transform: Matrix4.rotationZ(_radiansAnim.value),
                alignment: Alignment.center,
                child: Container(
                  width: _sizeAnim.value,
                  height: _sizeAnim.value,
                  color: _colorAnim.value,
                ),
              ),
            );
          } ,
        ),
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

