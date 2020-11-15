import 'package:pietrario_app/model/Bioasset.dart';
import 'package:pietrario_app/model/Resource.dart';
import 'InventoryCtrl.dart';

/// @author estidlozano
class MarketCtrl {

  static bool canPurchase(Bioasset bio) {
    return InventoryCtrl.get(Resource.water).amount >= bio.costWater
        && InventoryCtrl.get(Resource.moss).amount >= bio.costMoss
        && InventoryCtrl.get(Resource.energy).amount >= bio.costEnergy;
  }

  static bool purchase(Bioasset bio) {
    if(canPurchase(bio)) {
      InventoryCtrl.add(bio.name, bio.type == Bioasset.typeResource ? 100 : 1);
      InventoryCtrl.drop(Resource.water, bio.costWater);
      InventoryCtrl.drop(Resource.moss, bio.costMoss);
      InventoryCtrl.drop(Resource.energy, bio.costEnergy);
      return true;
    }
    return false;
  }

}