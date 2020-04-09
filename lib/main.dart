import 'package:flutter/material.dart';
//Importaciones paginas
import 'package:academic_grade/src/pages/home_page.dart';
import 'package:academic_grade/src/pages/user_page.dart';
import 'package:academic_grade/src/pages/asignaturas_page.dart';
import 'package:academic_grade/src/pages/buzon_page.dart';
import 'package:academic_grade/src/pages/asignatura_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academic Grades',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home'           : (BuildContext context ) => HomePage(),
        'user'           : (BuildContext context ) => UserPage(),
        'asignaturas'    : (BuildContext context ) => AsignaturasPage(),
        'calendario'     : (BuildContext context ) => AsignaturasPage(),
        'mensajeria'     : (BuildContext context ) => BuzonPage(),
        'asignatura'     : (BuildContext context ) => AsignaturaPage(),
      },
      theme: ThemeData(
        //Muchos elementos toman sus colores del primaryColor tales como el appBar, el floatingActionButton, los botones en el cambio de seleccion, entre otros
        primaryColor: Color.fromRGBO(0, 204, 204, 1.0),
         
      ),
      
    );
  }
}
