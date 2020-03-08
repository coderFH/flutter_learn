import 'package:flutter/material.dart';

class AlignCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align_Center'),
      ),
      body: ListView(
        children: <Widget>[
          MyAlign(),
          MyCenter(),
          AlignDemo()
        ],
      ),
    );
  }
}

class MyAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Icon(Icons.people,size: 36,color: Colors.redAccent,),
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

class AlignDemo extends StatelessWidget {
  const AlignDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment(1, 1),
        widthFactor: 5,
        heightFactor: 5,
        child: Icon(Icons.pets, size: 50)
    );
  }
}