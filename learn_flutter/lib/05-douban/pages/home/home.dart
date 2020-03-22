import 'package:flutter/material.dart';
import 'home_content.dart';

class FHHomePage extends StatefulWidget {
  @override
  _FHHomePageState createState() => _FHHomePageState();
}

class _FHHomePageState extends State<FHHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: FHHomeContent(),
    );
  }
}
