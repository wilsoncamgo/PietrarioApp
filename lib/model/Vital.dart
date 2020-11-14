import 'package:flutter/cupertino.dart';
import 'package:pietrario_sample_app/model/Resource.dart';

/// @author estidlozano
class Vital {

  static String
      health = 'health',
      hydration = 'hydration',
      minerals = 'minerals',
      temperature = 'temperature';

  static var vitalResources = {
    health: 'all',
    hydration: Resource.water,
    minerals: Resource.moss,
    temperature: Resource.energy,
  };

  double value,
      minValue,
      maxValue,
      losingValue;

  Vital({
    @required this.value,
    this.minValue = 0,
    @required this.maxValue,
    @required this.losingValue,
  });

  void increase() {
    value += losingValue * 10;
    if(value > maxValue) value = maxValue;
  }

  Vital copy() {
    return Vital(
      value: value,
      minValue: minValue,
      maxValue: maxValue,
      losingValue: losingValue,
    );
  }

}
