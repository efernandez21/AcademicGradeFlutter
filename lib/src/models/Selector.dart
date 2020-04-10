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
 
  Map<Estudiante,Curso> listarEstudiante(){
      Map<Estudiante,Curso> todosEstudiantes = Map();

      for(int i=0;i<this.cursos.length;i++)
      {
        Curso curso = this.cursos[i];
        for(int j=0;j<curso.alumnos.length;j++)
        {
          Estudiante estudiante = curso.alumnos[j];
          todosEstudiantes[estudiante] = curso;

          
        }
      }
      return todosEstudiantes;
  }

  Map<Estudiante,Curso> escogerHijos()
  {
      Map<Estudiante,Curso> estudiantes = listarEstudiante();
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

  List<Mensaje> llenarBuzon()
  {
    List<Mensaje> mensajes = new List();
    List<Curso> cursosHijos = escogerHijos().values.toList().toSet().toList();
    print(cursosHijos);
    for(int i=0;i<cursosHijos.length;i++)
    {
      Curso curso = cursosHijos[i];
      for(int j=0;j<curso.actividades.length;j++)
      {
        Actividad actividad = curso.actividades[j];
        Mensaje mensaje = new Mensaje(j+1,actividad.descripcion,curso.profesorTitular.nombre);
        mensajes.add(mensaje);
       
      }
    }
     
    return mensajes;
  }

}