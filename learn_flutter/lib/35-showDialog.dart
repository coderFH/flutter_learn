import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('点我'),
        onPressed: () {_showDialog(context);},
      )
    );
  }

  _showDialog(context) async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MyButton("返回1", () => Navigator.of(context).pop(1)),
              MyButton("返回2", () => Navigator.pop(context,2)),
            ],
          ),
        );
      }
  );
  print('result = $result');
}


  Widget MyButton(String text,Function onPressed,{Color color = Colors.white}) {
    return FlatButton(
      color: color,
      child: Text(text),
      onPressed: onPressed,
    );
  } 
}




