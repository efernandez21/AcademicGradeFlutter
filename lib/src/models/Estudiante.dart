import 'package:flutter/material.dart';
 
class Estudiante {
  int id;
  String nombre;
  String apellido;
  String fechaNacimiento;
  int edad;
  String genero;

  Estudiante(id, nombre, apellido, fechaNacimiento, genero) {
    this.id = id;
    this.nombre = nombre;
    this.apellido = apellido;
    this.fechaNacimiento = fechaNacimiento;
    this.edad = asignarEdad();
    this.genero = genero;
  }
  int asignarEdad() {
    String fechaNow = new DateTime.now().toString().substring(0, 4);
    String fechaBirth = this.fechaNacimiento.substring(0, 4);
    int yearNow = int.parse(fechaNow);
    int yearBirth = int.parse(fechaBirth);
    int edad = yearNow - yearBirth;
    return edad;
  }

  String toString() {
    return nombre;
  }
}

class Actividad {
  String descripcion;
  String fechaLimite;
  String asignatura;

  Actividad(descripcion, fechaLimite, asignatura) {
    this.descripcion = descripcion;
    this.fechaLimite = fechaLimite;
    this.asignatura = asignatura;
  }
  String toString() {
    return descripcion + " " + fechaLimite + " " + asignatura;
  }
}