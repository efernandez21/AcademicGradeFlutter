import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  //String de los argumentos obte
  final String _usuario = ModalRoute.of(context).settings.arguments;

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
                    title: Text(
                      'Bienvenido Carlos',
                      style:
                          TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(_usuario),
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
