import 'package:pietrario_app/util/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// @author estidlozano
class Config {

  static SharedPreferences prefs;
  static List<String> langs = new List<String>();
  static int lang;
  static bool cloudy, dark, rigorous, vibration;
  static double music, sound;

  static Future<void> loadConfig() async {
    langs.add('English');
    langs.add('Español');
    prefs = await SharedPreferences.getInstance();
    lang = prefs.getInt('lang') ?? 0;
    cloudy = prefs.getBool('cloudy') ?? false;
    dark = prefs.getBool('dark') ?? false;
    rigorous = prefs.getBool('rigorous') ?? false;
    vibration = prefs.getBool('vibration') ?? true;
    music = prefs.getDouble('music') ?? 10;
    sound = prefs.getDouble('sound') ?? 10;
    Consts.setDark(dark);
  }

  static void setLang(int val) {
    lang = val;
    prefs.setInt('lang', val);
  }

  static void setCloudy(bool val) {
    cloudy = val;
    prefs.setBool('cloudy', val);
  }

  static void setDark(bool val) {
    dark = val;
    prefs.setBool('dark', val);
    Consts.setDark(dark);
  }

  static void setRigorous(bool val) {
    rigorous = val;
    prefs.setBool('rigorous', val);
  }

  static void setVibration(bool val) {
    vibration = val;
    prefs.setBool('vibration', val);
  }

  static void setMusic(double val) {
    music = val;
    prefs.setDouble('music', val);
  }

  static void setSound(double val) {
    sound = val;
    prefs.setDouble('sound', val);
  }

  static String getLang() {
    return langs[lang];
  }

}