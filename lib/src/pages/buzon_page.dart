import 'package:flutter/material.dart';
import 'package:academic_grade/src/widgets/menu_drawer.dart';

class BuzonPage extends StatefulWidget {
  @override
  _BuzonPageState createState() => _BuzonPageState();
}

class _BuzonPageState extends State<BuzonPage> {
  //Variable de la ubicacion actual
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
          return _verMensajes();
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
  Widget _verMensajes(){
    return  Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Asunto del Mensaje"),
            subtitle: Text("Cuerpo del Mensaje"),
          )
        ],
      ),
    );


  }

  
}