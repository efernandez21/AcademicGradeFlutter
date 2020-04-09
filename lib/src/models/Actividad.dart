import 'package:academic_grade/src/models/Asignatura.dart';

class Actividad {
  String descripcion;
  String fechaEntrega;
  Asignatura asignatura;

  Actividad(String descripcion, String fechaEntrega,Asignatura asignatura) {
    this.descripcion = descripcion;
    this.fechaEntrega = fechaEntrega;
    this.asignatura = asignatura;
  }
  String toString() {
    return descripcion + " " + fechaEntrega + " " + asignatura.nombre;
  }
}