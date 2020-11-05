import 'package:pietrario_sample_app/model/Bioasset.dart';

/// @author estidlozano
class Guardian extends Bioasset {

  double bonusWater;
  double bonusMoss;
  double bonusEnergy;

  Guardian({this.bonusWater, this.bonusMoss, this.bonusEnergy,
  int costWater = 0, int costMoss = 0, int costEnergy = 0, int amount = 0, String name, String description})
  : super(costWater: costWater, costMoss: costMoss, costEnergy: costEnergy,
      amount: amount, name: name, description: description);

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
