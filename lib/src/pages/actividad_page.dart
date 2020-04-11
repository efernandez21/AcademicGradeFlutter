import 'package:academic_grade/src/models/Profesor_model.dart';
import 'package:academic_grade/src/providers/curso_provider.dart';
import 'package:flutter/material.dart';

import 'package:academic_grade/src/utils/utils.dart' as utils;

import 'package:academic_grade/src/models/Actividad_model.dart';
import 'package:academic_grade/src/models/Asignatura.dart';
import 'package:academic_grade/src/providers/actividades_provider.dart';
import 'package:academic_grade/src/providers/asignatura_provider.dart';


class ActividadPage extends StatefulWidget {
  @override
  _ActividadPageState createState() => _ActividadPageState();
}

class _ActividadPageState extends State<ActividadPage> {
  // declaracion del usuario de la pantalla
   Profesor _usuario;
  //Clave global del formulario para manejar 
  final formKey = GlobalKey<FormState>();
  //Clave global del scaffold 
  final scaffoldKey = GlobalKey<ScaffoldState>();
  //Llamamos los provider de mis modelos
  final actividadProvider = new ActividadesProvider();
  final asignaturaProvider = new AsignaturaProvider();
  final cursoProvider = new CursoProvider();
  //Llamado a mi modelo
  Actividad actividad = new Actividad();
  String _opcionSeleccionada = "Matematicas";
  int _materiaSeleccionada = 1;
  //Variable booleana para indicar el guardado de una aplicacion
  bool _guardando = false;

