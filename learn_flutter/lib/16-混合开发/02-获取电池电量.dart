import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FHBatteryInfo extends StatefulWidget {
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<FHBatteryInfo> {
  static const platform = const MethodChannel("coderfh.com/battery");

  int _level = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("获取剩余电量"),
              onPressed: getBatteryInfo,
            ),
            Text("当前电量: $_level")
          ],
        ),
      ),
    );
  }

  void getBatteryInfo() async {
    final result = await platform.invokeMethod("getBatteryInfo");
    setState(() {
      _level = result;
    });
  }
}