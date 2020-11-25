import 'package:pietrario_app/model/Bioasset.dart';
import 'package:pietrario_app/model/Guardian.dart';
import 'package:pietrario_app/model/Resource.dart';
import 'package:pietrario_app/model/Succulent.dart';
import 'package:pietrario_app/model/User.dart';
import 'package:pietrario_app/model/Vital.dart';
import 'package:pietrario_app/util/db_helper.dart';

/// @author estidlozano
class InventoryCtrl {

  static void initInventory() async {
    User().inventory = Map<String, Bioasset>();
    // Initialize the bioassets
    put(Resource(costMoss: 100, costEnergy: 100, amount: 1500, name: Resource.water));
    put(Resource(costWater: 100, costEnergy: 100, amount: 1500, name: Resource.moss));
    put(Resource(costWater: 100, costMoss: 100, amount: 1500, name: Resource.energy));
    put(Succulent(
      health: Vital(value: 80, maxValue: 100, losingValue: 1.0),
      hydration: Vital(value: 80,maxValue: 100, losingValue: 0.5),
      minerals: Vital(value: 80, maxValue: 100, losingValue: 0.5),
      temperature: Vital(value: 20, maxValue: 30, losingValue: 0.1),
      costWater: 240,
      costMoss: 240,
      name: 'succulent1',
    ));
    put(Succulent(
        health: Vital(value: 80, maxValue: 100, losingValue: 1.0),
        hydration: Vital(value: 96, maxValue: 120, losingValue: 0.5),
        minerals: Vital(value: 80, maxValue: 100, losingValue: 0.5),
        temperature: Vital(value: 20, maxValue: 32, losingValue: 0.1),
        costWater: 270,
        costMoss: 250,
        name: 'succulent2',
    ));
    put(Succulent(
        health: Vital(value: 80, maxValue: 100, losingValue: 1.0),
        hydration: Vital(value: 80, maxValue: 100, losingValue: 0.5),
        minerals: Vital(value: 96, maxValue: 120, losingValue: 0.5),
        temperature: Vital(value: 20, maxValue: 32, losingValue: 0.1),
        costWater: 250,
        costMoss: 270,
        name: 'succulent3',
    ));
    put(Guardian(
      bonusWater: 0.1,
      bonusMoss: 0.2,
      bonusEnergy: 0.1,
      costMoss: 250,
      costEnergy: 250,
      amount: 0,
      name: 'wolf',
    ));
    put(Guardian(
        bonusWater: 0.2,
        bonusMoss: 0.1,
        bonusEnergy: 0.1,
        costWater: 250,
        costEnergy: 250,
        amount: 0,
        name: 'deer',
    ));
    // load inventory
    List<Map<String, dynamic>> inventoryData =
        await DBHelper().queryAllRows(DBHelper.inventory);
    if(inventoryData.isEmpty) {
      User().inventory.values.forEach((e) {
        DBHelper().insert(DBHelper.inventory, {
          'name' : e.name,
          'amount': e.amount,
        });
      });
    } else {
      inventoryData.forEach((e) {
        String name = e['name'];
        int amount = e['amount'];
        if(exist(name)) get(name).amount = amount;
      });
    }
  }

  static Map<String, Bioasset> getAll() {
    return User().inventory;
  }

  static Bioasset get(String name) {
    return User().inventory[name];
  }

  static String getResourceText(String resource) {
    double precision(double d, int n) => double.parse(d.toStringAsFixed(n));
    int amount = get(resource).amount;
    if(amount > 2000000)
      return '${precision(amount.toDouble()/1000000, 1)}M';
    else if(amount > 2000)
      return '${precision(amount.toDouble()/1000, 1)}K';
    return '$amount';
  }

  static double getProduction(String resource) {
    return (get(resource) as Resource).production;
  }

  static bool put(Bioasset bio) {
    if(exist(bio.name)) return false;
    User().inventory[bio.name] = bio;
    return true;
  }

  static Future<bool> add(String name, int amount) async {
    if(amount <= 0 || !exist(name)) return false;
    get(name).amount += amount;
    return await DBHelper().update(DBHelper.inventory, {
      'name' : name,
      'amount': get(name).amount,
    }) == 1;
  }

  static Future<bool> drop(String name, int amount) async {
    if(amount <= 0 || !exist(name)) return false;
    get(name).amount -= amount;
    return await DBHelper().update(DBHelper.inventory, {
      'name' : name,
      'amount': get(name).amount,
    }) == 1;
  }

  static bool exist(String name) {
    return User().inventory.containsKey(name);
  }

}