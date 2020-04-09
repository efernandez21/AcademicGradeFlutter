import 'dart:collection';

import 'package:academic_grade/src/models/Actividad.dart';
import 'package:academic_grade/src/models/Acudiente.dart';
import 'package:academic_grade/src/models/Curso.dart';
import 'package:academic_grade/src/models/Estudiante.dart';
import 'package:academic_grade/src/models/Mensaje.dart';




class Selector {
  List<Curso> cursos;
  Acudiente acudiente;

  Selector(List<Curso> cursos,Acudiente acudiente) {
    this.cursos = cursos;
    this.acudiente = acudiente;
  }
 
  Map<Estudiante,Curso> listarEstudiante(List<Curso> cursos){
      Map<Estudiante,Curso> todosEstudiantes = Map();

      for(int i=0;i<cursos.length;i++)
      {
        Curso curso = cursos[i];
        for(int j=0;j<curso.alumnos.length;j++)
        {
          Estudiante estudiante = curso.alumnos[j];
          todosEstudiantes[estudiante] = curso;

          
        }
      }
      return todosEstudiantes;
  }

  Map<Estudiante,Curso> escogerHijos(Map<Estudiante,Curso> estudiantes )
  {
      Map<Estudiante,Curso> hijos = Map();
      List<Estudiante> estudiantePivot = estudiantes.keys.toList();
      for(int i=0;i<estudiantePivot.length;i++)
      {
        
        
        Estudiante hijoPivot = estudiantePivot[i];
        if(hijoPivot.acudiente==this.acudiente)
        {
          Curso curso = estudiantes[hijoPivot];
          hijos[hijoPivot] = curso;

        }
      }

      return hijos;
    
  }

  void llenarBuzon(Map<Estudiante,Curso> hijos)
  {
    List<Mensaje> mensajes = new List();
    List<Curso> cursosHijos = hijos.values.toList().toSet().toList();
    print(cursosHijos);
    for(int i=0;i<cursosHijos.length;i++)
    {
      Curso curso = cursosHijos[i];
      for(int j=0;j<curso.actividades.length;j++)
      {
        Actividad actividad = curso.actividades[j];
        Mensaje mensaje = new Mensaje(actividad.descripcion,curso.profesorTitular.nombre);
        mensajes.add(mensaje);
       
      }
    }
     print(mensajes);
    //return mensajes;
  }

}