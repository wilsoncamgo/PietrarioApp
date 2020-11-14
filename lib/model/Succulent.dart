import 'package:flutter/cupertino.dart';
import 'package:pietrario_sample_app/model/Bioasset.dart';

import 'Vital.dart';

/// @author estidlozano
class Succulent extends Bioasset {

  Vital health,
      hydration,
      minerals,
      temperature;

  Succulent({
    @required this.health,
    @required this.hydration,
    @required this.minerals,
    @required this.temperature,
    int costWater = 0,
    int costMoss = 0,
    int costEnergy = 0,
    int amount = 0,
    @required String name,
  }) : super(
    costWater: costWater,
    costMoss: costMoss,
    costEnergy: costEnergy,
    amount: amount,
    name: name,
    type: Bioasset.typeSucculent,
  );

  @override
  Succulent copy() {
    return Succulent(
      health: health.copy(),
      hydration: hydration.copy(),
      minerals: minerals.copy(),
      temperature: temperature.copy(),
      costWater: costWater,
      costMoss: costMoss,
      costEnergy: costEnergy,
      amount: amount,
      name: name,
    );
  }

}
