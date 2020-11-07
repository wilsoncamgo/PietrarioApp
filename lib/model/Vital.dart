import 'package:flutter/cupertino.dart';

/// @author estidlozano
class Vital {

  int value,
      minValue,
      maxValue,
      losingValue;

  Vital({
    @required this.value,
    @required this.minValue,
    @required this.maxValue,
    @required this.losingValue
  });

  Vital copy() {
    return Vital(
      value: value,
      minValue: minValue,
      maxValue: maxValue,
      losingValue: losingValue,
    );
  }

}
