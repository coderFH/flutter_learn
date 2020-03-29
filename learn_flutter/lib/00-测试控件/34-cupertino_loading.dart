import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLoading extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CupertionoActivityIndicator示例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("CupertionoActivityIndicator示例"),
        ),
        body: Center(
          child: CupertinoActivityIndicator(
            radius: 10.0, //值越大加载的图形越大
          ),
        ),
      ),
    );
  }
}

