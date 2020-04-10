import 'package:academic_grade/src/models/Actividad.dart';
import 'package:academic_grade/src/models/Estudiante.dart';
import 'package:academic_grade/src/models/Profesor.dart';

class Curso {
  int idCurso;
  int grado;
  String grupo;
  int capacidad;
  List<Estudiante> alumnos;
  List<Actividad> actividades;
  Profesor profesorTitular;

  Curso(int id,int grado,String grupo, int capacidad,Profesor profesorTitular,List<Estudiante> alumnos,List<Actividad> actividades) {
    this.idCurso = id;
    this.grado = grado;
    this.grupo = grupo;
    this.capacidad = capacidad;
    this.profesorTitular = profesorTitular;
    this.alumnos = alumnos;
    this.actividades = actividades;
  }
  void agregarAlumno(List<Estudiante> estudiantes) {
    for(int i=0;i<estudiantes.length;i++)
    {
      Estudiante estudiante = estudiantes[i];
      if(estudiante.curso.idCurso==this.idCurso)
      {
        this.alumnos.add(estudiante);
      }
    }
    
  }
  String toString(){
    return "Curso:"+grado.toString()+"-"+grupo;
  }

  void asignarActividad(Actividad actividad) {
    this.actividades.add(actividad);
    
  }
  
  
      



  }