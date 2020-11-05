import 'package:pietrario_sample_app/model/Bioasset.dart';

import 'Vital.dart';

/// @author estidlozano
class Succulent extends Bioasset {

  Vital health;
  Vital hidratation;
  Vital minerals;
  Vital temperature;

  Succulent({this.health, this.hidratation, this.minerals, this.temperature,
  int costWater = 0, int costMoss = 0, int costEnergy = 0, int amount = 0, String name, String description})
  : super(costWater: costWater, costMoss: costMoss, costEnergy: costEnergy, amount: amount, name: name, description: description);

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
