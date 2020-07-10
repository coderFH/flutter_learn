import 'package:catefavor/ui/pages/home/home_drawer.dart';

import 'initialize_items.dart';
import 'package:flutter/material.dart';

class FHMainScreen extends StatefulWidget {
  static const String routeName = "/";

  @override
  _FHMainScreenState createState() => _FHMainScreenState();
}

class _FHMainScreenState extends State<FHMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: FHHomeDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
