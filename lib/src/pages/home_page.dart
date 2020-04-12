import 'package:flutter/material.dart';

import 'package:academic_grade/src/utils/utils.dart' as utils;
import 'package:academic_grade/src/models/Acudiente.dart';
import 'package:academic_grade/src/models/Profesor_model.dart';
import 'package:academic_grade/src/providers/acudiente_provider.dart';
import 'package:academic_grade/src/providers/profesor_provider.dart';
// import 'package:academic_grade/src/widgets/card_swiper.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Propiedades de este stataful widget
  //Llamamos mis dos providers
  final profesorProvider = new ProfesorProvider();
  final acudienteProvider = new AcudienteProvider();
  //Lista de Objetos clase profesor y clase acudiente
  List<Profesor> _profesores = new List();
  List<Acudiente> _acudientes = new List();
  //Elementos de la lista
  List<String> _usuarios = new List();
  String _opcionSeleccionada = 'Profesor Fabio';
  //Booleano que bloqueara el boton
  // bool _cargando = false;

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
            SizedBox(height: 20.0,),
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
        //Nos redirigira a la pagina seleccionada en este caso si es un profesor o es un acudiente
        var argument,ruta;
        int index; 
        //ruta tiene la lista de mi opcion seleccionada
        ruta = utils.encontrarRuta(_opcionSeleccionada);
        // obtenemos la lista de donde fue seleccionado el argumento
        argument = listaSeleccionado(ruta);
        //obtenemos el indice de seleccion
        index = utils.buscarElemento(argument, ruta);
  
        // Navigator.pushNamed(context, _opcionSeleccionada.toLowerCase());
        Navigator.pushReplacementNamed(context, ruta[0].toLowerCase(),arguments: argument[index]);
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

    return FutureBuilder(
      future: cargarInformacion(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        
        if (snapshot.hasData) {
          //Retorno de una fila
          //Realizamos la asignacion de las variables iniciales
          _usuarios = snapshot.data;
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
                    // _cargando = true;
                    _opcionSeleccionada = opt;
                  });
                },
                  ),
              // )
            ],
          );
        } else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
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
  //Crear futureBuilder con la informacion del profesor
  Future<List<String>> cargarInformacion() async{
    //Cargar informacion de profesores y acudientes
    _profesores = await profesorProvider.cargarProfesores();
    _acudientes = await acudienteProvider.cargarAcudientes();

    List<String> usuariosTemp = new List();
    _profesores.forEach((profesor){

      usuariosTemp.add('Profesor ${profesor.nombre}');

    });
    //añadido a las listas
    _acudientes.forEach((acudiente){
      usuariosTemp.add('Acudiente ${acudiente.nombre}');
    });

    return usuariosTemp;
    
  }
  //retornar el argumento
   List listaSeleccionado(List<String> lista){
    //Comprobamos de que tipo es la lista
    if(lista[0] == 'Profesor'){
      return _profesores;    
    } else {
      return _acudientes;
    }
  }
  
  
}
