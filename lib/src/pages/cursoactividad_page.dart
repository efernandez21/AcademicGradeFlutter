import 'package:flutter/material.dart';

import 'package:academic_grade/src/models/Actividad_model.dart';
import 'package:academic_grade/src/models/Estudiante_model.dart';
import 'package:academic_grade/src/providers/actividades_provider.dart';
import 'package:academic_grade/src/providers/curso_provider.dart';
import 'package:academic_grade/src/utils/utils.dart' as utils;


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

              return _crearElementoLista(actividades[index],context);

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
  Widget _crearElementoLista(Actividad actividad, BuildContext context){
    final String textoEstilo = actividad.fecha;
    return Column(
      children: <Widget>[
        SizedBox(height: 15.0,),
        ( actividad.fotoUrl == null )
          ? Image(
            image: AssetImage('assets/img/no-image.png'),
            height: 100.0,
          )
          : FadeInImage(
            placeholder: AssetImage('assets/img/jar-loading.gif'),
            image: NetworkImage(actividad.fotoUrl),
            height: 100.0,
            width: double.infinity,
            // fit: BoxFit.contain,
          ),
        Container(
          padding: EdgeInsets.only(top:10.0),
          child: ListTile(
            leading: Icon(
              Icons.assignment,
              color: Colors.blue,
            ),
            title: Text(actividad.descripcion.toUpperCase()),
            subtitle: Row(
              children: <Widget>[
                Text('Fecha de entrega: '),
                Text(textoEstilo, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),)
              ],
            ),
            trailing: Icon(
              Icons.assignment_turned_in,
              color: Colors.yellow,
            ),
            onTap: (){
              utils.mostrarAlerta(context, actividad.descripcion, actividad.fecha);
            },
          ),
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

}