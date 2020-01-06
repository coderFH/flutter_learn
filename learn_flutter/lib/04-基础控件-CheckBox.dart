import 'package:flutter/material.dart';

class MyCheckBoxWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyCheckBoxState();
  }
}

class MyCheckBoxState extends State<MyCheckBoxWidget> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,
          onChanged: (value){
            _switchSelected = value;
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red,
          onChanged: (value){
            setState(() {
              _checkboxSelected = value;
            });
          },
        )
      ],
    );
  }
}