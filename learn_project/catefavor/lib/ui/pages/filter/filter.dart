import 'package:catefavor/ui/pages/filter/filter_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FHFilterScreen extends StatelessWidget {
  static const String routerName = "/filter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食过滤"),
      ),
      body: FHFilterContent(),
    );
  }
}
