// To parse this JSON data, do
//
//     final cursoActividad = cursoActividadFromJson(jsonString);

import 'dart:convert';

CursoActividad cursoActividadFromJson(String str) => CursoActividad.fromJson(json.decode(str));

String cursoActividadToJson(CursoActividad data) => json.encode(data.toJson());

class CursoActividad {
    int idcurso;
    String idactividad;

    CursoActividad({
        this.idcurso,
        this.idactividad,
    });

    factory CursoActividad.fromJson(Map<String, dynamic> json) => CursoActividad(
        idcurso: json["idcurso"],
        idactividad: json["idactividad"],
    );

    Map<String, dynamic> toJson() => {
        "idcurso": idcurso,
        "idactividad": idactividad,
    };
}
