import 'package:flutter/material.dart';

class ActividadPage extends StatefulWidget {
  @override
  _ActividadPageState createState() => _ActividadPageState();
}

class _ActividadPageState extends State<ActividadPage> {
  //Clave global del formulario para manejar 
  final formKey = GlobalKey<FormState>();
  //Clave global del scaffold 
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _disponibilidad = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: formKey,
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
                _crearDescripcion(),
                _crearDisponible(),
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
        labelText: 'Fecha de entrega'
      ),
      // onSaved: ( value ) => producto.titulo = value,
      //Se puede hacer la validacion del campo del formulario en este caso se recibe un String
      validator: (value) {
        //Presentamos la condicion de longitud, si retornamos un String se entiende entonces que tenemos un error, si el retorno es un null, todo bien con mi campo del formulario
        if(value.length <3){
          return 'Ingrese el Nombre del Producto';
        } else{
          return null;
        }
      },
    );

  }

  Widget _crearDescripcion(){
    //La propiedad onSaved se ejecutara cuando la validacion se haya hecho exitosamente, en resumen el valor recibido se almacenara en la instancia del modelo
    return TextFormField(
      // initialValue: producto.valor.toString(),
      //Indicamos el tipo de texto que se obtendra en la casilla, en este caso un numero con opciones de decimal, para los teclados numericos que vienen sin un punto
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Descripción de la actividad'
      ),
      // onSaved: ( value ) => producto.valor = double.parse(value),
      // validator: ( value ){
      //   //usamos el metodo creado en utils, para comprobar si es numerico
      //   if ( utils.isNumeric(value) ){
      //     return null;
      //   } else{
      //     return 'Sólo números';
      //   }

      // },
    );

  }

  Widget _crearDisponible(){
    //Switch que me indica la disponibilidad del producto
    return SwitchListTile(
      value: _disponibilidad,
      title: Text('Disponible'), 
      activeColor: Theme.of(context).primaryColor,
      onChanged: ( value ) => setState((){
        _disponibilidad = value;
      }),
    );

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
      onPressed: (){},
    );
  }
  //Funcion de guardado de la informacion
  void _submit() async{

    //Usamos la llave del formulario para combrobar su estado actual de validacion, en este caso para permitir el envio d informacion, usamos una condicion falsa para que en este caso no entre a mi submit, o por asi decirlo no envie
    //Si no es verdadero entonces returne
    if( !formKey.currentState.validate() ) return;
    //Para controlar que se pueda ejecutar los saves del formulario tenemos que invocar su estado actual y ejecutar luego el save, asi tomaremos los valores colocados en los textformfile
    formKey.currentState.save();
    //ESTAMOS GUARDANDO
    
    
    //Hemos terminado de guardar pero bloquearemos el boton en este caso para no tener problemas mas adelante
    // setState(() { _guardando = false; });
    mostrarSnackbar('Registro Guardado');
    //Salimos de la pagina
    Navigator.pop(context);
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
      duration: Duration( milliseconds: 1500),
    );
    //llamamos o mostramos el sncakbar
    // scaffoldKey.currentState.showSnackBar(snackbar);
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