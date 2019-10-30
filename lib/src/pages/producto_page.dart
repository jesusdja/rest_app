import 'package:flutter/material.dart';
import 'package:flutter_search_panel/flutter_search_panel.dart';
import 'package:flutter_search_panel/search_item.dart';
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
  void initState() {
    super.initState();
  }

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
                _descripcion(),
                _numeroPlato(),
                //_categoria(),
//                _alergenos(),
                _crearDisponible(),
                _crearBoton(),
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

  Widget _descripcion(){
    return TextFormField(
      initialValue: producto.descripcion,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          labelText: 'Descripción'
      ),
      onSaved: (value) => producto.descripcion = value,
      validator: (value){
        if (value.length < 10){
          return 'Descripción mayor a diez(10) caracteres';
        }
        else{
          return null;
        }
      },
    );
  }
  Widget _numeroPlato(){
    return Container();
  }

  List<SearchItem<int>> data = [
    SearchItem(0, 'This'),
    SearchItem(1, 'is'),
    SearchItem(2, 'a'),
    SearchItem(3, 'test'),
    SearchItem(4, '.'),
  ];

  Widget _categoria(){
    return FlutterSearchPanel(
      padding: EdgeInsets.all(10.0),
      selected: 'a',
      title: 'Demo Search Page',
      data: data,
      icon: new Icon(Icons.label, color: Colors.black),
      color: Colors.white,
      textStyle: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0, decorationStyle: TextDecorationStyle.dotted),
      onChanged: (value) {
        print(value);
      },
    );
  }

  List _categorias = ['B','PL','E','P'];
  List<DropdownMenuItem<String>> _dropDownMenuCurrencyItems;

  List<DropdownMenuItem<String>> getDropDownMenuCategoriaItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String currency in _categorias) {
      items.add(new DropdownMenuItem(value: currency, child: new Text(currency)));
    }
    return items;
  }
  void changedDropDownItemCategoria(String selectedCategoria) {
    setState(() {
      producto.categoria = selectedCategoria;
    });
  }

  Widget _alergenos(){
    return Container();
  }

  void _submit(){
    if ( !formKey.currentState.validate() ) return;
    formKey.currentState.save();
    productoProvider.crearProducto(producto);
  }
}