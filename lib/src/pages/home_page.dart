import 'package:flutter/material.dart';
import 'package:rest_app/src/util/util.dart';




class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.settings),
            onPressed: () => Navigator.pushNamed(context, 'config'),
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
  
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20.0 ),
    decoration: BoxDecoration(
      color: Color.fromRGBO(0, 0, 0, 0.7),
      borderRadius: BorderRadius.circular(20.0)
    ),
    child: Row(
      children: <Widget>[
        _logo(),
        _instrucciones(), 
        Column(
          children: <Widget>[
            _crearBoton(context, 'Menú Medio día', 200.0, 0.0, 'catalogo'),               
            _crearBoton(context, 'Menú Noches', 25.0, 0.0, 'catalogo' ),               
            _crearBoton(context, 'Menú Fin de Semana', 25.0, 0.0, 'catalogo' ),  
            _crearBoton(context, 'A la Carta', 25.0, 0.0, 'catalogo' ),              
          ]
        )
      ],
    ),
  );
}

  Widget _logo(){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Image(
            image: AssetImage('assets/logo-completo-blanco-120x126.png'),
          ),
        ),
      ]
    );
    
  }  

  Widget _titulo(String text, double fontSize, FontWeight fontWeight){

    return Container(
      padding: EdgeInsets.only(top: 40.0,right: 10.0),
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
  Widget _textos(String text, double fontSize, FontWeight fontWeight){


    return Container(
      padding: EdgeInsets.only(top: 15.0),
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
  Widget _instrucciones(){    

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _titulo('Bienvenidos a Rong Hua Asian Cosine',40.0,FontWeight.bold),
        SizedBox(height: 20.0),
        _textos('Menús por persona', 30.0, FontWeight.bold),
        _textos('Medio día: 13,75€. De lunes a viernes no festivos ', 20.0, FontWeight.normal),
        _textos('Noches: 17,95€. De lunes a jueves no festivos', 20.0, FontWeight.normal),
        _textos('Fines de Semana: 19,95€ De viernes noche a domingo festivos y vísperas', 20.0, FontWeight.normal),
        _textos('Niños hasta 8 años: 7,95€ - Menores de 3 años gratis', 20.0, FontWeight.normal),
        SizedBox(height: 20.0),
        _textos('Condiciones', 30.0, FontWeight.bold),
        _textos('- Todos los comensales deben elegir la misma opción.', 18.0, FontWeight.normal),
        _textos('- En todas las opciones de menú se pueden elegir desde el plato nº 1 al nº 74.', 18.0, FontWeight.normal),
        _textos('- Por cada menú se puede pedir 3 rondas de 5 platos cada una', 18.0, FontWeight.normal),
        _textos('- Menú válido solo en el local, no se puede sacar fuera del establecimiento', 18.0, FontWeight.normal),
        _textos('- Se penalizará con 2,00€ por cada plato no consunido', 18.0, FontWeight.normal),
        _textos('- Se debe consumir mínimo una bebida por menú', 18.0, FontWeight.normal),

      ],
    );

  }
  Widget _crearBoton(BuildContext context, String label, double top, double bottom, String ruta){
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          width: size.width * 0.3,
          padding: EdgeInsets.only(top: top,bottom: bottom),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric( horizontal: 70.0, vertical: 20.0),
              child: Text('$label',style: TextStyle(color: Colors.white, fontSize: 20.0)),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
            elevation: 0.0,
            color: Colors.deepOrange,
            textColor: Colors.black,
            onPressed: (){ 
              Navigator.pushNamed(context, '$ruta');
              _abrirMesa(context);
            }   
  
          ),
        ),
      ]
    );

  }
  _abrirMesa(BuildContext context){
    mostrarAlerta(context, 'Abrir Mesa' , '¿Abrimos mesa?');

  }

}