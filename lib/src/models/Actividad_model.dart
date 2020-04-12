// To parse this JSON data, do
//
//     final actividad = actividadFromJson(jsonString);

import 'dart:convert';

Actividad actividadFromJson(String str) => Actividad.fromJson(json.decode(str));

String actividadToJson(Actividad data) => json.encode(data.toJson());

class Actividad {
    String idactividad;
    String descripcion;
    String fecha;
    int idasignatura;
    int idprofesor;
    String fotoUrl;

    Actividad({
        this.idactividad,
        this.descripcion='',
        this.fecha='',
        this.idasignatura,
        this.idprofesor,
        this.fotoUrl,
    });

    factory Actividad.fromJson(Map<String, dynamic> json) => Actividad(
        idactividad: json["idactividad"],
        descripcion: json["descripcion"],
        fecha: json["fecha"],
        idasignatura: json["idasignatura"],
        idprofesor: json["idprofesor"],
        fotoUrl: json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        // "idactividad": idactividad,
        "descripcion": descripcion,
        "fecha": fecha,
        "idasignatura": idasignatura,
        "idprofesor": idprofesor,
        "fotoUrl": fotoUrl,
    };
}
