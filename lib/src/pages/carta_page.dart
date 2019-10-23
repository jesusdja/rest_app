import 'package:flutter/material.dart';

import 'package:rest_app/src/providers/productos_provider.dart';
import 'package:rest_app/src/models/producto_model.dart';

class CartaPage extends StatelessWidget {
  
  final productosProvider = new ProductosProvider();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carta'),
      ),
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

  Widget _bebidas(){
    return Container(
      child: _crearGrid(),     
      
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

  Widget _crearGrid() {

    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
        if ( snapshot.hasData){
          
          final productos = snapshot.data;

          return GridView.builder(
            
            itemCount: productos.length,   
            itemBuilder: (context , i) => _crearItem(productos[i]),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 40,
            crossAxisSpacing: 50,

            )
          );
        }
        else{
          return Center( child: CircularProgressIndicator());
        }
        
      }
    );

  }
  Widget _crearItem(ProductoModel producto) {

    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      
            
      
      child:GridView.count(
        crossAxisCount: 4,
        primary: true,
        // padding: EdgeInsets.all(20.0),
        // mainAxisSpacing: 10.0,
        // crossAxisSpacing: 10.0,
        children: <Widget>[
          Text('${producto.nombre} - ${producto.precio}')
        ],

        )
    );
  }
}
// // Widget _gridProductos(){
  
// // //  List listaProductos = ['Producto 1 ', 'Producto 2 ', 'Producto 3 ', 'Producto 4 ', 'Producto 5 ', 'Producto 6 ', 'Producto 7 ', 'Producto 8 '];
  
// //   return GridView.count(
// //     crossAxisCount: 4,
// //     primary: true,
// //     padding: EdgeInsets.all(20.0),
// //     mainAxisSpacing: 10.0,
// //     crossAxisSpacing: 10.0,
// //     children: <Widget>[
        
// //       Container(
// //         padding: EdgeInsets.all(8),
// //         color: Colors.white,
// //         child: Text(listaProductos[0]),
// //       ),
// //       Container(
// //         padding: EdgeInsets.all(8),
// //         color: Colors.teal[100],
// //         child: Text(listaProductos[1]),
// //       ),
// //       Container(
// //         padding: EdgeInsets.all(8),
// //         color: Colors.teal[100],
// //         child: Text(listaProductos[2]),
// //       ),
// //       Container(
// //         padding: EdgeInsets.all(8),
// //         color: Colors.teal[100],
// //         child: Text(listaProductos[3]),
// //       ),

// //     ],

// //   );

// }