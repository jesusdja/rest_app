import 'package:flutter/material.dart';
import 'package:device_id/device_id.dart';

class ConfigPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'ID Tablet',
                helperText: 'Identificador único de la tablet'
              ),
              onChanged: ( value ){},
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'ID Mesa',
                helperText: 'Identificador único de la mesa'
              ),
              onChanged: ( value ){},
            ),
          ),
        ]
        
        
      ) 
      
    );
  }

  
}