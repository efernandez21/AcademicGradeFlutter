import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Retornamos un Drawer que es mi widget del menu lateral o como un sidebar en programacion web, de tal forma que, dentro contiene un child, que en este caso ubicaremos como un ListView esto debido a las opciones que se puedan tener a futuro y ademas toque hacer scroll
    //En el padding el EdgeInsets.zero me permite que en este caso el elemento imagen inicie desde arriba
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            //alto de la imagen en este caso el contenedor que contiene el Drawer
            height: 250.0,
            child: DrawerHeader(
              //Contenedor general de la imagen
              child: Container(
                child: Column(
                  children: <Widget>[
                    _avatar()
                  ],
                ),
              ),
              decoration: BoxDecoration(
                // border: Border.all(color:Colors.red),
                 image: DecorationImage(
                   image: AssetImage('assets/img/menu-img.jpg'),
                   fit: BoxFit.cover
                 )
              ),
            ),
          ),
          
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue,),
            title: Text('Principal'),
            onTap: () => Navigator.of(context).pop() 
          ),
          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.blue,),
            title: Text('Enviados'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue,),
            title: Text('Eliminados'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue,),
            title: Text('Settings'),
            //El pushReplacementName me permite cambiar mi raiz, esto me envia a la pagina y me quita la posibilidad de regresar aca, recomendado para los login
            onTap: () => Navigator.pushReplacementNamed(context, 'home')
          ),

        ],
      ),
    );
  }

  Widget _avatar(){

    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(20.0), 
            child: ClipRRect(
              child: CircleAvatar(
                radius: 45.0,
                  child:Image(
                    image: AssetImage('assets/img/estudiante.png'),
                    fit: BoxFit.contain
                  ),
              ),
            ),
        ),
        Center(
          child: Text(
            'carlos213@gmail.com',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold
            ),
          ),
        )              
        
      ],
    );
  }
  
}