import 'package:flutter/material.dart';
import 'package:beco_flutter/app/screens/landing_page.dart';
import 'package:beco_flutter/app/config/injector.dart';
import 'package:flutter/services.dart';
import 'package:beco_flutter/app/router/routes.dart';
import 'package:beco_flutter/app/application.dart';
import 'package:fluro/fluro.dart';
void main() async{
  final router = new Router();
  Routes.configureRoutes(router);
  Application.router = router;

  //Clipboard
  Clipboard.setData(new ClipboardData(text: "Testing Clipboard"));
  ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
  print(data.text);
  runApp(new MaterialApp(
      title: 'App',
      home: new AppComponent(),
      onGenerateRoute: router.generator // Use our Fluro routers for this app.
  ));

}

