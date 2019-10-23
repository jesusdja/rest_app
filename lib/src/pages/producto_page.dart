import 'package:flutter/material.dart';
import 'package:rest_app/src/models/producto_model.dart';
import 'package:rest_app/src/providers/productos_provider.dart';
import 'package:rest_app/src/utils/utils.dart' as utils; 

class ProductoPage extends StatefulWidget {
  
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  
  final formKey = GlobalKey<FormState>();
  final productoProvider = new ProductosProvider();

  ProductoModel producto = new ProductoModel();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: (){},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                _crearPrecio(),
                _crearBoton(),
                _crearDisponible(),

              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget _crearNombre(){
    return TextFormField(
      initialValue: producto.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      onSaved: (value) => producto.nombre = value,
      validator: (value){
        if (value.length < 3){
          return 'Añade nombre de nombre';
        }
        else{
          return null;
        }
      },
    );
    
  }

  Widget _crearPrecio(){

    return TextFormField(
      initialValue: producto.precio.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
      onSaved: (value) => producto.precio = double.parse(value),
      validator: (value){
        if ( utils.isNuneric(value) ){
          return null;
        }
        else{
          return 'El campo debe ser numérico';
        }
      }
    );
  }
  Widget _crearDisponible(){
    return SwitchListTile(
      value: producto.disponible,
      title: Text('Disponible'),
      activeColor: Colors.black,
      onChanged: (value) => setState((){
        producto.disponible = value;
      }),
    );
  }

  Widget _crearBoton(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
    color: Colors.black,
    textColor: Colors.white,
    label: Text('Guardar'),
    icon: Icon(Icons.save),
    onPressed: _submit,
    );
  }

  void _submit(){
    
    if ( !formKey.currentState.validate() ) return;
    
    formKey.currentState.save();

    print('Todo OK!');
    
    print(producto.nombre);
    print(producto.precio);
    print(producto.disponible);

    productoProvider.crearProducto(producto);

    
  }
}