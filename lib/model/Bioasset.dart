import 'package:flutter/cupertino.dart';

/// @author estidlozano
class Bioasset {

  int costWater,
      costMoss,
      costEnergy,
      amount;
  String name,
      type;

  Bioasset({
    this.costWater = 0,
    this.costMoss = 0,
    this.costEnergy = 0,
    this.amount = 0,
    @required this.name,
    @required this.type,
  });

  Bioasset copy() {
    return Bioasset(
      costWater: costWater,
      costMoss: costMoss,
      costEnergy: costEnergy,
      amount: amount,
      name: name,
      type: type,
    );
  }

}
