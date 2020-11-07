import 'package:flutter/material.dart';
import 'package:pietrario_sample_app/util/config.dart';

/// @author estidlozano
class Consts {

  static double screenW, screenH;
  static TextStyle titleStyle, textStyle;
  static Color bgColor = Colors.grey[50];
  static Color mainColor = Colors.grey[300];
  static Color scndColor = Colors.grey[500];
  static Color textColor = Colors.grey[900];

  static final Map<String, List<String>> texts = Map<String, List<String>>();

  static void setScreenSize(Size screenSize) {
    screenW = screenSize.width;
    screenH = screenSize.height;
  }

  static void loadTexts() {
    // HELP
    texts['help'] = ['Help', 'Ayuda'];
    texts['help_introduction'] = ['Introduction', 'Introducción'];
    texts['help_market'] = ['Market', 'Mercado'];
    texts['help_resources'] = ['Resources', 'Recursos'];
    // INVENTORY
    texts['inventory'] = ['Inventory', 'Inventario'];
    // MARKET
    texts['market'] = ['Market', 'Mercado'];
    texts['exchange'] = ['Exchange', 'Intercambiar'];
    texts['insuficient_resources'] = [
      'You do not have the necessary resources',
      'No tienes los recursos necesarios',
    ];
    // PIETRARIO
    texts['pietrario'] = ['Pietrario', 'Pietrario'];
    texts['guardian'] = ['Guardian', 'Guardian'];
    texts['guardians'] = ['Guardians', 'Guardianes'];
    texts['no_guardians'] = [
      'You do not have guardians on your inventory',
      'No tienes guardianes en tu inventario',
    ];
    texts['succulent'] = ['Succulent', 'Suculenta'];
    texts['succulents'] = ['Succulents', 'Suculentas'];
    texts['no_succulents'] = [
      'You do not have succulents on your inventory',
      'No tienes suculentas en tu inventario',
    ];
    // SETTINGS
    texts['cloudy'] = ['Cloudy Mode', 'Modo nublado'];
    texts['language'] = ['Language', 'Idioma'];
    texts['music'] = ['Music', 'Música'];
    texts['rigorous'] = ['Rigorous Mode', 'Modo Riguroso'];
    texts['settings'] = ['Settings', 'Ajustes'];
    texts['sound'] = ['Sound', 'Sonido'];
    texts['vibration'] = ['Vibration', 'Vibración'];
    // SUCCULENT STATS
    texts['health'] = ['Health', 'Salud'];
    texts['hidratation'] = ['Hidratation', 'Hidratación'];
    texts['minerals'] = ['Minerals', 'Minerales'];
    texts['temperature'] = ['Temperature', 'Temperatura'];
    // TIMER
    texts['enter_time'] = ['Enter your focusing time', 'Ingresa tu tiempo de concentración'];
    texts['focus_time'] = ['It\'s time to focus', 'Es hora de concentrarse'];
    texts['timer'] = ['Timer', 'Temporizador'];
    texts['timer_reward'] = ['¡Get your reward!', '¡Obtén tu recompensa!'];
  }

  static String setDark(bool dark) {
    if(dark) {
      bgColor = Colors.grey[900];
      mainColor = Colors.grey[600];
      scndColor = Colors.grey[400];
      textColor = Colors.grey[50];
    } else {
      bgColor = Colors.grey[50];
      mainColor = Colors.grey[300];
      scndColor = Colors.grey[500];
      textColor = Colors.grey[900];
    }
    titleStyle = TextStyle(
      fontSize: Consts.width(6),
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
      color: textColor,
    );
    textStyle = TextStyle(
      fontSize: Consts.width(4),
      fontWeight: FontWeight.normal,
      letterSpacing: 1.5,
      color: textColor,
    );
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