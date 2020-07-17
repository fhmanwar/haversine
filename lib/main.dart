import 'package:flutter/material.dart';
import 'package:gostore_flutter/src/app.dart';
import 'package:gostore_flutter/src/ui/home.dart';

var route = <String, WidgetBuilder>{
  "/home": (BuildContext context) => new Home(),
  // "/login": (BuildContext context) => new Login(),
  // "/regis": (BuildContext context) => new Register(),
  // "/profile": (BuildContext context) => new Profile(),
  // "/detail": (BuildContext context) => new Detail(),
};

void main() {
  // setupLocator();
  runApp(new MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.amber[800], accentColor: Colors.amberAccent[400]),
    // debugShowCheckedModeBanner: false,
    home: new App(),
    routes: route,
  ));
}
