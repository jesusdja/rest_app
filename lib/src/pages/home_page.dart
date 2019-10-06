import 'package:flutter/material.dart';
// import 'dart:math';

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
          _info()
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
  
Widget _info(){

  return Container(
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 40.0),
                width: 180.0,
                // margin: EdgeInsets.symmetric(horizontal: ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                child: 
                  Image(
                    image: AssetImage('assets/logo-blanco-100x100.png'),
                  ),
                )
            ],
          ),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 40.0),
                width: 300.0,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                child: Text('Menú 1')
              )
            ],
          ),
        ),





        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(25.0, 200.0, 25.0, 15.0),
                child: _crearBoton('Menú 1')
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 15.0),
                child: _crearBoton('Menú 2')
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 15.0),
                child: _crearBoton('Menú 3')
              )
             ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearBoton(String label){

    return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 25.0),
          child: Text('$label',style: TextStyle(color: Colors.white, fontSize: 30.0)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        elevation: 0.0,
        color: Colors.black87,
        textColor: Colors.white,
        onPressed: (){}
      );
  }

}