import 'package:flutter/material.dart';

import 'package:academic_grade/src/utils/utils.dart' as utils;
import 'package:academic_grade/src/models/Actividad_model.dart';
import 'package:academic_grade/src/models/Acudiente.dart';
import 'package:academic_grade/src/providers/actividades_provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/src/rendering/box.dart';
class CalendarioPage extends StatefulWidget {

  @override
  _CalendarioPageState createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  final _actividadProvider = ActividadesProvider();
  Acudiente _usuario;
  //Declaramos el controlador del calendario
  CalendarController _controller;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  //Declaramos un mapa de eventos
  Map<DateTime,List<dynamic>> _events;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
    //Inicializamos los eventos
    _events = {
    };
    //Definimos la lista de eventos como vacia
    _selectedEvents = [];
  }
  @override
  Widget build(BuildContext context) {
    _usuario = ModalRoute.of(context).settings.arguments;
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
      body: _listarCalendario(),
      
    );
  }
  Widget _listarCalendario() {

    return FutureBuilder(
      future: _actividadProvider.cargarActividades(),
      builder: (BuildContext context, AsyncSnapshot<List<Actividad>> snapshot) {
        //Comprobamos si hay data
        if(snapshot.hasData){
          //Cargamos las actividades
          final actividades = snapshot.data;

          _events = _cargarEventos(actividades);
           return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[ 
                  TableCalendar(
                    events: _events,
                    headerStyle: HeaderStyle(
                      centerHeaderTitle: true,
                      formatButtonVisible: false,
                    ),
                    calendarStyle: CalendarStyle(
                      todayColor: Colors.red,
                      selectedColor: Theme.of(context).primaryColor,
                      todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white,
                      )
                    ),
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    //El dia seleccionado trae una fecha y un evento
                    onDaySelected: (date, events){
                      setState(() {
                        _selectedEvents = events;
                      });
                      print(date);
                      print(_controller.selectedDay);
                    },
                    calendarController: _controller
                  ),
                  ... _selectedEvents.map( (event) => ListTile(
                    title: Text(event),
                  )),
                  Divider()
                  
                  // Center(
                  //   child: Container(
                  //     padding: EdgeInsets.all(15.0),
                  //     height: 300,
                  //     child: _crearListado(),
                  //   ),
                  // )
                  
              ],
            ),
          );

        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

       
      },
    );

  }
  //Eventos cargar
  Map<DateTime,List<dynamic>> _cargarEventos(List<Actividad> actividades){
    //creamos una nueva variable
    var eventos = Map<DateTime,List<dynamic>>();
    actividades.forEach((actividad){
      eventos[utils.deStringDatetime(actividad.fecha)] = [actividad.descripcion];
      //Agregacion de elementos
      _events.addAll(eventos);
    });

    return _events;
  }
}
  // Widget _crearListado(){
  //   //En este caso es un futureBuilder, tenemos que enviarle los datos que recibira por parte de un metodo future builder
  //   return FutureBuilder(
  //     future: _actividadProvider.cargarActividades(),
  //     builder: (BuildContext context, AsyncSnapshot<List<Actividad>> snapshot) {
  //       //Condicionamos el retorno en este caso si hemos obtenido datos
  //       if(snapshot.hasData){
  //         //Variable que almacena los datos
  //         final actividades = snapshot.data;

  //         //asignamos la creacion del item en un metodo, y le mandamos el producto que es una instancia de mi model
  //         return ListView.builder(
  //           itemCount: actividades.length,
  //           itemBuilder: (context,index) =>_verMensaje(context,actividades[index])
  //         );

  //       } else{
          
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }
  //     },
  //   );
  // }
  Widget _verMensaje(BuildContext context,Actividad actividad){
    return  Card(
      child: Column(
        children: <Widget>[
          SizedBox(height:10.0),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('${ actividad.descripcion} '),
            subtitle: Text(actividad.fecha),
          )
        ],
      ),
    );


  }
  

