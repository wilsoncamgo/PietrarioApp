import 'package:pietrario_sample_app/model/Bioasset.dart';

class Guardian extends Bioasset {

  double bonoAgua;
  double bonoMusgo;
  double bonoEnergia;
  String especie;

  Guardian({this.bonoAgua, this.bonoMusgo, this.bonoEnergia, this.especie,
  int costoAgua, int costoMusgo, int costoEnergia, String descripcion})
  : super(costoAgua: costoAgua, costoMusgo: costoMusgo, costoEnergia: costoEnergia, descripcion: descripcion);

}
