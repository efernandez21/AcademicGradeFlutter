// To parse this JSON data, do
//
//     final asignatura = asignaturaFromJson(jsonString);

import 'dart:convert';

Asignatura asignaturaFromJson(String str) => Asignatura.fromJson(json.decode(str));

String asignaturaToJson(Asignatura data) => json.encode(data.toJson());

class Asignatura {
    int id;
    String nombre;

    Asignatura({
        this.id,
        this.nombre,
    });

    factory Asignatura.fromJson(Map<String, dynamic> json) => Asignatura(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}

