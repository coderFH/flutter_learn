import 'package:flutter/material.dart';

class FHContacts extends StatelessWidget {
  final List<String> _names;
  FHContacts(this._names);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("联系人列表"),
      ),
      body: ListView(
        children: _names.map((name) {
          return ListTile(
            leading: Icon(Icons.people),
            title: Text(name),
          );
        }).toList(),
      ),
    );
  }
}
