import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FHAnimalRouter extends StatefulWidget {
  @override
  _FHAnimalRouterState createState() => _FHAnimalRouterState();
}

class _FHAnimalRouterState extends State<FHAnimalRouter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: Duration(seconds: 3),
            pageBuilder: (ctx,anim1,anim2) {
              return FadeTransition(
                opacity: anim1,
                child: FHModalPage(),
              );
            }
          ));
        },
      ),
    );
  }
}



class FHModalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Modal Page"),
      ),
      body: Center(
        child: Text("Modal Page"),
      ),
    );
  }
}
