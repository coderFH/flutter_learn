import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/extension/int_extension.dart';

class FHOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  final Color textColor;

  FHOperationItem(this._icon,this._title,{this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.px,
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _icon,
          SizedBox(width: 2.px,),
          Text(_title,style: TextStyle(color: textColor),)
        ],
      ),

    );
  }
}
