import 'package:pietrario_sample_app/model/Bioasset.dart';

/// @author estidlozano
class Resource extends Bioasset {

  double production;
  static final int minCost = 100;
  static final int maxCost = 300;

  Resource({this.production = 60,
  int costWater, int costMoss, int costEnergy, int amount, String name, String description})
  : super(costWater: costWater, costMoss: costMoss, costEnergy: costEnergy, amount: amount, name: name, description: description);

}
