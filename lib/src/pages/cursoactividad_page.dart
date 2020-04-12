import 'package:academic_grade/src/models/Actividad_model.dart';
import 'package:academic_grade/src/models/Estudiante_model.dart';
import 'package:academic_grade/src/providers/actividades_provider.dart';
import 'package:academic_grade/src/providers/curso_provider.dart';
import 'package:flutter/material.dart';



class CursoActividadesPage extends StatelessWidget {
  //Nueva clase Estudiante
  Estudiante estudiante = new Estudiante();
  //Providers
  final cursoProvider = new CursoProvider();
  final actividadesProvider = new ActividadesProvider();

  @override
  Widget build(BuildContext context) {
    //Obtenemos el valor de la ruta pasada
    final estudianteData = ModalRoute.of(context).settings.arguments;
    if(estudianteData != null){
      estudiante = estudianteData;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Actividades Asignadas a ${estudiante.nombre}'),
      ),
      body: _listarActividades(),
    );
  }
  //Metodo para cargar las actividades asincronicas de mis providers
  Future<List<Actividad>> actividadesCurso() async{
     List<Actividad> actividades;
     final actividadesLista = await cursoProvider.listarActividadesCurso(estudiante.idcurso);
     actividades = await actividadesProvider.cargarActividadesCurso(actividadesLista);
     return actividades;
  }
  Widget _listarActividades() {
    
    return FutureBuilder(
      future: actividadesCurso(),
      builder: (BuildContext context, AsyncSnapshot<List<Actividad>> snapshot) {
        //Si tenemos datos regresamos entonces lo siguiente
        if(snapshot.hasData){
          //datos obtenidos del
          final actividades = snapshot.data;

          return ListView.builder(
            itemCount: actividades.length,
            itemBuilder: (BuildContext context, int index) {

              return _crearElementoLista(actividades[index]);

            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );

  }
  //Elemento o widget
  Widget _crearElementoLista(Actividad actividad){
    return ListTile(
      leading: Icon(
        Icons.assignment,
        color: Colors.blue,
      ),
      title: Text(actividad.descripcion.toUpperCase()),
      subtitle: Text('Fecha de entrega: ${actividad.fecha}'),
      trailing: Icon(
        Icons.assignment_turned_in,
        color: Colors.yellow,
      ),
    );
  }
}