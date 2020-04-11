import 'package:academic_grade/src/models/Mensaje.dart';
import 'package:flutter/material.dart';
import 'package:academic_grade/src/widgets/menu_drawer.dart';
import 'package:academic_grade/src/providers/mensaje_provider.dart';

class BuzonPage extends StatefulWidget {
  @override
  _BuzonPageState createState() => _BuzonPageState();
}

class _BuzonPageState extends State<BuzonPage> {
  //Variable de la ubicacion actual
  final mensajeProvider = new MensajeProvider() ;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.menu), 
        //   onPressed: () {},
        // ),
        title: Text('Bandeja de Entrada'),
      ),
      drawer: MenuDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 8,
        itemBuilder: (BuildContext context,int index){
          return _crearListado();
        },
      ),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Regresa al menu principal
          Navigator.pop(context);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }

  Widget _crearBottomNavigationBar(){

    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        //Los items deben ser de tipo BottomNavigationBarItem
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          title: Text('Crear Mensaje')
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.delete),
          title: Text('Eliminar Mensaje')
        ),
      ],
      onTap: (index) {
        
        setState(() {
          _currentIndex = index;
        });
      
      },
    );

  }
    Widget _crearListado(){
    //En este caso es un futureBuilder, tenemos que enviarle los datos que recibira por parte de un metodo future builder
    return FutureBuilder(
      future: mensajeProvider.cargarMensajes(),
      builder: (BuildContext context, AsyncSnapshot<List<Mensaje>> snapshot) {
        //Condicionamos el retorno en este caso si hemos obtenido datos
        if(snapshot.hasData){
          //Variable que almacena los datos
          final mensajes = snapshot.data;

          //asignamos la creacion del item en un metodo, y le mandamos el producto que es una instancia de mi model
          return ListView.builder(
            itemCount: mensajes.length,
            itemBuilder: (context,index) =>_verMensaje(context,mensajes[index])
          );

        } else{
          
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  Widget _verMensaje(BuildContext context,Mensaje mensaje){
    return  Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.message),
            title: Text('${ mensaje.asunto} '),
            subtitle: Text("${mensaje.cuerpo}"),
          )
        ],
      ),
    );


  }
  
}