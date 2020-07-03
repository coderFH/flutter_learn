import 'package:catefavor/core/router/router.dart';
import 'package:catefavor/core/viewmodel/meal_view_model.dart';
import 'package:flutter/material.dart';

import 'package:catefavor/ui/shared/app_theme.dart';
import 'package:catefavor/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';


void main() => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => FHMealViewModel()),
      ],
      child: MyApp(),
    ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 对FHSizeFit进行初始化
    FHSizeFit.initialize();

    return MaterialApp(
      title: '美食广场',
      initialRoute: FHRouter.initialRoute,
      theme:FHAppTheme.norTheme,
      routes: FHRouter.routes,
    );
  }
}