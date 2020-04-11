// To parse this JSON data, do
//
//     final profesor = profesorFromJson(jsonString);

import 'dart:convert';

Profesor profesorFromJson(String str) => Profesor.fromJson(json.decode(str));

String profesorToJson(Profesor data) => json.encode(data.toJson());

class Profesor {
    int id;
    String nombre;
    String apellido;

    Profesor({
        this.id,
        this.nombre,
        this.apellido,
    });

    factory Profesor.fromJson(Map<String, dynamic> json) => Profesor(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
    };
}
