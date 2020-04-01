import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AsignaturaPage extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    //Obteniendo los valores pasados por parametros
    final asignatura = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
         title: Container(
           padding: EdgeInsets.only(top: 20.0),
           child: Text(
              asignatura,
              style: TextStyle(
                fontSize: 30.0
              ),
           ),
         ),
         centerTitle: true,
         
         //Aumentamos el tamaño de la appbar
         bottom: PreferredSize(
           child: Container(),
           preferredSize: Size(30.0, 30.0),
         ),
         
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _itemNotas('Primer'),
              Divider(),
              _itemNotas('Segundo'),
              Divider(),
              _itemNotas('Tercer'),
              Divider(),
              _itemNotas('Cuarto'),
              Divider(),
              _finalNota(),
            ],
          ),
        ),
      ),
      floatingActionButton: _botonesFloating(context,asignatura),
    );
  }
  Widget _itemNotas(String periodo){

    return ListTile(
      title: Text(
        '$periodo Periodo:',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      subtitle: Text('25%'),
      trailing: Text(
        '3.5',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );

  }
  Widget _finalNota(){

    return ListTile(
      leading: Text(
        'Nota Final:',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold
        ),
      ),
      trailing: Text(
        '3.5',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.green
        ),
      ),
    );
  }
  Widget _botonesFloating(BuildContext context, String asignatura) {

    return Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        //widget parecido a un div en html SizedBox, es una pequeña caja transparente, que contiene un ancho
        //el widget Expanded va a estirar lo mas posible a su hijo
        //el child es obligatorio en el Expanded
        SizedBox( width:30.0),
        FloatingActionButton.extended(
          label: Text('Subir Tareas'),
          icon: Icon(Icons.arrow_upward),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => _mostrarAlerta(context, asignatura), 
        ),
        // Expanded(child: SizedBox(),),
        // FloatingActionButton(child: Icon(Icons.remove), onPressed: (){} ),
        // SizedBox( width: 5.0, ),
        // FloatingActionButton(child: Icon(Icons.add), onPressed: (){} ),
      ],
    );
  }
  void _mostrarAlerta(BuildContext context, String asignatura){

    showDialog(
      //el barrierDismissible me permite cerrar el boton de dialogo cuando yo de click afuera en este caso si es true, permitira cerrar y este es el valor por defecto
      context: context,
      barrierDismissible: true,
      builder: (context){
        
        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0) ),
          title: Text('Tarea de $asignatura'),
          content: Column(
            //con mainAxisSize trabajamos con el tamaño de la alerta, de tal forma que con el MainAxisSize.min su tamaño dependera de su contenido interno
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Tarea correspondiente al tema de Ecuaciones Diferenciales'),
              SizedBox(height: 10.0,)
              

            ],
          ),
          actions: <Widget>[
            // el Navigator.of(context).pop permite que se pueda salir con el boton de la forma tradicional
            RaisedButton(
              child: Container(
                child: Text('Subir archivo'),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 0.0,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );

  }
}