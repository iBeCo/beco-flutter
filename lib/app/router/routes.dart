import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:beco_flutter/app/router/route_handlers.dart';
class Routes {

  static String root = "/";

  static String locationView = "/locationView";
  static String mallDetailView = "/mallDetailView";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print(router);
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: rootHandler);
    router.define(locationView, handler: locationHandler);
    router.define(mallDetailView, handler: mallDetailHandler);

  }

}