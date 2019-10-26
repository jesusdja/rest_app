import 'package:flutter/material.dart';
import 'package:rest_app/src/utils/botonesMenu.dart';
import 'package:rest_app/src/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.settings),
            onPressed: () => Navigator.of(context).pushNamed('config')
            )
        ],
      ),

      body: Stack(
        children: <Widget>[
          _imagenFondo(),
          _contenido(context)
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
  
  Widget _contenido(context){
  final size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20.0 ),
    decoration: BoxDecoration(
      color: Color.fromRGBO(0, 0, 0, 0.7),
      borderRadius: BorderRadius.circular(20.0)
    ),
    child: Row(
      children: <Widget>[
        _logo(context),
        _instrucciones(context),
        Container(
          height: size.height * 0.8,
          width: size.width * 0.20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /*_crearBoton(context, 'Menú Medio día', size.height * 0.1, 0.0, 'carta'),
              _crearBoton(context, 'Menú Noches', size.height * 0.03, 0.0, 'carta' ),
              _crearBoton(context, 'Menú Fin de Semana', size.height * 0.03, 0.0, 'carta' ),*/
              _crearBoton(context, 'Abrir Mesa', size.height * 0.1, 0.0, 'buttonsMenu' ),
              _crearBoton(context, 'A la Carta', size.height * 0.03, 0.0, 'carta' ),
            ]
          ),
        ),
      ],
    ),
  );
}

  Widget _logo(BuildContext context){
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          padding: EdgeInsets.symmetric( vertical: 15.0),
          child: Image(
            image: AssetImage('assets/logo-completo-blanco-120x126.png'),
          ),
        ),
      ]
    );
  }  

  Widget _titulo(String text, double fontSize, FontWeight fontWeight,double sizeH){

    return Container(
      padding: EdgeInsets.only(top: sizeH * 0.018),
      child: Text(
        '$text',
        style: TextStyle(
          color: Colors.white, 
          fontSize: fontSize,
          fontWeight: fontWeight
        )
      )
    );
    
  }
  Widget _textos(String text, double fontSize, FontWeight fontWeight,double sizeH){

    return Container(
      padding: EdgeInsets.only(top: sizeH * 0.020),
      child: Text(
      '$text',
      style: TextStyle(
          color: Colors.white, 
          fontSize: fontSize,
          fontWeight: fontWeight
        )
      )
    );
    
  }
  Widget _instrucciones(BuildContext context){
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Container(
      width: sizeW * 0.6,
      height: sizeH * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _titulo('Bienvenidos a Rong Hua Asian Cosine',sizeH * 0.05,FontWeight.bold,sizeH),
          SizedBox(height: sizeH * 0.01),
          _textos('Menús por persona', sizeH * 0.04, FontWeight.bold,sizeH),
          _textos('Medio día: 13,75€. De lunes a viernes no festivos ', sizeH * 0.03, FontWeight.normal,sizeH),
          _textos('Noches: 17,95€. De lunes a jueves no festivos', sizeH * 0.03, FontWeight.normal,sizeH),
          _textos('Fines de Semana: 19,95€ De viernes noche a domingo festivos y vísperas', sizeH * 0.03, FontWeight.normal,sizeH),
          _textos('Niños hasta 8 años: 7,95€ - Menores de 3 años gratis', sizeH * 0.03, FontWeight.normal,sizeH),
          SizedBox(height: sizeH * 0.01),
          _textos('Condiciones', sizeH * 0.04, FontWeight.bold,sizeH),
          _textos('- Todos los comensales deben elegir la misma opción.', sizeH * 0.02, FontWeight.normal,sizeH),
          _textos('- En todas las opciones de menú se pueden elegir desde el plato nº 1 al nº 74.', sizeH * 0.02, FontWeight.normal,sizeH),
          _textos('- Por cada menú se puede pedir 3 rondas de 5 platos cada una', sizeH * 0.02, FontWeight.normal,sizeH),
          _textos('- Menú válido solo en el local, no se puede sacar fuera del establecimiento', sizeH * 0.02, FontWeight.normal,sizeH),
          _textos('- Se penalizará con 2,00€ por cada plato no consunido', sizeH * 0.02, FontWeight.normal,sizeH),
          _textos('- Se debe consumir mínimo una bebida por menú', sizeH * 0.02, FontWeight.normal,sizeH),

        ],
      ),
    );

  }
  Widget _crearBoton(BuildContext context, String label, double top, double bottom, String ruta){
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.3,
      padding: EdgeInsets.only(top: top,bottom: bottom),
      child: RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: size.width * 0.001, vertical: size.height * 0.03),
            child: Text('$label',style: TextStyle(color: Colors.white, fontSize: 20.0),textAlign: TextAlign.center,),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
          ),
          elevation: 0.0,
          color: Colors.deepOrange,
          textColor: Colors.black,
          onPressed: (){
            Navigator.pushNamed(context,ruta);
            // _abrirMesa(context);
          }
      ),
    );

  }
  _abrirMesa(BuildContext context){
    utils.mostrarAlerta(context, 'Abrir Mesa' , '¿Abrimos mesa?');
  }

}