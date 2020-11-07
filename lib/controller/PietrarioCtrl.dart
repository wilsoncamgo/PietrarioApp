import 'package:pietrario_sample_app/controller/InventoryCtrl.dart';
import 'package:pietrario_sample_app/model/Guardian.dart';
import 'package:pietrario_sample_app/model/Pietrario.dart';
import 'package:pietrario_sample_app/model/Succulent.dart';
import 'package:pietrario_sample_app/model/User.dart';

/// @author estidlozano
class PietrarioCtrl {

  static void initPietrario() {
    Map<int, Succulent> succulents = Map<int, Succulent>();
    Guardian guardian;
    User().pietrario = Pietrario(terrain: 'Desert', temperature: 35,
        succulents: succulents, guardian: guardian);
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

  static bool put(Succulent s, int place) {
    if(succulentIn(place)) return false;
    User().pietrario.succulents[place] = s.copy();
    InventoryCtrl.drop(s.name, 1);
    return true;
  }

  static bool putGuardian(Guardian g) {
    if(guardianIn()) return false;
    User().pietrario.guardian = g.copy();
    InventoryCtrl.drop(g.name, 1);
    return true;
  }

  static bool drop(int place) {
    if(!succulentIn(place)) return false;
    Succulent s  = get(place);
    InventoryCtrl.add(s.name, 1);
    User().pietrario.succulents.remove(place);
    return true;
  }

  static bool dropGuardian() {
    if(!guardianIn()) return false;
    Guardian g = getGuardian();
    InventoryCtrl.add(g.name, 1);
    User().pietrario.guardian = null;
    return true;
  }

}