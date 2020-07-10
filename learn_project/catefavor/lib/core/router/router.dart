
import 'package:catefavor/ui/pages/detail/detail.dart';
import 'package:catefavor/ui/pages/filter/filter.dart';
import 'package:catefavor/ui/pages/main/main.dart';
import 'package:catefavor/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';

class FHRouter {
  static final String initialRoute = FHMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    FHMainScreen.routeName: (ctx) => FHMainScreen(),
    FHMealScreen.routeName: (ctx) => FHMealScreen(),
    FHDetailScreen.routeName:(ctx) => FHDetailScreen(),
  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    if(settings.name == FHFilterScreen.routerName) {
      return MaterialPageRoute(
        builder: (ctx) {
          return FHFilterScreen();
        },
        fullscreenDialog: true
      );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}