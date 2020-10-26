import 'package:pietrario_sample_app/model/Bioasset.dart';
import 'package:pietrario_sample_app/model/Pietrario.dart';

/// @author estidlozano
class User {

  Pietrario pietrario;
  Map<String, Bioasset> inventory;

  static final User instance = User._internal();

  factory User() {
    return instance;
  }

  User._internal();

}