  @override
  Widget build(BuildContext context) {
    //recibimos los datos de la pantalla anterior
    _usuario = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Nueva Actividad'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          //Todos los campos pertenecientes al formulario pueden ser validados
          child: Form(
            //Identificador unico del formulario
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearFecha(),
                SizedBox(height: 15.0),
                _crearDescripcion(),
                SizedBox(height: 15.0),
                _crearDropdown(),
                SizedBox(height: 15.0),
                _crearBoton()
              ],
            ),
          ),
        ),
      ),
    );
  }
  //Metodos para implementacion
  Widget _crearFecha(){
    //Retornamos un TextFormField, trabaja directamente con un formulario
    return TextFormField(
      // initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Fecha de entrega',
        hintText: 'Ingrese una fecha en formato dd/mm/aaaa'
      ),
      onSaved: ( value ) => actividad.fecha = value,
      //Se puede hacer la validacion del campo del formulario en este caso se recibe un String
    );

  }

  Widget _crearDescripcion(){
    //La propiedad onSaved se ejecutara cuando la validacion se haya hecho exitosamente, en resumen el valor recibido se almacenara en la instancia del modelo
    return TextFormField(
      // initialValue: producto.valor.toString(),
      //Indicamos el tipo de texto que se obtendra en la casilla, en este caso un numero con opciones de decimal, para los teclados numericos que vienen sin un punto
      textCapitalization: TextCapitalization.sentences,
      maxLines: 6,
      decoration: InputDecoration(
        labelText: 'Descripción de la actividad',
        hintText: 'Escriba la instruccion a realizar en la actividad sea especifico, si lo desea, si lo desea coloque una imagen',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.zero)
        )
      ),
      onSaved: ( value ) => actividad.descripcion = value,
    );

  }
  //Widget Dropdown para las materias
  Widget _crearDropdown() {
    return FutureBuilder(
      future: asignaturaProvider.cargarAsignaturas(),
      builder: (BuildContext context, AsyncSnapshot<List<Asignatura>> snapshot) {
        //Si tenemos los datos retornamos la barra si no
        if (snapshot.hasData) {
          final asignaturas = snapshot.data;
          return DropdownButtonFormField(
            decoration: InputDecoration(
              labelText: "Seleccione la materia:",
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              helperText: "Materia a la que pertenecera la actividad"
            ),
            items: getOpcionesDropdown(asignaturas),
            value: _opcionSeleccionada, 
            onChanged: (opcion){
              setState(() {
                //Agregamos la opcion y obtenemos el id
                _opcionSeleccionada = opcion;
                _materiaSeleccionada = utils.idMateriaSeleccionada( asignaturas, _opcionSeleccionada);
                // print(_materiaSeleccionada);
              });
            },
            onSaved: (value) => actividad.idasignatura = _materiaSeleccionada,
          );

        } else {
          return Text("Seleccione la Materia correspondiente");
        }

      },
    );
  }
  //La lista
  List<DropdownMenuItem<String>> getOpcionesDropdown(List<Asignatura> asignaturas) {
    //Declaramos una lista de Strings
    List<DropdownMenuItem<String>> lista = new List();
    //Revisamos la asignatura
    asignaturas.forEach( (asignatura){
      //Agregamos a mi lista de Strings el DropdownIten
      lista.add( DropdownMenuItem(
        child: Text(asignatura.nombre),
        value: asignatura.nombre,
      ));

      
    });
    return lista;

  }

  Widget _crearBoton(){
    //Creamos el boton de guardar, pero como un raisedButton
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: (_guardando)? null :  _submit,
    );
  }
  //Funcion de guardado de la informacion
  void _submit() async{

    //Usamos la llave del formulario para combrobar su estado actual de validacion, en este caso para permitir el envio d informacion, usamos una condicion falsa para que en este caso no entre a mi submit, o por asi decirlo no envie
    //Si no es verdadero entonces returne
    // if( !formKey.currentState.validate() ) return;
    // //Para controlar que se pueda ejecutar los saves del formulario tenemos que invocar su estado actual y ejecutar luego el save, asi tomaremos los valores colocados en los textformfile
    formKey.currentState.save();
    // print("================");
    // print(actividad.descripcion);
    // print(actividad.fecha);
    // print(actividad.idasignatura);
    // print("================");
    //ESTAMOS GUARDANDO
    setState(() { _guardando = true; });
    //Condicionamos la creacion o actualizacion de un producto
    if (actividad.idactividad == null) {
      //Creamos la actividad
      String act;
      int curso;
      //asignacion del creador de la actividad
      actividad.idprofesor = _usuario.id;
      //creada la actividad
      actividadProvider.crearActividad(actividad);
      //obtenemos el curso pasandole el identificador del profesor
      curso = await cursoProvider.obtenerCurso(_usuario.id);
      act = await actividadProvider.obtenerActividad(_usuario.id, actividad.descripcion,actividad.idasignatura);
      //creamos la actividad al curso
      cursoProvider.crearActividadenCurso(act, curso);
      

    } else {
      actividadProvider.editarActividad(actividad);
    }
    
    //Hemos terminado de guardar pero bloquearemos el boton en este caso para no tener problemas mas adelante
    // setState(() { _guardando = false; });
    mostrarSnackbar('Registro Guardado');
    //Salimos de la pagina actual
    // Navigator.pop(context);
  }
  //Metodo para trabajar con un SnackBar, a la que le pasaremos un mensaje, hay que tener en cuenta que para representarlo se necesita el Scaffold para poder mostrarlo
  void mostrarSnackbar(String mensaje) {
    //Creamos un final con un SnackBar en este caso content sera un text que representara el contenido de este snackbar, lo personalizamos un poco
    final snackbar = SnackBar(
      content: Text(
        mensaje,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green,
      duration: Duration( milliseconds: 2500),
    );
    //llamamos o mostramos el sncakbar
    scaffoldKey.currentState.showSnackBar(snackbar);
  }
  //Widget que mostrara la foto en la pantalla del producto
  Widget _mostrarFoto() {
    //Imagen defecto
    return Image(
      image: AssetImage('assets/img/no-image.png')
    );

  }
  // //Metodos para seleccionar la foto de la galeria
  // _seleccionarFoto() async{
  //   //Trabajando con la libreria, en este caso para acceder a esta me pide una fuente
  //   _procesarImagen(ImageSource.gallery);
  // }
  // //Metodo para tomar la foto
  // _tomarFoto() async{
  //   //Procesamiento de la foto
  //   _procesarImagen(ImageSource.camera);  
  // }
  // //Optimizacion al proceso del llamado del proceso de la imagen
  // _procesarImagen(ImageSource origen) async{
  //   //Usando el pickImage pedimos la informacion en este caso de un origen que puede ser la camara o la galeria de archivos
  //   foto = await ImagePicker.pickImage(
  //     source: origen
  //   );
  //   //Creamos una condicion para manejar el estado de la foto, en este caso si no seleccionamos en este caso para redibujar una nueva foto
  //   if( foto != null){
  //     producto.fotoUrl=null;
  //   }
  //   setState(() {});
  // }




}