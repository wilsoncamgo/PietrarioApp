import 'package:flutter/cupertino.dart';
import 'package:pietrario_sample_app/model/Bioasset.dart';

/// @author estidlozano
class Guardian extends Bioasset {

  double bonusWater,
      bonusMoss,
      bonusEnergy;

  Guardian({
    @required this.bonusWater,
    @required this.bonusMoss,
    @required this.bonusEnergy,
    int costWater = 0,
    int costMoss = 0,
    int costEnergy = 0,
    int amount = 0,
<<<<<<< HEAD
    @required String name, String description,
=======
    @required String name,
    @required String description,
<<<<<<< HEAD
>>>>>>> parent of f9dc8d7... added local database
=======
>>>>>>> parent of f9dc8d7... added local database
  }) : super(
    costWater: costWater,
    costMoss: costMoss,
    costEnergy: costEnergy,
    amount: amount,
    name: name,
    description: description,
    type: 'guardian',
  );

  @override
  Guardian copy() {
    return Guardian(
      bonusWater: bonusWater,
      bonusMoss: bonusMoss,
      bonusEnergy: bonusEnergy,
      costWater: costWater,
      costMoss: costMoss,
      costEnergy: costEnergy,
      amount: amount,
      name: name,
      description: description,
    );
  }

}
