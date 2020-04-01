import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //Columna general
          child: Column(
            children: <Widget>[
              // SizedBox(height: 20.0),
              //Contenedor de la parte principal de un appbar
              Container(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  decoration:
                      BoxDecoration(
                        border: Border.all(
                          color: Colors.blue
                        ),
                        color: Colors.blue
                      ),
                  child: ListTile(
                    leading: Icon(
                      Icons.arrow_back,
                      size: 50.0,
                    ),
                    title: Text(
                      'Bienvenido Carlos',
                      style:
                          TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Estudiante'),
                    trailing:
                        Image(
                          image: AssetImage('assets/img/profesor1.png')
                        ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
              ),
              //Contenedor de la columna de opciones
              _opcionesMenu(context),
              
            ],
          ),
        ),
      ),
      floatingActionButton: _crearBotonFloat(context),
    );
  }

  Widget _crearBotonFloat(context){
    return Row(
      children: <Widget>[
        SizedBox(width: 35.0,),
        FloatingActionButton.extended(
          label: Text('Cerrar sesión'),
          icon: Icon(Icons.exit_to_app),
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.pop(context);
          }, 
        )
      ],
    );
  }

  Widget _opcionesMenu(BuildContext context){
    //Contiene la lista de las opciones del menu
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0,),
          //Primera opcion
          _opcionMenu('assets/img/libro.png', 'Asignaturas',context),
          SizedBox(height: 10.0,),
          _opcionMenu('assets/img/calendario.png', 'Calendario',context),
          SizedBox(height: 10.0,),
          _opcionMenu('assets/img/mensaje.png', 'Mensajeria',context),
        ],
      ),
    );
  }
  Widget _opcionMenu(String ruta, String texto, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, texto.toLowerCase());
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image(
              image: AssetImage(ruta),
              height: 100.0,
              width: 100.0,
            ),
            Text(
              texto,
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromRGBO(51, 146, 136, 1.0)
              ),

            ),
          ],
        ),
      ),
    );
  }


}
