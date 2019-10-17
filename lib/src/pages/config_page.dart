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
          _campoTexto(context, 'Mesa', 'Número de mesa asociada al dispositivo'),
          
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
            decoration: InputDecoration(
              labelText: etiqueta,
              helperText: helper
            ),
            onChanged: ( value ){},
          )
        ]
      ) 
    );

  }

  

}