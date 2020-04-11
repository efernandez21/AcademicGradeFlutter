// To parse this JSON data, do
//
//     final estudiante = estudianteFromJson(jsonString);

import 'dart:convert';

Estudiante estudianteFromJson(String str) => Estudiante.fromJson(json.decode(str));

String estudianteToJson(Estudiante data) => json.encode(data.toJson());

class Estudiante {
    String nombre;
    String apellido;
    int identificacion;
    String fechanacimiento;
    int idacudiente;
    int idcurso;
    String genero;

    Estudiante({
        this.nombre,
        this.apellido,
        this.identificacion,
        this.fechanacimiento,
        this.idacudiente,
        this.idcurso,
        this.genero,
    });

    factory Estudiante.fromJson(Map<String, dynamic> json) => Estudiante(
        nombre: json["nombre"],
        apellido: json["apellido"],
        identificacion: json["identificacion"],
        fechanacimiento: json["fechanacimiento"],
        idacudiente: json["idacudiente"],
        idcurso: json["idcurso"],
        genero: json["genero"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "identificacion": identificacion,
        "fechanacimiento": fechanacimiento,
        "idacudiente": idacudiente,
        "idcurso": idcurso,
        "genero": genero,
    };
}
