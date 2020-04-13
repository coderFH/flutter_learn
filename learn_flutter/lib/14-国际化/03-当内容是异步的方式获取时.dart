import 'package:flutter/material.dart';
import 'localizations_async.dart';

class FHI18nAsyncWidgetPage extends StatefulWidget {
  @override
  _FHHomePageState createState() => _FHHomePageState();
}

class _FHHomePageState extends State<FHI18nAsyncWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(FHAsyncLocalizations.of(context).title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(FHAsyncLocalizations.of(context).greet),
            RaisedButton(
              child: Text(FHAsyncLocalizations.of(context).pickTime),
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



