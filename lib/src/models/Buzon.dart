import 'package:academic_grade/src/models/Mensaje.dart';

class Buzon {
  int idBuzon;
  List<Mensaje> mensajes;

  Buzon(idBuzon,mensajes) {
    this.idBuzon = idBuzon;
    this.mensajes = mensajes;
  }
}
