import 'package:flutter/material.dart';
import 'localizations.dart';

//配置的东西见main.dart中的

class FHI18nWidgetPage extends StatefulWidget {
  @override
  _FHHomePageState createState() => _FHHomePageState();
}

class _FHHomePageState extends State<FHI18nWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(FHLocalizations.of(context).title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(FHLocalizations.of(context).greet),
            RaisedButton(
              child: Text(FHLocalizations.of(context).pickTime),
              onPressed: (){
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(3000));
              },
            ),
          ],
        ),
      ),
    );
  }
}



