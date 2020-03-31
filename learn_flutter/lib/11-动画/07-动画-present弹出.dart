import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FHPresentDemo extends StatefulWidget {
  @override
  _FHAnimalRouterState createState() => _FHAnimalRouterState();
}

class _FHAnimalRouterState extends State<FHPresentDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => FHModalPage(),
              fullscreenDialog: true
            )
          );
        },
      ),
    );
  }
}

class FHModalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modal Page"),
      ),
      body: Center(
        child: Text("Modal Page"),
      ),
    );
  }
}
