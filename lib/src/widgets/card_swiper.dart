import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class CardSwiper extends StatelessWidget {
  
  //Creamos una final list y la inicializamos en el constructor como un required, para que en este caso se reciba si o si la lista de peliculas
  //Constructor
  CardSwiper();
  @override
  Widget build(BuildContext context) {
    
    //El Swiper se ubica en un container debido a que es necesario darle los valores de ancho y alto que puede ocupar
    //en el width el double.infinity permite que el contenedor abarque todo el ancho disponible
    //Usamos los media query para obtener informacion de ancho y alto del dispositivo esto para poder trabajar con los diferentes tamaños de los dispositivos
    final _screenSize = MediaQuery.of(context).size;
    // _screenSize.width * 0.7 me indica que trabajaremos con el 70% del ancho de la pantalla, caso muy parecido al _screenSize que me indica que trabajaremos con el 50% del alto de la pantalla disponible, en este caso se aplica a las tarjetas del swiper
    //el itemBuilder es como un foreach de tal forma que este les da un index a cada dato
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Swiper(
          layout: SwiperLayout.TINDER,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.3,
          itemBuilder: (BuildContext context,int index){
            //El ClipRRect permite que la imagen se pueda recortar con bordes redondeados
            //el Boxfit.cover permite que la imagen se adapte a todo el ancho disponible
            return Container(
              child: Column(
                children: <Widget>[
                  //Tarjeta del swipe
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Image(
                      height: 200.0,
                      width: 200.0,
                      image: AssetImage('assets/img/profesor1.png')
                    ),
                  ),
                  // Text('Padre',style: TextStyle( fontSize: 30.0, color: Color.fromRGBO(10, 110, 99, 1.0) ), )
                ],
              ),
            );
              
            
            
          },
          itemCount: 3,
          // pagination: new SwiperPagination(),
          // control: new SwiperControl(),
        ),
    );


  }
}


