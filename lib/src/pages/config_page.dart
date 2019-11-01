import 'package:flutter/material.dart';

class ConfigPage extends StatelessWidget {
  
  TextEditingController controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
     appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Row(
          children: <Widget>[
          _campoTexto(context, 'Mesa', 'Número de mesa de este dispositivo'),
          
          ]
        )
      );
  }


  Widget _campoTexto(BuildContext context, String etiqueta, String helper){
    final size = MediaQuery.of(context).size;
    
    return Container( 
      padding: EdgeInsets.all(20.0),
      width: size.width * 0.3,
      child: Column(      
        children: <Widget>[
          TextField(
            enabled: true,
            style: TextStyle(fontSize: 25.0),
            decoration: InputDecoration(
              helperStyle: TextStyle(fontSize: 18.0),
              hintStyle: TextStyle(fontSize: 25.0),
              hintText: (etiqueta),
              helperText: helper,              
            ),
            onChanged: ( value ){},
          ),

          RaisedButton(
            child: Text('Productos'),  
            color: Colors.black,
            textColor: Colors.white,
            onPressed: () => Navigator.of(context).pushNamed('producto'),
            ),
          RaisedButton(
            child: Text('Menu'),
            color: Colors.black,
            textColor: Colors.white,
            onPressed: () => Navigator.of(context).pushNamed('menu'),
          ),
        ]
      ) 
    );

  }

  

}