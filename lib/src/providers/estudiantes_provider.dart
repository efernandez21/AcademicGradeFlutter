import 'dart:convert';
import 'package:academic_grade/src/models/Estudiante_model.dart';
import 'package:http/http.dart' as http;

class EstudianteProvider {

  //direccion url de la base de datos de firebase
  final String _url = 'https://academicgrade-19c56.firebaseio.com';

  //Metodo para cargar informacion de las asignaturas
  Future<List<Estudiante>> cargarHijos() async{
    //la url para hacer la solicitud
    final url = '$_url/estudiantes.json';
    //la respuesta de la peticion
    final resp = await http.get(url);
    //Decodificacion de datos, en este caso recibimos un mapa dentro de otro mapa
    final Map<String,dynamic> decodedData = json.decode(resp.body);
    //Para extraerlos  datos de las asignaturas se almacenaran en un listado temporal
    final List<Estudiante> estudiantes = new List();

    if(decodedData == null) return [];
    //Revisamos las asignaturas recibimos un id y un nombre
    decodedData.forEach((id, estudiante){
      //Convertimos los datos es una asignaruta
      final estudianteTemp = Estudiante.fromJson(estudiante);
      //Agregamos a la lista de estudiantes la temporal
      estudiantes.add(estudianteTemp);
    });
    // print(asignaturas);
    return estudiantes;
   
  }
  // List<Estudiante>  comprobarCodigos



}

