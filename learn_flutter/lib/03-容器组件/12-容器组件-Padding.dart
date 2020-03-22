import 'package:flutter/material.dart';

class MyPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('padding'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Text("莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
          style: TextStyle(
              color: Colors.red,
              fontSize: 18
          ),
        ),
      ),
    );
  }
}