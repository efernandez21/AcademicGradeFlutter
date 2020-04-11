// To parse this JSON data, do
//
//     final curso = cursoFromJson(jsonString);

import 'dart:convert';

Curso cursoFromJson(String str) => Curso.fromJson(json.decode(str));

String cursoToJson(Curso data) => json.encode(data.toJson());

class Curso {
    int grado;
    String grupo;
    int capacidad;
    int idcurso;
    int idprofesor;

    Curso({
        this.grado,
        this.grupo,
        this.capacidad,
        this.idcurso,
        this.idprofesor,
    });

    factory Curso.fromJson(Map<String, dynamic> json) => Curso(
        grado: json["grado"],
        grupo: json["grupo"],
        capacidad: json["capacidad"],
        idcurso: json["idcurso"],
        idprofesor: json["idprofesor"],
    );

    Map<String, dynamic> toJson() => {
        "grado": grado,
        "grupo": grupo,
        "capacidad": capacidad,
        "idcurso": idcurso,
        "idprofesor": idprofesor,
    };
}
