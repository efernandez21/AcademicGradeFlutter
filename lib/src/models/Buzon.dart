import 'package:academic_grade/src/models/Mensaje.dart';

class Buzon {
  int idBuzon;
  List<Mensaje> mensajes;

  Buzon(int idBuzon,List<Mensaje> mensajes) {
    this.idBuzon = idBuzon;
    this.mensajes = mensajes;
  }
}
