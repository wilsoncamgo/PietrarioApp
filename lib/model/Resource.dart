import 'package:flutter/cupertino.dart';
import 'package:pietrario_sample_app/model/Bioasset.dart';

/// @author estidlozano
class Resource extends Bioasset {

  static String
      water = 'water',
      moss = 'moss',
      energy = 'energy';

  double production;

  Resource({
    this.production = 60,
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
    type: Bioasset.typeResource,
  );

}
