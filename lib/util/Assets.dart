import 'package:flutter/material.dart';

class Consts {

  static final Color bgColor = Colors.grey[50];
  static final Color mainColor = Colors.grey[300];
  static final Color secondaryColor = Colors.green[700];
  static final Color textColor = Colors.grey[900];

}

class Assets {

  static String img(String name) {
    return "assets/img/" + name + ".png";
  }

  static String svg(String name) {
    return "assets/svg/" + name + ".svg";
  }

}