import 'package:pietrario_sample_app/model/Bioasset.dart';
import 'package:pietrario_sample_app/model/Pietrario.dart';
import 'package:pietrario_sample_app/model/Recurso.dart';

class User {

  Recurso agua;
  Recurso musgo;
  Recurso energia;
  Pietrario pietrario;
  List<Bioasset> inventario;

  static final User instance = User._internal();

  factory User() {
    return instance;
  }

  User._internal();

}