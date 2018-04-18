import 'package:beco_flutter/app/screens/location_view.dart';
import 'package:beco_flutter/app/screens/landing_page.dart';
import 'package:beco_flutter/app/screens/mall_detail_view.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var locationHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new LocationView();
});

var rootHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new AppComponent();
});

var mallDetailHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new MallDetailView();
});

var homeHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  //return new HomeController();
});