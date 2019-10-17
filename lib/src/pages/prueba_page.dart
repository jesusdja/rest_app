import 'package:flutter/material.dart'; 

import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:rest_app/src/util/util.dart';


class PruebaPage extends StatefulWidget {
  
  @override
  _PruebaPageState createState() => _PruebaPageState();
  
}

class _PruebaPageState extends State<PruebaPage> {
 String _deviceIdentity = "";

final DeviceInfoPlugin _deviceInfoPlugin = new DeviceInfoPlugin();

String id = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(300.0),
            child: FlatButton(
              textColor: Colors.white,
              child: Text('PRUEBA'),
              onPressed: () async{
                id = await _getDeviceIdentity();
                mostrarAlerta(context, 'Id Dispositivo', id);
              },
            ),
          ),
          
        ],
         
      )
    );
  }


Future<String> _getDeviceIdentity() async {
  if (_deviceIdentity == '') {
    
      if (Platform.isAndroid) {
        AndroidDeviceInfo info = await _deviceInfoPlugin.androidInfo;
        _deviceIdentity = "${info.device}-${info.id}";
      } else if (Platform.isIOS) {
        IosDeviceInfo info = await _deviceInfoPlugin.iosInfo;
        _deviceIdentity = "${info.model}-${info.identifierForVendor}";
      }
  } 
  return _deviceIdentity;
}

}


