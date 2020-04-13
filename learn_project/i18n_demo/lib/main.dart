import 'package:flutter/material.dart';
import 'package:i18n_demo/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: FHHomePage()
    );
  }
}


class FHHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).title),),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(S.of(context).greet),
            RaisedButton(
              child: Text(S.of(context).picktime),
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2019),
                    lastDate: DateTime(2022)
                ).then((pickTime) {
                });
              },
            )
          ],
        ),
      ),
    );
  }
}


