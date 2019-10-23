import 'package:flutter/material.dart';

import 'package:rest_app/src/blocs/provider.dart';
import 'package:rest_app/src/pages/home_page.dart';
import 'package:rest_app/src/pages/config_page.dart';
import 'package:rest_app/src/pages/login_page.dart';
import 'package:rest_app/src/pages/producto_page.dart';
import 'package:rest_app/src/pages/prueba_page.dart';
import 'package:rest_app/src/pages/carta_page.dart';



void main() {
  
  runApp(RestApp());
  
}

class RestApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home'       : ( BuildContext context ) => HomePage(),
          'config'     : ( BuildContext context ) => ConfigPage(),
          'carta'   : ( BuildContext context ) => CartaPage(),
          'prueba'     : ( BuildContext context ) => PruebaPage(),
          'login'      : ( BuildContext context ) => LoginPage(),
          'producto'   : ( BuildContext context ) => ProductoPage(),
          

        },
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
      )
    );
    
    
    
    
  }
}