

//Utilidades varias

import 'package:academic_grade/src/models/Asignatura.dart';
//
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
String obtenerStringMateria(List<Asignatura> asignaturas, int indexAsignatura){
  String asignaturaElegida = '';
  asignaturas.forEach((asignatura){
    //Realizamos una pequeña comprobacion con respecto a la asignatura si la seleccionada tiene el mismo nombre o esta incluida e la lista
    if( asignatura.id == indexAsignatura ){
      asignaturaElegida = asignatura.nombre;
    }
  
  });

  return asignaturaElegida;


}

List<String> encontrarRuta(String texto){
  var ruta = texto.split(" ");
  // print(ruta);
  return ruta;
}
int buscarElemento(List<dynamic> usuario, List<String> lista ){
  int index;
  for (var i = 0; i < usuario.length; i++) {
    if(usuario[i].nombre == lista[1]){
      index = i;
    }
  }
  
  return index;
}
