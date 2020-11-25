import 'package:flutter/material.dart';
import 'package:pietrario_app/util/config.dart';

/// @author estidlozano

class Assets {

  static String img(String name) {
    return "assets/img/" + name + ".png";
  }

}

class Consts {

  static double screenW, screenH, screenWP1, screenHP1;
  static TextStyle titleStyle, textStyle;
  static Color
      bgColor = Colors.grey[50],
      mainColor = Colors.grey[300],
      scndColor = Colors.grey[500],
      textColor = Colors.grey[900],
      btnMainColor = Colors.green,
      btnScndColor = Colors.lightGreenAccent,
      healthColor = Color(0xFFFF2222),
      hydrationColor = Color(0xFF0066CC),
      mineralsColor = Color(0xFF00CC66),
      temperatureColor = Color(0xFFCC3333);

  static final Map<String, List<String>> texts = Map<String, List<String>>();

  static void setScreenSize(Size screenSize) {
    screenW = screenSize.width;
    screenH = screenSize.height;
    screenWP1 = screenW / 100;
    screenHP1 = screenH / 100;
  }

  static void initTexts() {
    // BIOASSETS NAME
    texts['succulent1'] = ['Succulent1', 'Suculenta1'];
    texts['succulent2'] = ['Succulent2', 'Suculenta2'];
    texts['succulent3'] = ['Succulent3', 'Suculenta3'];
    texts['wolf'] = ['Wolf', 'Lobo'];
    texts['deer'] = ['Deer', 'Ciervo'];
    // BIOASSETS DESCRIPTION
    texts['desc_succulent1'] = [
      'Pretty1',
      'Bonita1',
    ];
    texts['desc_succulent2'] = [
      'Pretty2',
      'Bonita2',
    ];
    texts['desc_succulent3'] = [
      'Pretty3',
      'Bonita3',
    ];
    texts['desc_wolf'] = [
      'Strong guardian for your plants',
      'Guardián fuerte para tus plantas',
    ];
    texts['desc_deer'] = [
      'Smart guardian for your plants',
      'Guardián inteligente para tus plantas',
    ];
    // HELP
    texts['help'] = ['Help', 'Ayuda'];
    texts['help_introduction'] = ['Introduction', 'Introducción'];
    texts['help_resources'] = ['Resources', 'Recursos'];
    texts['help_timer'] = ['Timer', 'Temporizador'];
    texts['help_pietrario'] = ['Pietrario', 'Pietrario'];
    texts['help_modes'] = ['Modes', 'Modos'];

    //TEXTS
    texts['content_introduction'] = [
      'Pietrario app tries to train your focus on your daily activities. For that, it is based on Pomodoro methodology and offers you a Pietrario (a space where succulents grow), where you may use rewards won by concentrating to plant, take care and personalize them. Next, you will find more information about the different parts of the games ',
      'La aplicación Pietrario busca fortalecer tu concentración en tus actividades diarias. Para ello, se basa en la metodología Pomodoro y te ofrece un Pietrario (un espacio donde se cultivan suculentas), donde podrás usar recompensas ganadas en tiempos de concentración para plantar, cuidar y personalizarlas. A continuación, encontrarás información sobre las distintas partes del juego. '
    ];
    texts['content_resources'] = [
      'For the plants to survive, they need some assets.\n\n- Moss: In it,  some minerals are found which the plant needs.\n- Energy: To keep a certain temperature, regulated by … that needs the energy.\n- Water: To keep the adequate moist level, water is used.\n\n\nMarket: \nIn the market you may use your gained assets to trade them with others that you may need, new plants and guardians.\n\nGuardians:\nGuardians are animals who take care of the Pietrario. Each one of them offers a different buff on it ',
      'Para la supervivencia de las plantas se necesitan ciertos assets.\n\n- Musgo: En este se encuentran minerales necesarios para la planta. \n- Energía: Para mantener cierta temperatura, regulada por un regulador que requiere de esta energia.\n- Agua: Para mantener la hidratación adecuada, se usa agua en la planta.\n\n\nMercado: \nEn el mercado podrás usar los assets ganados para intercambiarlos con otros que necesites, nuevas plantas y guardianes. \n\nGuardianes:\nLos guardianes son animales que se encargan de cuidar el Pietrario. Estos ofrecen una ventaja  distinta sobre él. '
    ];
    texts['content_timer'] = [
      'The timer counts the focus time of your activities. After setting a quantity of minutes, less than 120, and finishing that time, you’ll receive an amount of assets of each type. This is the only way to get the assets. ',
      'El temporizador, contabiliza el tiempo de concentración de tus actividades. Luego de ingresar una cantidad de minutos, menor a 120, y cumplir con dicho tiempo, se te dará una cantidad de assets de cada tipo. Esta es la única forma de conseguir los assets . '
    ];
    texts['content_pietrario'] = [
      'The whole Pietrario needs the energy to keep the temperature the same and each plant requires an amount of moss and water every so often. That is why, for them to survive, they will need you to accomplish focus times.',
      'El Pietrario requiere cierta cantidad de energía y cada planta requiere una cantidad de Musgo y Agua cada cierto tiempo para que no muera. Por eso, para que estas sobrevivan, necesitan que cumplas tiempos de concentración. '
    ];
    texts['content_modes'] = [
      'There are some modes in the app which may ease your experience:\n\n- Rigorous: This mode tries to completely remove every phone distraction. When it is active, none app on your phone will be allowed to be used.\n- Cloudy: Deletes the need of light in the game, however, it comes with debuffs on the plants.\n- Night: Eases the use od the app on dark environments with more adequate colors.',
      'Hay ciertos modos en la aplicación que pueden facilitar tu experiencia:\n\n- Riguroso: Este modo busca eliminar por completo las distracciones. Cuando esta activo, ninguna aplicación del celular puede ser usada.\n- Nublado: Elimina la necesidad de luz en el juego, sin embargo, trae desventajas para las plantas.\n- Noche: Facilita el uso de la aplicación en ambientes oscuros con colores mas adecuados. '
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
    texts['hydration'] = ['Hydration', 'Hidratación'];
    texts['minerals'] = ['Minerals', 'Minerales'];
    texts['temperature'] = ['Temperature', 'Temperatura'];
    texts['statistics'] = ['Statistics', 'Estadísticas'];
    // TIMER
    texts['enter_time'] = [
      'Enter your focusing time',
      'Ingresa tu tiempo de concentración'
    ];
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
    return screenWP1 * percent;
  }

  static double height(double percent) {
    return screenHP1 * percent;
  }

}