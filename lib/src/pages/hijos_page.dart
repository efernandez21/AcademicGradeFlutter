import 'package:flutter/material.dart';

import 'package:academic_grade/src/models/Estudiante_model.dart';
import 'package:academic_grade/src/providers/estudiantes_provider.dart';
import 'package:academic_grade/src/models/Acudiente.dart';


class HijosPage extends StatelessWidget {

  //Trabajando tipografias
  Acudiente _acudiente;
  final estudiantesProvider = new EstudianteProvider();
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    //Obteniendo los datos pasados por los arguments
    _acudiente = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hijos Matriculados'),
      ),
      body: _cargarEstudiantes(),
    );
  }

  Widget _cargarEstudiantes(){

    return FutureBuilder(
      future: estudiantesProvider.cargarHijos(),
      builder: (BuildContext context, AsyncSnapshot<List<Estudiante>> snapshot) {
        //Condicion evaluada
        if(snapshot.hasData){
          //Estudiantes
          final estudiantes = snapshot.data;
          //Retorna los hijos
          return ListView.builder(
            itemCount: estudiantes.length,
            itemBuilder: (context,index) =>_cardHijo(context,estudiantes[index])
          );

        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );


  }
  Widget _cardHijo(BuildContext context,Estudiante estudiante){

    return Card(
        child: Column(
          children: <Widget>[
            //Imagen Opcional en este caso controlada con el operador ternario
              // ? Image(image: AssetImage('assets/no-image.png'))
              ListTile(
                leading: Image(
                  image: AssetImage('assets/img/estudiante.png') 
                ),
                title: Text('${ estudiante.nombre}  ${estudiante.apellido}'),
                subtitle: Text('Estudiante perteneciente al Grado 3A'),
                //Pasamos a la otra pantalla y le entregamos el producto completo
                // onTap: () => Navigator.pushNamed(context, 'actividad', arguments: actividad),
              ),

          ],
        ),
      );

  }



}