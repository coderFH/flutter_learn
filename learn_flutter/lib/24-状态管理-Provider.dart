import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '24-counter.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("provide练习"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Number(),
            MyButton(),
          ],
        ),
      ),
    );
  }
}


class Number extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<Counter>(context).value;
    return Container(
        margin: EdgeInsets.only(top: 200),
        child: Text('$value',style: Theme.of(context).textTheme.display1),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          Provider.of<Counter>(context).increment();
        },
        child: Text("递增"),
      ),
    );
  }
}