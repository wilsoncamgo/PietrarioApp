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
  static Color health = Color(0xFF00CC66);
  static Color water = Color(0xFF0066CC);
  static Color minerals = Color(0xFFAAAAAA);
  static Color temperature = Color(0xFFCC3333);

  static final Map<String, List<String>> texts = Map<String, List<String>>();

  static void setScreenSize(Size screenSize) {
    screenW = screenSize.width;
    screenH = screenSize.height;
  }

  static void loadTexts() {

    // BIOASSETS NAME
    texts['succulent1'] = ['Succulent1', 'Suculenta1'];
    texts['succulent2'] = ['Succulent2', 'Suculenta2'];
    texts['succulent3'] = ['Succulent3', 'Suculenta3'];
    texts['dog'] = ['Dog', 'Perro'];
    texts['fox'] = ['Fox', 'Zorro'];

    // BIOASSETS DESCRIPTION
    texts['desc_succulent1'] = [
      'Pretty1',
      'Bonita1',
    ];

    // HELP
    texts['help'] = ['Help', 'Ayuda'];
    texts['help_introduction'] = ['Introduction', 'Introducción'];
    texts['help_market'] = ['Market', 'Mercado'];
    texts['help_resources'] = ['Resources', 'Recursos'];
    texts['help_timer'] = ['Timer', 'Temporizador'];
    texts['help_pietrario'] = ['Pietrario', 'Pietrario'];
    texts['help_modes'] = ['Modes', 'Modos'];

    //HELP TEXTS
    texts['content_introduction'] = [
      'Pietrario app tries to train your focus on your daily activities. For that, it is based on Pomodoro methodology and offers you a Pietrario (a space where succulents grow), where you may use rewards won by concentrating to plant, take care and personalize them. Next, you will find more information about the different parts of the games ',
      'La aplicación Pietrario busca fortalecer tu concentración en tus actividades diarias. Para ello, se basa en la metodología Pomodoro y te ofrece un Pietrario (un espacio donde se cultivan suculentas), donde podrás usar recompensas ganadas en tiempos de concentración para plantar, cuidar y personalizarlas. A continuación, encontrarás información sobre las distintas partes del juego. '

    ];
    texts['desc_succulent2'] = [
      'Pretty2',
      'Bonita2',
    ];
    texts['desc_succulent3'] = [
      'Pretty3',
      'Bonita3',
    ];
    texts['desc_dog'] = [
      'Good guardian for your plants',
      'Buen guardián para tus plantas',
    ];
    texts['desc_fox'] = [
      'Smart guardian for your plants',
      'Guardián inteligente para tus plantas',
    ];
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
    texts['hidratation'] = ['Hydration', 'Hidratación'];
    texts['minerals'] = ['Minerals', 'Minerales'];
    texts['temperature'] = ['Temperature', 'Temperatura'];
    texts['statistics'] = ['Statistics', 'Estadisticas'];
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