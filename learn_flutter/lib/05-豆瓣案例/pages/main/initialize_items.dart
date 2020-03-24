import 'package:flutter/material.dart';
import 'bottom_bar_item.dart';
import '../home/home.dart';
import '../subject/subject.dart';

List<FHBottomBarItem> items = [
  FHBottomBarItem("home", "首页"),
  FHBottomBarItem("subject", "书影音"),
  FHBottomBarItem("group", "小组"),
  FHBottomBarItem("mall", "市集"),
  FHBottomBarItem("profile", "我的"),
];

List<Widget> pages = [
  FHHomePage(),
  FHSubjectPage(),
  FHHomePage(),
  FHSubjectPage(),
  FHHomePage(),
];