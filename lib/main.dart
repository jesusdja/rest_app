import 'package:flutter/material.dart';

import 'package:rest_app/src/pages/home_page.dart';


void main() {
  
  runApp(RestApp());

  
}

class RestApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home'     : ( BuildContext context ) => HomePage(),
        },
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
      );
  }
}