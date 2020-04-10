// To parse this JSON data, do
//
//     final actividad = actividadFromJson(jsonString);
import 'dart:convert';
//convierte el json para procesarlo
Actividad actividadFromJson(String str) => Actividad.fromJson(json.decode(str));
//convierte el mapa para enviarselo a la base de datos
String actividadToJson(Actividad data) => json.encode(data.toJson());

class Actividad {
    String idactividad;
    String descripcion;
    String fecha;
    int idasignatura;

    Actividad({
        this.idactividad,
        this.descripcion,
        this.fecha,
        this.idasignatura,
    });

    factory Actividad.fromJson(Map<String, dynamic> json) => Actividad(
        idactividad: json["idactividad"],
        descripcion: json["descripcion"],
        fecha: json["fecha"],
        idasignatura: json["idasignatura"],
    );

    Map<String, dynamic> toJson() => {
        "idactividad": idactividad,
        "descripcion": descripcion,
        "fecha": fecha,
        "idasignatura": idasignatura,
    };
}