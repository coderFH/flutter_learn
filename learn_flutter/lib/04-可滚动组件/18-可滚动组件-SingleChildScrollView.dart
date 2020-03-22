import 'package:flutter/material.dart';

class MySingleChildScrollViewTestRoute extends StatelessWidget {
  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: str.split("")
                          .map((c) => Text(c,textScaleFactor: 2.0,))
                          .toList(),
            ),
          ),
        ),
      ),
    );
  }
}