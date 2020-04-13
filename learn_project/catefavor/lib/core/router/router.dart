import 'package:favorcate/ui/pages/main/main.dart';
import 'package:flutter/material.dart';

class FHRouter {
  static final String initialRoute = FHMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    HYMainScreen.routeName: (ctx) => HYMainScreen()
  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}