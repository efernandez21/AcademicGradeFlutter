import 'dart:convert';
import 'package:academic_grade/src/models/cursoActividad_model.dart';
import 'package:http/http.dart' as http;

//Clase para trabajar el curso
import 'package:academic_grade/src/models/Curso.dart';

class CursoProvider {

  
  //direccion url de la base de datos de firebase
  final String _url = 'https://academicgrade-19c56.firebaseio.com';

  //Metodo para cargar informacion de las asignaturas
  Future<List<Curso>> cargarCursos() async{
    //la url para hacer la solicitud
    final url = '$_url/cursos.json';
    //la respuesta de la peticion
    final resp = await http.get(url);
    //Decodificacion de datos, en este caso recibimos un mapa dentro de otro mapa
    final Map<String,dynamic> decodedData = json.decode(resp.body);
    //Para extraerlos  datos de las asignaturas se almacenaran en un listado temporal
    final List<Curso> cursos = new List();

    if(decodedData == null) return [];
    //Revisamos las asignaturas recibimos un id y un nombre
    decodedData.forEach((id, curso){
      //Convertimos los datos es una asignaruta
      final cursoTemp = Curso.fromJson(curso);
      //Agregamos a la lista de asignaturas la temporal
      cursos.add(cursoTemp);
    });
    // print(asignaturas);
    return cursos;
  }
  //Cargamos las actividades de los cursos
  Future<List<CursoActividad>> cargarCursosActividades() async{
    //la url para hacer la solicitud
    final url = '$_url/cursoactividad.json';
    //la respuesta de la peticion
    final resp = await http.get(url);
    //Decodificacion de datos, en este caso recibimos un mapa dentro de otro mapa
    final Map<String,dynamic> decodedData = json.decode(resp.body);
    //Para extraerlos  datos de las asignaturas se almacenaran en un listado temporal
    final List<CursoActividad> cursoactividad = new List();

    if(decodedData == null) return [];
    //Revisamos las asignaturas recibimos un id y un nombre
    decodedData.forEach((id, cursoAct){
      //Convertimos los datos es una asignaruta
      final cursoActTemp = CursoActividad.fromJson(cursoAct);
      //Agregamos a la lista de asignaturas la temporal
      cursoactividad.add(cursoActTemp);
    });
    // print(asignaturas);
    return cursoactividad;
  }
  //metodo para obtener el codigo del curso dado el id del profesor
  Future<int> obtenerCurso( int identificacionProfesor ) async{
    // Mi valor inicial
    int idcurso = -1;
    //llamamos el metodo de cargar cursos
    List<Curso> cursos = new List();
    //cursos tiene la informacion de los cursos ahora
    cursos = await cargarCursos();
    //revisamos el curso
    cursos.forEach( (curso){
      //Condicion para atrapar el id del curso
      if(curso.idprofesor == identificacionProfesor){
        idcurso = curso.idcurso;
      }

    });
    //Este es el curso al que le dicta el profesor
    return idcurso;

  }
  //Metodo para guardar en cursoActividad
  //Funcion de crearActividad en el curso con el parametro curso actividad
  // Future<bool> crearActividadenCurso( CursoActividad cursoActividad ) async {
    
  //   final url = '$_url/cursoactividad.json';

  //   final resp = await http.post( url, body: cursoActividadToJson(cursoActividad) );

  //   final decodedData = json.decode(resp.body);

  //   print( decodedData );
  //   //Si esto fue exitoso retornara true
  //   return true;

  // }
  //Crear actividad al curso pasando parametros
  Future<bool> crearActividadenCurso(String codigoActividad, int codigocurso ) async {
    
    final url = '$_url/cursoactividad.json';
    final cursoActividad = new CursoActividad();
    cursoActividad.idcurso = codigocurso;
    cursoActividad.idactividad = codigoActividad;

    final resp = await http.post( url, body: cursoActividadToJson(cursoActividad) );

    final decodedData = json.decode(resp.body);

    print( decodedData );
    //Si esto fue exitoso retornara true
    return true;

  }



}