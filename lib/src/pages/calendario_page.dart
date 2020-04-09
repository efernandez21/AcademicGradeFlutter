import 'package:flutter/material.dart';

class CalendarioPage extends StatelessWidget {
  
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
          Center(child: Text('Aquí va el calendario'))
        ],
      )
    );
  }
}