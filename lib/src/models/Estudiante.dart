import 'package:academic_grade/src/models/Acudiente.dart';

class Estudiante {
  int id;
  String nombre;
  String apellido;
  String fechaNacimiento;
  int edad;
  String genero;
  Acudiente acudiente;

  Estudiante(id, nombre, apellido, fechaNacimiento, genero, acudiente) {
    this.id = id;
    this.nombre = nombre;
    this.apellido = apellido;
    this.fechaNacimiento = fechaNacimiento;
    this.edad = asignarEdad();
    this.genero = genero;
    this.acudiente = acudiente;
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
