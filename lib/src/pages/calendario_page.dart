
import 'package:academic_grade/src/models/Actividad_model.dart';
import 'package:academic_grade/src/providers/actividades_provider.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/src/rendering/box.dart';
class CalendarioPage extends StatefulWidget {

  @override
  _CalendarioPageState createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  final _actividadProvider = ActividadesProvider();
  
  
  CalendarController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=CalendarController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actividades Programadas'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.access_time), 
              onPressed: (){},
              focusColor: Colors.red,
            ),
          )
        ],
      ),
      body:Column(
        children: <Widget>[
          Center(
            child: 
            TableCalendar(
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonVisible: false,
              ),
              calendarStyle: CalendarStyle
              (
                todayColor: Colors.red,
                selectedColor: Theme.of(context).primaryColor,
                todayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarController: _controller
            )
            ),
            Center(
              child: _crearListado(),
            )
        ],
      )
    );
  }
    Widget _crearListado(){
    //En este caso es un futureBuilder, tenemos que enviarle los datos que recibira por parte de un metodo future builder
    return FutureBuilder(
      future: _actividadProvider.cargarActividades(),
      builder: (BuildContext context, AsyncSnapshot<List<Actividad>> snapshot) {
        //Condicionamos el retorno en este caso si hemos obtenido datos
        if(snapshot.hasData){
          //Variable que almacena los datos
          final actividades = snapshot.data;

          //asignamos la creacion del item en un metodo, y le mandamos el producto que es una instancia de mi model
          return ListView.builder(
            itemCount: actividades.length,
            itemBuilder: (context,index) =>_verMensaje(context,actividades[index])
          );

        } else{
          
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  Widget _verMensaje(BuildContext context,Actividad actividad){
    return  Card(
      child: Column(
        children: <Widget>[
          SizedBox(height:10.0),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('${ actividad.descripcion} '),
          )
        ],
      ),
    );


  }
  }

