import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_flutter/15-测试/widget/contacts.dart';

void main() {
  testWidgets("Test Contacts Widget",(WidgetTester tester) async {
    //1.注入Widget
    await tester.pumpWidget(MaterialApp(home: FHContacts(["abc","cba","nba","mba"])));

    //2.在FHContacts中查找Widget/Text
    final abcText = find.text("abc");
    final cbaText = find.text("cba");
    final icons = find.byIcon(Icons.people);

    expect(abcText, findsOneWidget);
    expect(cbaText, findsOneWidget);
    expect(icons, findsNWidgets((4)));
  });
}