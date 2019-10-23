import 'package:flutter/material.dart';


void mostrarAlerta(BuildContext context, String titulo, String mensaje, ) {

 _eleccion(bool isOk, BuildContext context){
   if(isOk){
     print('OK');
     //TODO: Abrir mesa
   }else{
     print('Ver Carta');
     //TODO: ver carta
   }
}
  showDialog(
    context: context,
    builder: ( context ) {
      return AlertDialog(
        title: Text(titulo),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: ()=> _eleccion(true, context),
            
          ),
          FlatButton(
            child: Text('Ver carta'),
            onPressed: ()=> _eleccion(false, context),
            
          ),
        ],
      );
    }
  );

 
}

bool isNuneric(String s){

  if (s.isEmpty) return false;

  final n = num.tryParse(s);

  return ( n == null ) ? false : true;
  
}