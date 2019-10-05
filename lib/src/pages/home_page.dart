import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),

      body: Stack(
        children: <Widget>[
          _imagenFondo(),
        ],
      ),
      
    );
  }
  Widget _imagenFondo() {

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/fondo-home.jpg'),
          fit: BoxFit.cover
        )
      ),
    );
  }
}