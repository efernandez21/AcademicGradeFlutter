import 'package:academic_grade/src/models/Actividad.dart';
import 'package:academic_grade/src/models/Mensaje.dart';
import 'package:academic_grade/src/models/Estudiante.dart';

class Curso {
  int grado;
  String grupo;
  int capacidad;
  List<Estudiante> alumnos;
  List<Actividad> actividades;
  String profesorTitular;

  Curso(grado, grupo, capacidad, profesorTitular, alumnos, actividades) {
    this.grado = grado;
    this.grupo = grupo;
    this.capacidad = capacidad;
    this.profesorTitular = profesorTitular;
    this.alumnos = alumnos;
    this.actividades = actividades;
  }
  void agregarAlumno(Estudiante estudiante) {
    this.alumnos.add(estudiante);
  }

  Mensaje asignarActividad(Actividad actividad) {
    String descripcion = "La actividad "+actividad.descripcion+" de la asignatura "+actividad.asignatura;
    String fechaEnvio = new DateTime.now().toString().substring(0, 10);
    Mensaje notificacion =
        new Mensaje(descripcion, fechaEnvio, this.profesorTitular);
    this.actividades.add(actividad);
    return notificacion;
  }
}
