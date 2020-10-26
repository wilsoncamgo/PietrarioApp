import 'package:pietrario_sample_app/model/Bioasset.dart';
import 'package:pietrario_sample_app/model/User.dart';

/// @author estidlozano
class PietrarioCtrl {

  static bool put(Bioasset bioasset, int place) {
    if(isIn(place)) return false;
    User().pietrario.bioassets[place] = bioasset.copy();
    return true;
  }

  static bool drop(int place) {
    if(!isIn(place)) return false;
    User().pietrario.bioassets.remove(place);
    return true;
  }

  static bool move(int from, int to) {
    Map<int, Bioasset> ls = User().pietrario.bioassets;
    if(!isIn(from) || isIn(to)) return false;
    ls[to] = ls.remove(from);
    return true;
  }

  static bool isIn(int place) {
    return User().pietrario.bioassets[place] != null;
  }

}