import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  //String de los argumentos obte
  final String _usuario = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
          //Columna general
          slivers: <Widget>[
            _crearAppbar(),
            SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10.0),
                _opcionesMenu(context),
                SizedBox(height: 10.0),
                SizedBox(height: 10.0),
                SizedBox(height: 10.0),
                SizedBox(height: 10.0),
              ]
            ),
          ),
          ],
          
        ),
        floatingActionButton: _crearBotonFloat(context),
    );
  }
  Widget _crearAppbar(){
    //Creamos una SliverAppBar que trabajara con el scroll que se haya realizado en pantalla
    //pinned en true permite que la barra se mantenga visible cuando se haga el scroll
    //flexibleSpace es un widget que se adaptara a la SliverAppBar
    return SliverAppBar(
      elevation: 2.0,
      actions: <Widget>[
        //Fila para 
        Row(
          children: <Widget>[
            Image(
              image: AssetImage('assets/img/profesor1.png')
            ),
          ],
        ),
      ],
      expandedHeight: 150.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text(
          'Bienvenido Carlos',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        //link del placeholder: AssetImage('assets/img/loading.gif'),
        background: FadeInImage(
          image: NetworkImage('https://www.bbva.com/wp-content/uploads/2017/11/iceberg-recurso-fondo-de-comercio-bbva-1024x416.jpg'),
          placeholder: AssetImage('assets/img/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
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
