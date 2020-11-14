import 'package:pietrario_sample_app/controller/InventoryCtrl.dart';
import 'package:pietrario_sample_app/model/Guardian.dart';
import 'package:pietrario_sample_app/model/Pietrario.dart';
import 'package:pietrario_sample_app/model/Resource.dart';
import 'package:pietrario_sample_app/model/Succulent.dart';
import 'package:pietrario_sample_app/model/User.dart';
import 'package:pietrario_sample_app/model/Vital.dart';
import 'package:pietrario_sample_app/util/db_helper.dart';

/// @author estidlozano
class PietrarioCtrl {

  static Future<void> initPietrario() async {
    Map<int, Succulent> succulents = Map<int, Succulent>();
    Guardian guardian;
    User().pietrario = Pietrario(
      terrain: 'Desert',
      temperature: 35,
      succulents: succulents,
      guardian: guardian,
    );
    // load succulents
    List<Map<String, dynamic>> succulentsData =
        await DBHelper().queryAllRows(DBHelper.succulents);
    succulentsData.forEach((e) {
      Succulent s = InventoryCtrl.get(e['name']).copy();
      s.health.value = e['health'];
      s.hydration.value = e['hydration'];
      s.minerals.value = e['minerals'];
      s.temperature.value = e['temperature'];
      insert(s, e['place']);
    });
    // load guardian
    List<Map<String, dynamic>> guardiansData =
    await DBHelper().queryAllRows(DBHelper.guardians);
    guardiansData.forEach((e) {
      Guardian g = InventoryCtrl.get(e['name']);
      insertGuardian(g);
    });
  }

  static Succulent get(int place) {
    return User().pietrario.succulents[place];
  }

  static Guardian getGuardian() {
    return User().pietrario.guardian;
  }

  static bool succulentIn(int place) {
    return get(place) != null;
  }

  static bool guardianIn() {
    return getGuardian() != null;
  }

  static Future<bool> insert(Succulent s, int place) async {
    User().pietrario.succulents[place] = s.copy();
    return await DBHelper().insert(DBHelper.succulents, {
      'name' : s.name,
      'place' : place,
      'health' : s.health.value,
      'hydration' : s.hydration.value,
      'minerals' : s.minerals.value,
      'temperature' : s.temperature.value,
    }) == 1;
  }

  static Future<bool> add(Succulent s, int place) async {
    if(succulentIn(place)) return false;
    InventoryCtrl.drop(s.name, 1);
    return insert(s, place);
  }

  static Future<bool> insertGuardian(Guardian g) async {
    User().pietrario.guardian = g.copy();
    return await DBHelper().insert(DBHelper.guardians, {
      'name' : g.name,
    }) == 1;
  }

  static Future<bool> addGuardian(Guardian g) async {
    if(guardianIn()) return false;
    InventoryCtrl.drop(g.name, 1);
    return insertGuardian(g);
  }

  static Future<bool> delete(int place) async {
    if(!succulentIn(place)) return false;
    Succulent s  = get(place);
    InventoryCtrl.add(s.name, 1);
    User().pietrario.succulents.remove(place);
    return await DBHelper().delete(DBHelper.succulents, s.name) == 1;
  }

  static Future<bool> deleteGuardian() async {
    if(!guardianIn()) return false;
    Guardian g = getGuardian();
    InventoryCtrl.add(g.name, 1);
    User().pietrario.guardian = null;
    return await DBHelper().delete(DBHelper.guardians, g.name) == 1;
  }

  static Future<bool> update(Succulent s, int place) async {
    User().pietrario.succulents[place] = s.copy();
    return await DBHelper().update(DBHelper.succulents, {
      'name' : s.name,
      'place' : place,
      'health' : s.health.value,
      'hydration' : s.hydration.value,
      'minerals' : s.minerals.value,
      'temperature' : s.temperature.value,
    }) == 1;
  }

  static bool canVitalize(Vital v, String name) {
    return name != Vital.health || (
        InventoryCtrl.get(Resource.water).amount >= 5
            && InventoryCtrl.get(Resource.moss).amount >= 5
            && InventoryCtrl.get(Resource.energy).amount >= 5
    );
  }

  static bool vitalize(Vital v, String name) {
    if(name != Vital.health) {
      v.increase();
      String resource = Vital.vitalResources[name];
      if(InventoryCtrl.get(resource).amount >= 10
          && v.value < v.maxValue) {
        InventoryCtrl.drop(resource, 10);
        return true;
      }
    } else if(InventoryCtrl.get(Resource.water).amount >= 5
        && InventoryCtrl.get(Resource.moss).amount >= 5
        && InventoryCtrl.get(Resource.energy).amount >= 5
        && v.value < v.maxValue) {
      v.increase();
      InventoryCtrl.drop(Resource.water, 5);
      InventoryCtrl.drop(Resource.moss, 5);
      InventoryCtrl.drop(Resource.energy, 5);
      return true;
    }
    return false;
  }

}