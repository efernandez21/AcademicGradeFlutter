import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:academic_grade/src/models/Profesor_model.dart';

class ProfesorProvider {

  //direccion url de la base de datos de firebase
  final String _url = 'https://academicgrade-19c56.firebaseio.com';

  //Metodo para cargar informacion de las asignaturas
  Future<List<Profesor>> cargarProfesores() async{
    //la url para hacer la solicitud
    final url = '$_url/profesores.json';
    //la respuesta de la peticion
    final resp = await http.get(url);
    //Decodificacion de datos, en este caso recibimos un mapa dentro de otro mapa
    final Map<String,dynamic> decodedData = json.decode(resp.body);
    //Para extraerlos  datos de las asignaturas se almacenaran en un listado temporal
    final List<Profesor> profesores = new List();

    if(decodedData == null) return [];
    //Revisamos las asignaturas recibimos un id y un nombre
    decodedData.forEach((id, profesor){
      //Convertimos los datos es una asignaruta
      final profesorTemp = Profesor.fromJson(profesor);
      //Agregamos a la lista de asignaturas la temporal
      profesores.add(profesorTemp);
    });
    // print(asignaturas);
    return profesores;
   
  }
}