import 'package:academic_grade/src/models/Profesor_model.dart';
import 'package:flutter/material.dart';

class ProfesorPage extends StatelessWidget {
  //Declaracion global
  Profesor _usuario;

  @override
  Widget build(BuildContext context) {
    _usuario = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      // appBar: AppBar(
      //   title: _crearAppbar(_usuario.nombre),
      // ),
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
                          color: Colors.green
                        ),
                        color: Colors.green
                      ),
                  child: ListTile(
                    title: Text(
                      'Bienvenido ${_usuario.nombre} ${_usuario.apellido}',
                      style:
                          TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Profesor'),
                    trailing:
                        Image(
                          image: AssetImage('assets/img/profesor1.png')
                        ),
                    onTap: () {
                      // Navigator.pop(context);
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
  //Otros Widgets
  Widget _crearAppbar(String _usuario){
    //Creamos una SliverAppBar que trabajara con el scroll que se haya realizado en pantalla
    //pinned en true permite que la barra se mantenga visible cuando se haga el scroll
    //flexibleSpace es un widget que se adaptara a la SliverAppBar
    return SliverAppBar(
      elevation: 2.0,
      actions: <Widget>[
        //Fila para 
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50.0),
            Container(
              padding: EdgeInsets.only(right: 15.0, top: 5.0),
              child: Image(
                image: AssetImage('assets/img/profesor1.png')
              ),
            )
          ],
        ),
      ],
      expandedHeight: 150.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Column(
          children: <Widget>[
            Text(
              'Bienvenido  Carlos',
              style: TextStyle(color: Color.fromRGBO(0, 102, 102, 1.0), fontSize: 18.0),
            ),
            Text(_usuario)
          ],
        ),
        //El background es un gradiente
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color> [
                Color.fromRGBO(51, 204, 204, 0.5),
                Color.fromRGBO(0, 204, 204, 1.0)
              ]
            )
          ),
        )
      ),
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
            //Volver al inicio
            Navigator.pushReplacementNamed(context, 'home');
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
          _opcionMenu('assets/img/libro.png','Crear Actividades', 'actividad',context),
          SizedBox(height: 10.0,),
          // _opcionMenu('assets/img/calendario.png','Consultar Calendario', 'calendario',context),
          // SizedBox(height: 10.0,),
          _opcionMenu('assets/img/calendario.png','Consultar Actividades', 'programadas',context),
          SizedBox(height: 10.0,),
          _opcionMenu('assets/img/mensaje.png','Enviar Notificaciones', 'mensajeria',context),
          SizedBox(height: 60.0,),
        ],
      ),
    );
  }
  Widget _opcionMenu(String rutaImagen, String texto, String ruta,BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navegando por las demas pantallas
        Navigator.pushNamed(context, ruta, arguments: _usuario);
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image(
              image: AssetImage(rutaImagen),
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