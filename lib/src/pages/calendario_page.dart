
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class CalendarioPage extends StatefulWidget {

  @override
  _CalendarioPageState createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: TableCalendar(calendarController: _controller))
        ],
      )
    );
  }
}