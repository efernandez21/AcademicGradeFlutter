
import 'package:flutter/material.dart';
//Utilidades varias

import 'package:academic_grade/src/models/Asignatura.dart';
//Mostramos una alerta en este caso un ShowDialog
void mostrarAlerta(BuildContext context, String descripcion, String fecha) {

  showDialog(
    context: context,
    builder:  (context){
      //Cuadro de alerta 
      return AlertDialog(
        title: Column(
          children: <Widget>[
            Text('Informacion de la Actividad',style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height:10.0),
            Text('Fecha limite: $fecha')

          ],
        ),
        content: Text(descripcion),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: ()=> Navigator.of(context).pop(), 
          )
        ],
      );
    }
  );
}
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

void mostrarCargando(BuildContext context){
  showDialog(
    context: context,
    builder:  (context){
      //Cuadro de alerta 
      return AlertDialog(
        title: Text(
          'Guardando.....',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        content: Image.asset('assets/img/jar-loading.gif'),
        // actions: <Widget>[
        //   Center(
        //     child: Container(
        //       child: CircularProgressIndicator(),
        //     ),
        //   )
        // ],
      );
    }
  );
}
//Arreglar un String de una fecha
DateTime deStringDatetime(String fechaNormal){
  String fechaNueva;
  List<String> particion;
  particion = fechaNormal.split('/');

  fechaNueva = particion[2]+'-'+particion[1]+'-'+particion[0];
  DateTime fechaN = DateTime.parse(fechaNueva);
  return fechaN;
}
//Metodos para el calendario