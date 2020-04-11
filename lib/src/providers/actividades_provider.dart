import 'dart:convert';
import 'package:http/http.dart' as http;


//Clase para traernos la informacion de la base de datos

import 'package:academic_grade/src/models/Actividad_model.dart';

class ActividadesProvider {

  //direccion url de la base de datos de firebase
  final String _url = 'https://academicgrade-19c56.firebaseio.com';

  //Funcion de crearActividad para el profesor
  Future<bool> crearActividad( Actividad actividad ) async {
    
    final url = '$_url/actividades.json';

    final resp = await http.post( url, body: actividadToJson(actividad) );

    final decodedData = json.decode(resp.body);

    print( decodedData );
    //Si esto fue exitoso retornara true
    return true;

  }
  //Funcion de carga de actividades
  Future<List<Actividad>> cargarActividades() async{
    //la url para hacer la solicitud
    final url = '$_url/actividades.json';
    //la respuesta de la peticion
    final resp = await http.get(url);
    //Decodificacion de datos, en este caso recibimos un mapa dentro de otro mapa
    final Map<String,dynamic> decodedData = json.decode(resp.body);
    //Para extraerlos  datos de las asignaturas se almacenaran en un listado temporal
    final List<Actividad> actividades = new List();

    if(decodedData == null) return [];
    //Revisamos las asignaturas recibimos un id y un nombre
    decodedData.forEach((id, actividad){
      //Convertimos los datos es una asignaruta
      final actividadTemp = Actividad.fromJson(actividad);
      //Agregamos el id de la actividad
      actividadTemp.idactividad = id;
      //Agregamos a la lista de asignaturas la temporal
      actividades.add(actividadTemp);
    });
    print(actividades);
    return actividades;
   
  }
  //Eliminar Actividad
  Future<int> eliminarActividad( String id ) async{
    //Armamos la url
    final url = '$_url/actividades/$id.json';
    //Peticion de eliminacion
    final resp = await http.delete(url);
    //la resp sera en este caso null debido a que fue completamente exitoso el proceso de eliminacion, nos retornaria algo si no fue asi.
    print( resp.body);
    //El retorno de la actividad eliminada
    return 1;
  }
  //Editar Actividad, se retorna si se logro algo si o si
  Future<bool> editarActividad(Actividad actividad) async{
    //la url de la tabla o el lugar editar el producto
    final url = '$_url/actividades/${actividad.idactividad}.json';
    //Peticion http en este caso, firebase me lo pide como un string, por eso invocamos el metodo productotoModelToJson para trabajar con la informacion a enviar, y lo mandamos dentro de un put de tal forma que actualizaremos a este
    final resp = await http.put(url,body: actividadToJson(actividad));
    //el decodedData me decodificara la respuesta obtenida luego de intentar subir los datos a firebase
    final decodedData = json.decode(resp.body);
    //Los datos recibidos en este caso si son exitosos se recibe un id que es el que firebase le asigna al producto
    print(decodedData);
    //implicitamente retorna un true
    return true;
  }
  //metodo para saber el id de la actividad asignada
  Future<String> obtenerActividad(int identificacionProfesor, String descripcion, int asignatura) async{
    //comprobamos
    String codigoActividad = 'No encontrado';
    //Declaramos la lista a cargar
    List<Actividad> actividades = new List();
    actividades = await cargarActividades();
    //revisamos
    actividades.forEach( (actividad){
      //Condicion para atrapar el id del curso
      if((actividad.idprofesor == identificacionProfesor)&& (actividad.descripcion == descripcion) && (actividad.idasignatura == asignatura)){
        codigoActividad = actividad.idactividad;
      }

    });
    //Este es el curso al que le dicta el profesor
    return codigoActividad;
  }

}