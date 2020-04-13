import 'package:flutter/material.dart';

//配置的东西见main.dart中的

class FHI18nSystemWidgetPage extends StatefulWidget {
  @override
  _FHHomePageState createState() => _FHHomePageState();
}

class _FHHomePageState extends State<FHI18nSystemWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页"),),
      body: Center(
        child: RaisedButton(
          child: Text("选择一个时间"),
          onPressed: (){
            showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(3000));
          },
        ),
      ),
    );
  }
}



