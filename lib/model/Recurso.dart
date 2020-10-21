import 'package:pietrario_sample_app/model/Bioasset.dart';

class Recurso extends Bioasset {

  int valor;
  double produccion;
  int minCosto;
  int maxCosto;

  Recurso({this.valor, this.produccion, this.minCosto, this.maxCosto,
  costoAgua, costoMusgo, costoEnergia, descripcion})
  : super(costoAgua: costoAgua, costoMusgo: costoMusgo, costoEnergia: costoEnergia);

}
