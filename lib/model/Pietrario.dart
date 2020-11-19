import 'package:flutter/cupertino.dart';
import 'package:pietrario_app/model/Guardian.dart';
import 'package:pietrario_app/model/Succulent.dart';

/// @author estidlozano
class Pietrario {

  String terrain;
  double temperature;
  double light;
  Guardian guardian;
  Map<int, Succulent> succulents;

  Pietrario({
    @required this.terrain,
    @required this.temperature,
    @required this.light,
    @required this.succulents,
    @required this.guardian,
  });

}
