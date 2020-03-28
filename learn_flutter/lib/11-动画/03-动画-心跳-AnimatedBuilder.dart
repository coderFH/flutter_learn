import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FHHeartDemo2 extends StatefulWidget {
  @override
  _FHHeartDemoState createState() => _FHHeartDemoState();
}

class _FHHeartDemoState extends State<FHHeartDemo2> with SingleTickerProviderStateMixin {
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
        child: AnimatedBuilder(
          animation: _controller,
          builder:(ctx,child) {
            return Icon(Icons.favorite, color: Colors.red, size: _sizeAnim.value);
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

