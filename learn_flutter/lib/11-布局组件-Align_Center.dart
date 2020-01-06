import 'package:flutter/material.dart';

class MyAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Icon(Icons.pets,size: 36,color: Colors.redAccent,),
      alignment: Alignment.bottomRight,
      widthFactor: 3,
      heightFactor: 3,
    );
  }
}

class MyCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.pets,size:36,color: Colors.red,),
      widthFactor: 3,
      heightFactor: 3,
    );
  }
}