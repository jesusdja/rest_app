import 'package:flutter/material.dart';


class CatalogoPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: PageView(
        children: <Widget>[
          _bebidas(),
          _platos(),
          _platosEspeciales(),
          _postres()
        ],
      ),
    );
  }
  
  }
  Widget _bebidas(){
    return Container(
      child: _gridProductos(),
           
      
      
    );
  }

  Widget _platos(){
    return Center(
      child: Text('Página Platos'),
    );
  }

  Widget _platosEspeciales(){
    return Center(
      child: Text('Página Platos Especiales'),
    );
  }

  Widget _postres(){
    return Center(
      child: Text('Página Postres'),
    );
  }


Widget _gridProductos(){
  
 List listaProductos = ['Producto 1 ', 'Producto 2 ', 'Producto 3 ', 'Producto 4 ', 'Producto 5 ', 'Producto 6 ', 'Producto 7 ', 'Producto 8 '];
  
  return GridView.count(
    crossAxisCount: 4,
    primary: true,
    padding: EdgeInsets.all(20.0),
    mainAxisSpacing: 10.0,
    crossAxisSpacing: 10.0,
    children: <Widget>[
        
      Container(
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Text(listaProductos[0]),
      ),
      Container(
        padding: EdgeInsets.all(8),
        color: Colors.teal[100],
        child: Text(listaProductos[1]),
      ),
      Container(
        padding: EdgeInsets.all(8),
        color: Colors.teal[100],
        child: Text(listaProductos[2]),
      ),
      Container(
        padding: EdgeInsets.all(8),
        color: Colors.teal[100],
        child: Text(listaProductos[3]),
      ),

    ],

  );
    
  
}