import 'package:flutter/material.dart';

class Navigate {
  static void gotoHome(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  // static void gotoLogin(BuildContext context) {
  //   Navigator.of(context).pushReplacementNamed('/login');
  // }

  // static void gotoRegis(BuildContext context) {
  //   Navigator.of(context).pushReplacementNamed('/regis');
  // }

  // static void gotoProfile(BuildContext context) {
  //   Navigator.of(context).pushReplacementNamed('/profile');
  // }
}
