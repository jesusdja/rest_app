import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_panel/flutter_search_panel.dart';
import 'package:flutter_search_panel/search_item.dart';
import 'package:intl/intl.dart';
import 'package:rest_app/src/models/menu_model.dart';
import 'package:rest_app/src/providers/menu_provider.dart';
import 'package:rest_app/src/utils/utils.dart' as utils;


class MenuPage extends StatefulWidget {

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  final formKey = GlobalKey<FormState>();
  final menuProvider = new MenuProvider();

  MenuModel menu = new MenuModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                 _crearFechainicio(),
                _crearFechafinal(),
                _crearHorainicio(),
                _crearHorafinal(),
                _creardescripcion(),
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
      initialValue: menu.nombre_menu,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          labelText: 'Menu'
      ),
      onSaved: (value) => menu.nombre_menu = value,
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
  Widget _creardescripcion(){
    return TextFormField(
      initialValue: menu.descripcion,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          labelText: 'Descripcion'
      ),
      onSaved: (value) => menu.descripcion = value,
      validator: (value){
        if (value.length < 5){
          return 'Añade una descripcion para el menu';
        }
        else{
          return null;
        }
      },
    );
  }


  Widget _crearFechainicio(){

    return  Center(
      child:DateTimePickerFormField(
        inputType: InputType.date,
        format: DateFormat("yyyy-MM-dd"),
        initialDate: DateTime(2019, 1, 1),
        editable: false,
        decoration: InputDecoration(
            labelText: 'Fecha inicial',
            hasFloatingPlaceholder: false
        ),
        onSaved: (value) => menu.fecha_ini = value
      ),
    );
  }


  Widget _crearFechafinal(){

         return  Center(
      child:DateTimePickerFormField(
          inputType: InputType.date,
          format: DateFormat("yyyy-MM-dd"),
          initialDate: DateTime(2019, 1, 1),
          editable: false,
          decoration: InputDecoration(
              labelText: 'Fecha final',
              hasFloatingPlaceholder: false
          ),
          onSaved: (value) => menu.fecha_fin = value
      ),
    );
  }


  Widget _crearHorainicio(){

    return  Center(
      child:TimePickerFormField(
          //inputType: InputType.date,
          format: DateFormat("HH-mm"),
          //initialDate: TimeOfDay.fromDateTime(DateTime.now()),
          editable: false,
          decoration: InputDecoration(
              labelText: 'Hora inicial',
              hasFloatingPlaceholder: false
          ),
          onSaved: (value) => menu.hora_ini = value
      ),
    );
  }


  Widget _crearHorafinal(){

    return  Center(
      child:TimePickerFormField(
      //    inputType: InputType.date,
          format: DateFormat("HH-nn"),
        //  initialDate: DateTime(2019, 1, 1),
          editable: false,
          decoration: InputDecoration(
              labelText: 'Hora final',
              hasFloatingPlaceholder: false
          ),
          onSaved: (value) => menu.hora_fin = value
      ),
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
      menu.categoria = selectedCategoria;
    });
  }

  Widget _alergenos(){
    return Container();
  }

  void _submit(){
    if ( !formKey.currentState.validate() ) return;
    formKey.currentState.save();
    menuProvider.crearMenu(menu);
  }
}