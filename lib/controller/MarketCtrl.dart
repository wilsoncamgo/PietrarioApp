import 'package:pietrario_sample_app/model/Bioasset.dart';
import 'package:pietrario_sample_app/model/User.dart';

import 'InventoryCtrl.dart';

/// @author estidlozano
class MarketCtrl {

  static bool canPurchase(Bioasset bio) {
    return User().inventory['water'].amount >= bio.costWater
        && User().inventory['moss'].amount >= bio.costMoss
        && User().inventory['energy'].amount >= bio.costEnergy;
  }

  static bool purchase(Bioasset bio) {
    bool b = false;
    if(canPurchase(bio)) {
      InventoryCtrl.add(bio.name, 1);
      InventoryCtrl.drop('water', bio.costWater);
      InventoryCtrl.drop('moss', bio.costMoss);
      InventoryCtrl.drop('energy', bio.costEnergy);
      b = true;
    }
    return b;
  }

}