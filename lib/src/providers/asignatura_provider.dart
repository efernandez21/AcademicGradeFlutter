import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:academic_grade/src/models/Asignatura.dart';

class AsignaturaProvider {

  //direccion url de la base de datos de firebase
  final String _url = 'https://academicgrade-19c56.firebaseio.com';
  //Metodos para agregacion y obtencion de asignaturas
  Future<bool> crearAsignatura( Asignatura asignatura ) async {
    
    final url = '$_url/asignaturas.json';

    final resp = await http.post( url, body: asignaturaToJson(asignatura) );

    final decodedData = json.decode(resp.body);

    print( decodedData );
    //Si esto fue exitoso retornara true
    return true;

  }
  //Metodo para cargar informacion de las asignaturas
  Future<List<Asignatura>> cargarAsignaturas() async{
    //la url para hacer la solicitud
    final url = '$_url/asignaturas.json';
    //la respuesta de la peticion
    final resp = await http.get(url);
    //Decodificacion de datos, en este caso recibimos un mapa dentro de otro mapa
    final Map<String,dynamic> decodedData = json.decode(resp.body);
    //Para extraerlos  datos de las asignaturas se almacenaran en un listado temporal
    final List<Asignatura> asignaturas = new List();

    if(decodedData == null) return [];
    //Revisamos las asignaturas recibimos un id y un nombre
    decodedData.forEach((id, asignatura){
      //Convertimos los datos es una asignaruta
      final asignaturaTemp = Asignatura.fromJson(asignatura);
      //Agregamos a la lista de asignaturas la temporal
      asignaturas.add(asignaturaTemp);
    });
    // print(asignaturas);
    return asignaturas;
   
  }

}
