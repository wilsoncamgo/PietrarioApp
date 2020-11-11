import 'package:flutter/cupertino.dart';
import 'package:pietrario_sample_app/model/Guardian.dart';
import 'package:pietrario_sample_app/model/Succulent.dart';

/// @author estidlozano
class Pietrario {

  String terrain;
  double temperature;
  Guardian guardian;
  Map<int, Succulent> succulents;

  Pietrario({
    @required this.terrain,
    @required this.temperature,
    this.succulents,
    this.guardian,
  });

}
