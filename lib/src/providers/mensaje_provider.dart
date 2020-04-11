import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:academic_grade/src/models/Mensaje.dart';

class MensajeProvider{
  final String _url = 'https://academicgrade-19c56.firebaseio.com';
  Future<List<Mensaje>> cargarMensajes() async{
  final url = '$_url/mensajes.json';
    //la respuesta de la peticion
    final resp = await http.get(url);
    final Map<String,dynamic> decodedData = json.decode(resp.body);
    final List<Mensaje> mensajes = new List();
    if(decodedData == null) return [];
    decodedData.forEach((id, mensaje){
      //Convertimos los datos es una asignaruta
      final mensajeTemp = Mensaje.fromJson(mensaje);
      //Agregamos el id de la actividad
      mensajeTemp.idmensaje = id;
      //Agregamos a la lista de asignaturas la temporal
      mensajes.add(mensajeTemp);
    });
    return mensajes;
  }
}