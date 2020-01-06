import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:flutter_shop/provide/category_child_provide.dart';
import 'package:flutter_shop/provide/category_goods_list_Provide.dart';
import 'package:flutter_shop/provide/detail_info_provide.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'package:flutter_shop/provide/current_provide.dart';
import 'package:provide/provide.dart';
import './routers/router.dart';
import './routers/application.dart';

void main() {
  var childCategoryProvide = ChildCategoryPrivode();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  var detailInfoProvide = DetailsInfoProvide();
  var cartProvide  =CartProvide();
  var currentIndexProvide = CurrentIndexProvide();

  var providers = Providers();

  //绑定provider
  providers
    ..provide(Provider<ChildCategoryPrivode>.value(childCategoryProvide))
    ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
    ..provide(Provider<DetailsInfoProvide>.value(detailInfoProvide))
    ..provide(Provider<CartProvide>.value(cartProvide))
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
    
  runApp(
    ProviderNode(
      child: MyApp(),
      providers: providers,
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final router = Router();
    Routes.configRoutes(router);
    Application.router = router;

    return Container(
      child: MaterialApp(
        title: "百姓生活+",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        home: IndexPage(),
      ),
    );
  }
}
