


import 'package:academic_grade/src/models/Actividad_model.dart';

class Calendario {
  int idCalendario;
  List<Actividad> actividades;

  Calendario(int id,List<Actividad> actividades) {
    this.idCalendario = id;
    this.actividades = actividades;
  }
} 