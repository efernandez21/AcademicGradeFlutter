

import 'package:academic_grade/src/models/Actividad.dart';
import 'package:academic_grade/src/models/Acudiente.dart';
import 'package:academic_grade/src/models/Asignatura.dart';
import 'package:academic_grade/src/models/Curso.dart';
import 'package:academic_grade/src/models/Estudiante.dart';
import 'package:academic_grade/src/models/Mensaje.dart';
import 'package:academic_grade/src/models/Profesor.dart';
import 'package:academic_grade/src/models/Selector.dart';

main(){
Asignatura as1 = new Asignatura(1,"Matematicas");
Asignatura as2 = new Asignatura(2,"Lengua Castellana");
Asignatura as3 = new Asignatura(3,"Biologia");
Profesor p1 = new Profesor(1,"Luis","Florez");
Profesor p2 = new Profesor(2,"Fabio","Carillo");
Acudiente ac1 = new Acudiente(1,"Juan","Perez","Calle 12 #13-21","3214594163","Padre");
Acudiente ac2 = new Acudiente(2,"Andres","Gonzalez","Calle 15 #23-21","3204194163","Padre");
Acudiente ac3 = new Acudiente(3,"Juana","Rodriguez","Calle 13 #13-11","3104194163","Madre"); 
Estudiante e1 = new Estudiante(1,"Juan","Martinez","12-03-2010","Masculino",ac1);
Estudiante e2 = new Estudiante(2,"Pedro","Martinez","12-03-2011","Masculino",ac1);
Estudiante e3 = new Estudiante(3,"Mathias","Martinez","12-03-2010","Masculino",ac2);
Estudiante e4 = new Estudiante(4,"Alejandro","Martinez","13-04-2011","Masculino",ac1);
Estudiante e5 = new Estudiante(5,"Andrea","Martinez","21-04-2009","Femenino",ac2);
Estudiante e6 = new Estudiante(6,"Daniela","Martinez","19-12-2013","Femenino",ac3);
Actividad act1 = new Actividad("realizar ejercicios de triangulos","2020-04-15",as1);
Actividad act2 = new Actividad("realizar ejercicios de cuadrados","2020-04-16",as2);
Actividad act3 = new Actividad("realizar ejercicios de metros","2020-04-17",as3);
Actividad act4 = new Actividad("dibujar la celula animal","2020-04-18",as2);
Actividad act5 = new Actividad("dibujar mapa de colombia","2020-04-21",as1);
List<Estudiante> alumnosc1 = new List();
List<Actividad> actividadc1 = new List();
List<Estudiante> alumnosc2 = new List();
List<Actividad> actividadc2 = new List();
Curso c1 = new Curso(3,"A",3,p1,alumnosc1,actividadc1);
Curso c2 = new Curso(3,"B",3,p2,alumnosc2,actividadc2);
c1.agregarAlumno(e1);
c2.agregarAlumno(e2);
c1.agregarAlumno(e3);
c2.agregarAlumno(e4);
c1.agregarAlumno(e5);
c2.agregarAlumno(e6);
c1.asignarActividad(act1);
c1.asignarActividad(act2);
c2.asignarActividad(act3);
c1.asignarActividad(act4);
c2.asignarActividad(act5);
List<Curso> cc1 = new List();
cc1.add(c1);
cc1.add(c2);
Selector s1 = new Selector(cc1,ac2);
List<Mensaje> mensajes = s1.llenarBuzon();
print(mensajes);

  
}
