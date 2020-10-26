/// @author estidlozano
class Bioasset {

  int costWater;
  int costMoss;
  int costEnergy;
  int amount;
  String name;
  String description;

  Bioasset({this.costWater = 0, this.costMoss = 0, this.costEnergy = 0,
    this.amount = 0, this.name, this.description});

  Bioasset copy() {
    return Bioasset(
      costWater: costWater,
      costMoss: costMoss,
      costEnergy: costEnergy,
      amount: amount,
      name: name,
      description: description,
    );
  }

}
