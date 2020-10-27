import 'package:pietrario_sample_app/model/Bioasset.dart';
import 'package:pietrario_sample_app/model/Guardian.dart';
import 'package:pietrario_sample_app/model/Pietrario.dart';
import 'package:pietrario_sample_app/model/Resource.dart';
import 'package:pietrario_sample_app/model/Succulent.dart';
import 'package:pietrario_sample_app/model/User.dart';
import 'package:pietrario_sample_app/model/Vital.dart';

/// @author estidlozano
class InventoryCtrl {

  static void initUserData() {
    User().pietrario = Pietrario(terrain: 'Desert', temperature: 35);
    User().inventory = Map<String, Bioasset>();
    initInventory();
    //PietrarioController.put(User().inventory['succulent1'], 0);
  }

  static void initInventory() {
    put(Resource(costMoss: 200, costEnergy: 200, amount: 500, name: 'water', description: 'resource'));
    put(Resource(costWater: 200, costEnergy: 200, amount: 500, name: 'moss', description: 'resource'));
    put(Resource(costWater: 200, costMoss: 200, amount: 500, name: 'energy', description: 'resource'));
    put(Succulent(
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
        minerals: Vital(value: 80, minValue: 0, maxValue: 100, losingValue: 5),
        temperature: Vital(value: 20, minValue: 10, maxValue: 32, losingValue: 1),
        costWater: 540,
        costMoss: 500,
        name: 'succulent2',
        description: 'succulent'
    ));
    put(Guardian(
      bonusWater: 0.1,
      bonusMoss: 0.2,
      bonusEnergy: 0.1,
      costMoss: 500,
      costEnergy: 500,
      amount: 0,
      name: 'dog',
      description: 'good protector of your plants'
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

  static String getResourceText(String resource) {
    double precision(double d, int n) => double.parse(d.toStringAsFixed(n));
    int amount = User().inventory[resource].amount;
    if(amount > 2000000)
      return '${precision(amount.toDouble()/1000000, 1)}M';
    else if(amount > 2000)
      return '${precision(amount.toDouble()/1000, 1)}K';
    return '$amount';
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