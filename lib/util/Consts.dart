import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/util/Config.dart';

/// @author estidlozano
class Consts {

  static double screenW, screenH;
  static TextStyle titleStyle, textStyle;
  static final Color bgColor = Colors.grey[50];
  static final Color mainColor = Colors.grey[300];

  static final Map<String, Set<String>> texts = Map<String, Set<String>>();

  static void setScreenSize(Size screenSize) {
    screenW = screenSize.width;
    screenH = screenSize.height;
    titleStyle = TextStyle(
      fontSize: Consts.width(6),
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
      color: Colors.grey[900],
    );
    textStyle = TextStyle(
      fontSize: Consts.width(4),
      fontWeight: FontWeight.normal,
      letterSpacing: 1.5,
      color: Colors.grey[900],
    );
  }

  static void loadTexts() {
    // HELP
    texts['help'] = {'Help', 'Ayuda'};
    // MARKET
    texts['market'] = {'Market', 'Mercado'};
    // SETTINGS
    texts['cloudy'] = {'Cloudy Mode', 'Modo nublado'};
    texts['language'] = {'Language', 'Idioma'};
    texts['music'] = {'Music', 'Música'};
    texts['rigorous'] = {'Rigorous Mode', 'Modo Riguroso'};
    texts['settings'] = {'Settings', 'Ajustes'};
    texts['sound'] = {'Sound', 'Sonido'};
    texts['vibration'] = {'Vibration', 'Vibración'};
  }

  static String getText(String name) {
    return texts[name].elementAt(Config.lang);
  }

  static double width(double percent) {
    return screenW / 100 * percent;
  }

  static double height(double percent) {
    return screenH / 100 * percent;
  }

}