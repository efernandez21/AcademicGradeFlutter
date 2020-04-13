import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http/http.dart' as http;
// import 'package:academic_grade/src/providers/curso_provider.dart';


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
  //Cargar Actividades por curso
  Future<List<Actividad>> cargarActividadesCurso(List<String> codigoActividades) async{
    List<Actividad> actividades,actividadesCurso; 
    actividadesCurso = new List();
    //Cargamos las actividades
    actividades = await cargarActividades();
    // ahora las seleccionaremos
    for (var i = 0; i < codigoActividades.length; i++) {
      //Generara error si no encuentra la condicion
      var actividadTemp = actividades.firstWhere((actividad) => actividad.idactividad == codigoActividades[i]) ;
      actividadesCurso.add(actividadTemp);
    }
    print(actividadesCurso);
    return actividadesCurso;
  }
  //Carga las actividades dependiendo del profesor
  Future<List<Actividad>> cargarActividadesProfesor(int ideprofesor) async{
    
    List<Actividad> actividadesTotal,actividadesProfesor ;
    actividadesProfesor = new List();
    actividadesTotal = await cargarActividades();
    //Cargo la lista y trabajo con esto ahora la filtro
    actividadesTotal.forEach((actividad){
      //Filtro las actividades por el id del profesor
      if(actividad.idprofesor == ideprofesor){
        actividadesProfesor.add(actividad);
      }
    });
    //Retorno la lista de actividades
    return actividadesProfesor;
    
  }
  //Metodo para subir una imagen
  //Nuevos metodos para subir la imagen a una nube, en este caso un metodo que retorne un url de salida que usaremos para el firebase, recibe el archivo de la imagen
  Future<String> subirImagen(File imagen) async{
    //La creacion del url pide un uri, este no es un string plano como lo manejamos en firebase
    final url = Uri.parse('https://api.cloudinary.com/v1_1/dpkqy4obp/image/upload?upload_preset=rn5z0s9i');
    //Conocer el tipo de la imagen es necesario, cortamos el string obtenido en una lista en este caso para obtener el tipo de la imagen
    final mimeType = mime(imagen.path).split('/');  //image/jpeg
    //Realizacion de la peticion
    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );
    //preparacion del archivo a adjuntar, en este caso el campo es el que ubicamos en el postman para el archivo, el path donde se encuentra la imagen y tambien el tipo de esta, el mimeType[0] es la imagen que se extrajo y el mimetype[1] es el tipode la imagen
    final file = await http.MultipartFile.fromPath(
      'file',
       imagen.path,
       contentType: MediaType(mimeType[0],mimeType[1])
    );
    //adjuntamos el archivo file a mi imageUploadRequest
    imageUploadRequest.files.add(file);
    //Enviamos nuestro requerimiento y recibimos un StreamResponse
    final streamResponse = await imageUploadRequest.send();
    //obtenemos la respuesta
    final resp = await http.Response.fromStream(streamResponse);
    //Ahora hacemos una validacion con respecto a la respuesta obtenida en nuestra aplicacion, con el codigo de status, en este caso 200 y 201 son mis codigos buenos por asi decirlo
    if ( resp.statusCode != 200 && resp.statusCode != 201 ){
      print('Algo salio mal');
      print( resp.body );
      return null;
    }
    //Si todo salio bueno extraemos el secure_url
    final respData = json.decode(resp.body);
    print(respData);
    //retornamos entonces la url
    return respData['secure_url'];

  }
}