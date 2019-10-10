import 'package:flutter/material.dart';
import 'dart:io';
import 'package:device_info/device_info.dart';



class ConfigPage extends StatelessWidget {
  
  
  
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    

    return Scaffold(
     appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
                Container(
                width: media.width * 0.4, 
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: 'ID Tablet',
                    helperText: 'Identificador único de la tablet'
                  ),
                  onChanged: ( value ){},
                ),
              ),
            ]
          ),
          Column(            
            children: <Widget>[
              Container(
              width: media.width * 0.4,  
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
        ]        
      ) 
    );
    
  }

  Future<String> _getId(String deviceId) async {
  
  
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isIOS) {
    IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
    deviceId = iosDeviceInfo.identifierForVendor; // unique ID on iOS
    return deviceId;
  } 
  else {
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;    
    deviceId = androidDeviceInfo.androidId; // unique ID on Android
    return deviceId; // unique ID on Android
    
  }
  
}

// _idDevice() async{
//   String dispositivo = await _getId();

//   return dispositivo;

// }

}