

//Utilidades varias

import 'package:academic_grade/src/models/Asignatura.dart';

int idMateriaSeleccionada(List<Asignatura> asignaturas, String asignaturaSeleccionada){
  //comprobacion de la materia seleccionada
  int index = 0;
  asignaturas.forEach((asignatura){
    //Realizamos una pequeña comprobacion con respecto a la asignatura si la seleccionada tiene el mismo nombre o esta incluida e la lista
    if( asignatura.nombre == asignaturaSeleccionada ){
      index = asignatura.id;
    }
  
  });

  //Retornamos el id de la asignatura
  return index;
}
