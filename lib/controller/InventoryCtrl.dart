import 'package:pietrario_sample_app/model/Bioasset.dart';
import 'package:pietrario_sample_app/model/Guardian.dart';
import 'package:pietrario_sample_app/model/Pietrario.dart';
import 'package:pietrario_sample_app/model/Resource.dart';
import 'package:pietrario_sample_app/model/Succulent.dart';
import 'package:pietrario_sample_app/model/User.dart';
import 'package:pietrario_sample_app/model/Vital.dart';

/// @author estidlozano
class InventoryCtrl {

  static void initInventory() {
    User().inventory = Map<String, Bioasset>();
    put(Resource(costMoss: 200, costEnergy: 200, amount: 500, name: 'water', description: 'resource'));
    put(Resource(costWater: 200, costEnergy: 200, amount: 500, name: 'moss', description: 'resource'));
    put(Resource(costWater: 200, costMoss: 200, amount: 500, name: 'energy', description: 'resource'));
    put(Succulent(
<<<<<<< HEAD
<<<<<<< HEAD
        health: Vital(value: 80, minValue: 0, maxValue: 100, losingValue: 10),
        hydration: Vital(value: 80, minValue: 0, maxValue: 100, losingValue: 5),
        minerals: Vital(value: 80, minValue: 0, maxValue: 100, losingValue: 5),
        temperature: Vital(value: 20, minValue: 10, maxValue: 30, losingValue: 1),
        costWater: 480,
        costMoss: 480,
        name: 'succulent1',
        description: 'succulent'
    ));
    put(Succulent(
        health: Vital(value: 80, minValue: 0, maxValue: 100, losingValue: 10),
        hydration: Vital(value: 96, minValue: 0, maxValue: 120, losingValue: 5),
=======
=======
>>>>>>> parent of f9dc8d7... added local database
      health: Vital(value: 80, minValue: 0, maxValue: 100, losingValue: 10),
      hidratation: Vital(value: 80, minValue: 0, maxValue: 100, losingValue: 5),
      minerals: Vital(value: 80, minValue: 0, maxValue: 100, losingValue: 5),
      temperature: Vital(value: 20, minValue: 10, maxValue: 30, losingValue: 1),
      costWater: 480,
      costMoss: 480,
      name: 'succulent1',
      description: 'succulent'
    ));
    put(Succulent(
        health: Vital(value: 80, minValue: 0, maxValue: 100, losingValue: 10),
        hidratation: Vital(value: 96, minValue: 0, maxValue: 120, losingValue: 5),
<<<<<<< HEAD
>>>>>>> parent of f9dc8d7... added local database
=======
>>>>>>> parent of f9dc8d7... added local database
        minerals: Vital(value: 80, minValue: 0, maxValue: 100, losingValue: 5),
        temperature: Vital(value: 20, minValue: 9, maxValue: 31, losingValue: 1),
        costWater: 540,
        costMoss: 500,
        name: 'succulent2',
        description: 'succulent'
    ));
    put(Succulent(
        health: Vital(value: 80, minValue: 0, maxValue: 100, losingValue: 10),
<<<<<<< HEAD
<<<<<<< HEAD
        hydration: Vital(value: 80, minValue: 0, maxValue: 100, losingValue: 5),
=======
        hidratation: Vital(value: 80, minValue: 0, maxValue: 100, losingValue: 5),
>>>>>>> parent of f9dc8d7... added local database
=======
        hidratation: Vital(value: 80, minValue: 0, maxValue: 100, losingValue: 5),
>>>>>>> parent of f9dc8d7... added local database
        minerals: Vital(value: 96, minValue: 0, maxValue: 120, losingValue: 5),
        temperature: Vital(value: 20, minValue: 9, maxValue: 31, losingValue: 1),
        costWater: 500,
        costMoss: 540,
        name: 'succulent3',
        description: 'succulent'
    ));
    put(Guardian(
<<<<<<< HEAD
        bonusWater: 0.1,
        bonusMoss: 0.2,
        bonusEnergy: 0.1,
        costMoss: 500,
        costEnergy: 500,
        amount: 0,
        name: 'dog',
        description: 'good protector of your plants'
=======
      bonusWater: 0.1,
      bonusMoss: 0.2,
      bonusEnergy: 0.1,
      costMoss: 500,
      costEnergy: 500,
      amount: 0,
      name: 'dog',
      description: 'good protector of your plants'
<<<<<<< HEAD
>>>>>>> parent of f9dc8d7... added local database
=======
>>>>>>> parent of f9dc8d7... added local database
    ));
    put(Guardian(
        bonusWater: 0.2,
        bonusMoss: 0.1,
        bonusEnergy: 0.1,
        costWater: 500,
        costEnergy: 500,
        amount: 0,
        name: 'fox',
        description: 'smart protector of your plants'
    ));
  }

  static Map<String, Bioasset> getAll() {
    return User().inventory;
  }

  static String getResourceText(String resource) {
    double precision(double d, int n) => double.parse(d.toStringAsFixed(n));
    int amount = User().inventory[resource].amount;
    if(amount > 2000000)
      return '${precision(amount.toDouble()/1000000, 1)}M';
    else if(amount > 2000)
      return '${precision(amount.toDouble()/1000, 1)}K';
    return '$amount';
  }

  static double getProduction(String resource) {
    return (User().inventory[resource] as Resource).production;
  }

  static bool put(Bioasset bioasset) {
    bool b = false;
    if(!exist(bioasset.name)) {
      User().inventory[bioasset.name] = bioasset;
      b = true;
    }
    // print('put: $b');
    return b;
  }

  static bool add(String name, int amount) {
    bool b = false;
    if(amount > 0 && exist(name)) {
      User().inventory[name].amount += amount;
      b = true;
    }
    // print('add: $b');
    return b;
  }

  static bool drop(String name, int amount) {
    bool b = false;
    if(amount > 0 && exist(name)) {
      User().inventory[name].amount -= amount;
      b = true;
    }
    // print('drop: $b');
    return b;
  }

  static bool exist(String name) {
    bool b = User().inventory.containsKey(name);
    // print('exist: $b');
    return b;
  }

}