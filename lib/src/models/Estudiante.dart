import 'package:academic_grade/src/models/Acudiente.dart';
import 'package:academic_grade/src/models/Curso.dart';

class Estudiante {
  int idEstudiante;
  String nombre;
  String apellido;
  String fechaNacimiento;
  int edad;
  String genero;
  Acudiente acudiente;
  Curso curso;

  Estudiante(int id,String nombre,String apellido,String fechaNacimiento,String genero,Acudiente acudiente,Curso curso) {
    this.idEstudiante = id;
    this.nombre = nombre;
    this.apellido = apellido;
    this.fechaNacimiento = fechaNacimiento;
    this.edad = asignarEdad();
    this.genero = genero;
    this.acudiente = acudiente;
    this.curso = curso;
  }
  int asignarEdad() {
    String fechaNow = new DateTime.now().toString().substring(0,4);
    String fechaBirth = this.fechaNacimiento.substring(6, 10);
    int yearNow = int.parse(fechaNow);
    int yearBirth = int.parse(fechaBirth);
    int edad = yearNow - yearBirth;
    return edad;
  }

  String toString() {
    return nombre;
  }
}
