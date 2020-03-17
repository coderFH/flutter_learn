import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/widgets/dashed_line.dart';

class FHHomeContent extends StatefulWidget {
  @override
  _FHHomeContentState createState() => _FHHomeContentState();
}

class _FHHomeContentState extends State<FHHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 100,
            child: FHDashedLine(dashedWidth: 3, dashedHeight: 1,),
          ),
          Container(
            height: 100,
            child: FHDashedLine(axis: Axis.vertical,dashedWidth: 1,dashedHeight: 3,),
          ),
        ],
      ),
    );
  }
}