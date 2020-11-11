import 'package:flutter/cupertino.dart';
import 'package:pietrario_sample_app/model/Bioasset.dart';

import 'Vital.dart';

/// @author estidlozano
class Succulent extends Bioasset {

  Vital health,
      hidratation,
      minerals,
      temperature;

  Succulent({
    @required this.health,
    @required this.hidratation,
    @required this.minerals,
    @required this.temperature,
    int costWater = 0,
    int costMoss = 0,
    int costEnergy = 0,
    int amount = 0,
<<<<<<< HEAD
    @required String name, String description,
=======
    @required String name,
    @required String description
>>>>>>> parent of f9dc8d7... added local database
  }) : super(
    costWater: costWater,
    costMoss: costMoss,
    costEnergy: costEnergy,
    amount: amount,
    name: name,
    description: description,
    type: 'succulent',
  );

  @override
  Succulent copy() {
    return Succulent(
      health: health.copy(),
      hidratation: hidratation.copy(),
      minerals: minerals.copy(),
      temperature: temperature.copy(),
      costWater: costWater,
      costMoss: costMoss,
      costEnergy: costEnergy,
      amount: amount,
      name: name,
      description: description
    );
  }

}
