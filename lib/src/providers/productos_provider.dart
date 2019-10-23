
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_app/src/models/producto_model.dart';

class ProductosProvider {

final _url = 'https://apprest-857be.firebaseio.com';

  Future<bool> crearProducto( ProductoModel producto) async {

  final url = '$_url/productos.json';
  final resp = await http.post(url, body: productoModelToJson(producto));
  final decodeData = json.decode(resp.body);

  print(decodeData);
  return true;
  }

  Future<List<ProductoModel>> cargarProductos() async {

    final url = '$_url/productos.json';
    final resp = await http.get(url);
    
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> productos = new List();
    
    if ( decodedData ==null ) return [];

    decodedData.forEach( ( id , prod) {

      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;
      
      productos.add( prodTemp );
    }
    );
    print(productos);
//TODO: No carga correctamente revisar ID String/int o porque classe 211
    return productos;

  }

}