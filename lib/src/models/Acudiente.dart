// To parse this JSON data, do
//
//     final acudiente = acudienteFromJson(jsonString);

import 'dart:convert';

Acudiente acudienteFromJson(String str) => Acudiente.fromJson(json.decode(str));

String acudienteToJson(Acudiente data) => json.encode(data.toJson());

class Acudiente {
    String nombre;
    String apellido;
    int id;
    String rolAcudiente;
    String telefono;
    String direccion;

    Acudiente({
        this.nombre,
        this.apellido,
        this.id,
        this.rolAcudiente,
        this.telefono,
        this.direccion,
    });

    factory Acudiente.fromJson(Map<String, dynamic> json) => Acudiente(
        nombre: json["nombre"],
        apellido: json["apellido"],
        id: json["id"],
        rolAcudiente: json["rolAcudiente"],
        telefono: json["telefono"],
        direccion: json["direccion"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "id": id,
        "rolAcudiente": rolAcudiente,
        "telefono": telefono,
        "direccion": direccion,
    };
}
