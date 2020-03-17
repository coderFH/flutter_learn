import 'package:flutter/material.dart';
import 'initialize_items.dart';

class FHMainPage extends StatefulWidget {
  @override
  _FHMainPageState createState() => _FHMainPageState();
}

class _FHMainPageState extends State<FHMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      )
    );
  }
}
