import 'package:academic_grade/src/models/Actividad.dart';
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
  String toString(){
    return "Curso:"+grado.toString()+"-"+grupo;
  }

  void asignarActividad(Actividad actividad) {
    this.actividades.add(actividad);
    
  }
  
  
      



  }