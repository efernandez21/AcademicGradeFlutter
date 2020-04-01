import 'package:flutter/material.dart';

class AsignaturasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asignaturas'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            _itemAsignatura('Matemáticas', context),
            Divider(),
            _itemAsignatura('Biología', context),
            Divider(),
            _itemAsignatura('Física', context),
            Divider(),
            _itemAsignatura('Ciencias Sociales', context),
            Divider(),
            _itemAsignatura('Salud', context),
            Divider(),
            _itemAsignatura('Artes', context),
            Divider(),

          ],
        ),
      ),
    );
  }

  Widget _itemAsignatura(String asignatura, BuildContext context) {
    //Contenedores almacenados en variables
    return ListTile(
      leading: Icon(
        Icons.book,
        color: Colors.green,
      ),
      title: Text(asignatura),
      trailing: Icon(
        Icons.forward,
        color: Color.fromRGBO(51, 146, 136, 1.0),
      ),
      onTap: (){
        Navigator.pushNamed(context, 'asignatura', arguments: asignatura);
      },
    );



  }




}