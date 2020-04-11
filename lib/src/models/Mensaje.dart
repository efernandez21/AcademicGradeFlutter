// To parse this JSON data, do
//
//     final mensaje = mensajeFromJson(jsonString);

import 'dart:convert';

Mensaje mensajeFromJson(String str) => Mensaje.fromJson(json.decode(str));

String mensajeToJson(Mensaje data) => json.encode(data.toJson());

class Mensaje {
    String asunto;
    String cuerpo;
    String fechaenvio;
    bool leido;
    String idmensaje;

    Mensaje({
        this.asunto,
        this.cuerpo,
        this.fechaenvio,
        this.leido,
        this.idmensaje,
    });

    factory Mensaje.fromJson(Map<String, dynamic> json) => Mensaje(
        asunto: json["asunto"],
        cuerpo: json["cuerpo"],
        fechaenvio: json["fechaenvio"],
        leido: json["leido"],
        idmensaje: json["idmensaje"],
    );

    Map<String, dynamic> toJson() => {
        "asunto": asunto,
        "cuerpo": cuerpo,
        "fechaenvio": fechaenvio,
        "leido": leido,
        "idmensaje": idmensaje,
    };
}
