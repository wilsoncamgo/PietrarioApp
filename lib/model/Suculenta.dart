import 'package:pietrario_sample_app/model/Bioasset.dart';

import 'Vital.dart';

class Suculenta extends Bioasset {

  Vital salud;
  Vital hidratacion;
  Vital minerales;
  Vital temperatura;
  String especie;

  Suculenta({this.salud, this.hidratacion, this.minerales, this.temperatura, this.especie,
  costoAgua, costoMusgo, costoEnergia, descripcion})
  : super(costoAgua: costoAgua, costoMusgo: costoMusgo, costoEnergia: costoEnergia);

}
