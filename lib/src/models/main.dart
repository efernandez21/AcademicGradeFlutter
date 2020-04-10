

import 'package:academic_grade/src/models/Actividad_model.dart';
import 'package:academic_grade/src/models/Acudiente.dart';
import 'package:academic_grade/src/models/Asignatura.dart';
import 'package:academic_grade/src/models/Curso.dart';
import 'package:academic_grade/src/models/Estudiante.dart';
import 'package:academic_grade/src/models/Mensaje.dart';
import 'package:academic_grade/src/models/Profesor.dart';
import 'package:academic_grade/src/models/Selector.dart';

main(){
  List<Estudiante> alumnosc1 = new List();
  List<Actividad> actividadc1 = new List();
  List<Estudiante> alumnosc2 = new List();
  List<Actividad> actividadc2 = new List();
  //Se agregaron a base de datos firebase
  // Asignatura as1 = new Asignatura(1,"Matematicas");
  // Asignatura as2 = new Asignatura(2,"Lengua Castellana");
  // Asignatura as3 = new Asignatura(3,"Biologia");
  //Agregacion del profesor en base de datos listo en base de datos
  Profesor p1 = new Profesor(1,"Luis","Florez");
  Profesor p2 = new Profesor(2,"Fabio","Carillo");
  Curso c1 = new Curso(1,3,"A",3,p1,alumnosc1,actividadc1);
  Curso c2 = new Curso(2,3,"B",3,p2,alumnosc2,actividadc2);
  //Acudiente informacion agregada a firebase
  Acudiente ac1 = new Acudiente(1,"Juan","Perez","Calle 12 #13-21","3214594163","Padre");
  Acudiente ac2 = new Acudiente(2,"Andres","Gonzalez","Calle 15 #23-21","3204194163","Padre");
  Acudiente ac3 = new Acudiente(3,"Juana","Rodriguez","Calle 13 #13-11","3104194163","Madre"); 
  //Estudiantes lista agregadas a firebase
  Estudiante e1 = new Estudiante(1,"Juan","Martinez","12-03-2010","Masculino",ac1,c1);
  Estudiante e2 = new Estudiante(2,"Pedro","Martinez","12-03-2011","Masculino",ac1,c1);
  Estudiante e3 = new Estudiante(3,"Mathias","Martinez","12-03-2010","Masculino",ac2,c2);
  Estudiante e4 = new Estudiante(4,"Alejandro","Martinez","13-04-2011","Masculino",ac1,c1);
  Estudiante e5 = new Estudiante(5,"Andrea","Martinez","21-04-2009","Femenino",ac2,c2);
  Estudiante e6 = new Estudiante(6,"Daniela","Martinez","19-12-2013","Femenino",ac3,c1);
  //Actividades asignadas agregadas en firebase
  // Actividad act1 = new Actividad("realizar ejercicios de triangulos","2020-04-15",as1);
  // Actividad act2 = new Actividad("realizar ejercicios de cuadrados","2020-04-16",as2);
  // Actividad act3 = new Actividad("realizar ejercicios de metros","2020-04-17",as3);
  // Actividad act4 = new Actividad("dibujar la celula animal","2020-04-18",as2);
  // Actividad act5 = new Actividad("dibujar mapa de colombia","2020-04-21",as1);
  //Curso1
  List<Estudiante> estudiantes = new List();
  estudiantes.add(e1);
  estudiantes.add(e2);
  estudiantes.add(e3);
  estudiantes.add(e4);
  estudiantes.add(e5);
  estudiantes.add(e6);
  c1.agregarAlumno(estudiantes);
  c2.agregarAlumno(estudiantes);
  print(c1.alumnos);
  print(c2.alumnos);
  // c1.asignarActividad(act1);
  // c1.asignarActividad(act2);
  // c1.asignarActividad(act4);

  // c2.asignarActividad(act3);
  // c2.asignarActividad(act5);
  
  List<Curso> cc1 = new List();
  cc1.add(c1);
  cc1.add(c2);
  Selector s1 = new Selector(cc1,ac2);
  List<Mensaje> mensajes = s1.llenarBuzon();
  print(mensajes);

  
}
