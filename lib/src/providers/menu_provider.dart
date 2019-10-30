
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_app/src/models/menu_model.dart';
import 'package:rest_app/src/models/producto_model.dart';

class MenuProvider {

final _url = 'https://apprest-857be.firebaseio.com';

  Future<bool> crearMenu( MenuModel menu) async {

  final url = '$_url/menus.json';
  final resp = await http.post(url, body: MenuModelToJson(menu));
  final decodeData = json.decode(resp.body);

  print(decodeData);
  return true;
  }

  Future<List<MenuModel>> cargarMenus() async {

    final url = '$_url/menus.json';
    final resp = await http.get(url);
    
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<MenuModel> listmenu = new List();
    
    if ( decodedData ==null ) return [];

    decodedData.forEach((id,prod){
        final prodTemp = MenuModel.fromJson(prod);
        prodTemp.id = id;
        listmenu.add( prodTemp );
      }
    );
    print(listmenu);
    return listmenu;
  }

}