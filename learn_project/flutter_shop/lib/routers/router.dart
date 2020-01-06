import 'package:flutter/material.dart';
import './router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static String root = '/';
  static String detailsPage = '/detail';
  static void configRoutes(Router router) {
    
    router.notFoundHandler = Handler(
      handlerFunc:(BuildContext context,Map<String,List<String>> params){
        print('ERROR====>ROUTE WAS NOT FONUND!!!');
      }
    );
    router.define(detailsPage,handler: detailsHandler);
  }
}