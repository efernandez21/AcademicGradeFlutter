import 'package:flutter/material.dart';

// import 'package:academic_grade/src/widgets/card_swiper.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Propiedades de este stataful widget
  String _opcionSeleccionada = 'Escoga su usuario';

  List<String> _usuarios = ['Profesor','Acudiente'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 153, 153, 1.0),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            //Contenedor de la Imagen Inicial
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Image(
                image: AssetImage('assets/img/academic.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Image(
                image: AssetImage('assets/img/grade.png'),
              ),
            ),
            SizedBox(height: 50.0),
            //Contenedor con el icono de usuario
            _cardContainer(),
            Container(
              // color: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: _crearDropdown(),
            ),
            SizedBox(
              height: 10.0,
            ),
            // SizedBox(height: 20.0,),
            _crearBoton(context),
            SizedBox(height: 10.0),
          ],
        ),
      )),
    );
  }

  Widget _crearBoton(BuildContext context) {
    //Creando un boton en este caso un RaisedButton que estilizaremos

    return RaisedButton(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text(
            'Ingresar',
            style: TextStyle(
              color: Color.fromRGBO(0, 102, 102, 1.0),
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          )),
      //En la forma usamos un RoundedRectangleBorder para añadir en este caso un border radius
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 1.0,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: () {
        Navigator.pushReplacementNamed(context, 'user',arguments: _opcionSeleccionada);
      },
    );
  }

  Widget _cardContainer() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Image(
            height: 200.0,
            width: 200.0,
            image: AssetImage('assets/img/avatar.png')
          ),
        ),
      ],
    );
  }

  Widget _crearDropdown() {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButton(
          style: TextStyle(
            color: Color.fromRGBO(51, 204, 204, 1.0),
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          value: _opcionSeleccionada,
          items: getOpcionesDropdown(),
          underline: Container(
            height: 5,
            color: Color.fromRGBO(0, 102, 102, 1.0),
          ),
          icon: Icon(Icons.arrow_drop_down_circle),
          iconSize: 29,
          // iconDisabledColor: Colors.black,
          iconEnabledColor: Color.fromRGBO(51, 204, 204, 1.0),
          focusColor: Colors.black,
          onChanged: ( opt ) {
            setState(() {
              _opcionSeleccionada = opt;
            });
          },
            ),
        // )
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {

    //Si no se especifica el tamaño de la lista esta es dinamica
    List<DropdownMenuItem<String>> lista = new List();

    //Lista de poderes, con el forEach trabajamos cada Item de la lista
    _usuarios.forEach( (usuario){

      lista.add( DropdownMenuItem(
        child: Text(usuario),
        value: usuario,
      ));

    });

    return lista;

  }
  //Código
}
