import 'package:flutter/material.dart';
import 'package:academic_grade/src/widgets/menu_drawer.dart';

class BuzonPage extends StatelessWidget {
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
      body: Center(
        child:Text('Buzon Page')
      ),
    );
  }
}