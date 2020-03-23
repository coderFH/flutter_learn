import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FHGolbalKeyDemo extends StatelessWidget {
  final GlobalKey<_FHGlobalState> homeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FHGlobal(key: homeKey,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.data_usage),
        onPressed: (){
          print("${homeKey.currentState.message}");
          print("${homeKey.currentState.widget.name}");
          print("${homeKey.currentContext}");
        },
      ),
    );

  }
}


class FHGlobal extends StatefulWidget {
  final String name = "123";

  FHGlobal({Key key}) : super(key : key);

  @override
  _FHGlobalState createState() => _FHGlobalState();
}

class _FHGlobalState extends State<FHGlobal> {

  final String message = "abc";
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
