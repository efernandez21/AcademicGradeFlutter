import 'package:academic_grade/src/models/Actividad_model.dart';
import 'package:academic_grade/src/providers/actividades_provider.dart';
import 'package:academic_grade/src/providers/curso_provider.dart';
import 'package:flutter/material.dart';

class ActividadesProgramadasPage extends StatelessWidget {
  final actividadesProvider = new ActividadesProvider();
  final cursoProvider = new CursoProvider();

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text('Actividades Programadas')
      ),
      body: _crearListado(),
      // floatingActionButton: _crearBoton(context),
    );
  }

  //Metodo para crear el listado
  Widget _crearListado(){
    //En este caso es un futureBuilder, tenemos que enviarle los datos que recibira por parte de un metodo future builder
    return FutureBuilder(
      future: actividadesProvider.cargarActividades(),
      builder: (BuildContext context, AsyncSnapshot<List<Actividad>> snapshot) {
        //Condicionamos el retorno en este caso si hemos obtenido datos
        if(snapshot.hasData){
          //Variable que almacena los datos
          final actividades = snapshot.data;

          //asignamos la creacion del item en un metodo, y le mandamos el producto que es una instancia de mi model
          return ListView.builder(
            itemCount: actividades.length,
            itemBuilder: (context,index) =>_crearItem(context,actividades[index])
          );

        } else{
          
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  //Metodo para crear un item de producto
  Widget _crearItem(BuildContext context, Actividad actividad) {
    //Para manejar la lista como elemento de eliminacion podemos usar un dissmisible, que nos permite indicar una direccion de eliminacion y un metodo para realizarlo
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: ( direccion ){
        //Borrado del producto de la base de datos en firebase
        actividadesProvider.eliminarActividad(actividad.idactividad);
        cursoProvider.eliminarActividadCurso(actividad.idactividad);
      },
      child: Card(
        child: Column(
          children: <Widget>[
            //Imagen Opcional en este caso controlada con el operador ternario
              // ? Image(image: AssetImage('assets/no-image.png'))
              ListTile(
                title: Text('${ actividad.descripcion} '),
                subtitle: Text('Fecha limite de entrega:'+actividad.fecha),
                //Pasamos a la otra pantalla y le entregamos el producto completo
                // onTap: () => Navigator.pushNamed(context, 'producto', arguments: actividad),
              ),

          ],
        ),
      )
    );
  }
  //
  //  ListTile(
  //       title: Text('${ producto.titulo} - ${producto.valor}'),
  //       subtitle: Text(producto.id),
  //       //Pasamos a la otra pantalla y le entregamos el producto completo
  //       onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto),
  //     ),



  //Metodo para crear boton
  _crearBoton(BuildContext context){

    //Retornamos un floating action button para trabajar el cambio de pagina
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'ac')
    );
  }
}