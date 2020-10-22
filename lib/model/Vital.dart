class Vital {

  int value;
  int minValue;
  int maxValue;
  int losingValue;

  Vital({this.value, this.minValue, this.maxValue, this.losingValue});

  Vital copy() {
    return Vital(value: value, minValue: minValue, maxValue: maxValue, losingValue: losingValue);
  }

}
