import 'package:flutter/material.dart';
import '../../model/home_model.dart';

class FloorTitle extends StatelessWidget {
  final IntegralMallPic floorPic;
  const FloorTitle({Key key,this.floorPic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(floorPic.pICTUREADDRESS),
    );
  }
}