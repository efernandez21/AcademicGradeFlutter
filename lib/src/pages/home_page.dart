import 'package:flutter/material.dart';

import 'package:academic_grade/src/widgets/card_swiper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 136, 124, 1.0),
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
                image: AssetImage('assets/img/logo11.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Image(
                image: AssetImage('assets/img/logo12.png'),
              ),
            ),
            SizedBox(height: 50.0),
            //Contenedor con el icono de usuario
            CardSwiper(),
            Container(
              // color: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Estudiante',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            // SizedBox(height: 20.0,),
            _crearBoton(context)
          ],
        ),
      )),
    );
  }

  //Widget del Boton
  Widget _crearBoton(BuildContext context) {
    //Creando un boton en este caso un RaisedButton que estilizaremos

    return RaisedButton(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text(
            'Ingresar',
            style: TextStyle(
              color: Colors.white,
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
        Navigator.pushNamed(context, 'user');
      },
    );
  }
}
