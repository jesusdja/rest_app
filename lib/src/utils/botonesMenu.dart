import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:rest_app/src/models/menu_model.dart';
import 'package:rest_app/src/providers/menu_provider.dart';
import 'package:rest_app/src/utils/utils.dart' as utils;

class buttonsMenu extends StatefulWidget {
  @override
  _buttonsMenuState createState() => _buttonsMenuState();
}


class _buttonsMenuState extends State<buttonsMenu> {

  List<String> _listImage = new List<String>();
  final menuProvider = new MenuProvider();
  @override
  void initState() {

    _llenarlistImage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abrir Mesa'),
      ),
      body: Stack(
        children: <Widget>[
          _imagenFondo(),
          _contenido(context)
        ],
      ),
    );
  }

  _llenarlistImage(){
    // _listImage.add("comidaEjemplo.jpg");
    // _listImage.add("comidaEjemplo.jpg");
    // _listImage.add("comidaEjemplo.jpg");
  }


  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondo-home.jpg'),
              fit: BoxFit.cover
          )
      ),
    );
  }

  Widget _contenido(context){
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20.0 ),
      decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.7),
          borderRadius: BorderRadius.circular(20.0)
      ),
      child: Row(
        children: <Widget>[
          _logo(context),
          Container(
            // width: MediaQuery.of(context).size.width * 0.78,
            // height: MediaQuery.of(context).size.height * 0.6,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
               _crearGrid(),

              /*
                  _tipoMenu(context, 'Menú Medio día','MD','Descripción breve del menu xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'), if(DateTime.now().hour>16 && DateTime.now().hour<23 && ((formatDate(DateTime.now(), [dd]))=="Mon" ||(formatDate(DateTime.now(), [dd]))=="Tue" ||(formatDate(DateTime.now(), [dd]))=="Wed" ||(formatDate(DateTime.now(), [dd]))=="Thu" ))
                  _tipoMenu(context, 'Menú Noches','N','Descripción breve del menu'),
                  _tipoMenu(context, 'Menú Fin de Semana','FS','Descripción breve del menu'),
                _tipoMenu(context, 'A la Carta','C','Descripción breve del menu'),



               */

              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _crearGrid() {
    return FutureBuilder(
        future: menuProvider.cargarMenus(),
        builder: (BuildContext context, AsyncSnapshot<List<MenuModel>> snapshot){
          if(snapshot.hasData){
            final menu = snapshot.data;
            return GridView.builder(
                itemCount: menu.length,
                itemBuilder: (context , i) {
                  if(menu[i].id=="V" || menu[i].id=="F")
                    return _tipoMenu(context,menu[i].nombre_menu,menu[i].id,menu[i].descripcion);


                  if(DateTime.now().hour>menu[i].hora_ini.hour && DateTime.now().hour<menu[i].hora_fin.hour)
                    if((formatDate(DateTime.now(), [dd]))!="Sat" ||(formatDate(DateTime.now(), [dd]))!="Sun" )
                     return _tipoMenu(context,menu[i].nombre_menu,menu[i].id,menu[i].descripcion);
                    else
                    if((formatDate(DateTime.now(), [dd]))!="Frie" ||(formatDate(DateTime.now(), [dd]))!="Sat" ||(formatDate(DateTime.now(), [dd]))!="Sun" )
                      return _tipoMenu(context,menu[i].nombre_menu,menu[i].id,menu[i].descripcion);
                  if((formatDate(DateTime.now(), [dd]))=="Frie" ||(formatDate(DateTime.now(), [dd]))=="Sat" ||(formatDate(DateTime.now(), [dd]))=="Sun" )
                      return _tipoMenu(context,menu[i].nombre_menu,menu[i].id,menu[i].descripcion);

                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.6,
                )
            );
          }else{
            return Center( child: CircularProgressIndicator());
          }
        }
    );

  }
  Widget _logo(BuildContext context){
    return Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            padding: EdgeInsets.symmetric( vertical: 15.0),
            child: Image(
              image: AssetImage('assets/logo-completo-blanco-120x126.png'),
            ),
          ),
        ]
    );
  }

  Widget _textos(String text){
    return Container(
        // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.020),
        child: Text(
            '$text',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal
            )
        )
    );
  }

  Widget _tipoMenu(BuildContext context,String label,String tipo,String descripcion){
    
    final size = MediaQuery.of(context).size;
    
    return Container(
      width: size.width * 0.8,
      padding: EdgeInsets.only(right: 20, left: 10, bottom: size.height * 0.07),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: size.width * 0.20,
                  height: size.height * 0.10,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                    child: FlatButton(
                      color: Colors.deepOrange,
                      shape:new RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      child: Container(
                        padding: EdgeInsets.symmetric( horizontal: size.width * 0.001, vertical: size.height * 0.03),
                        child: Text('$label',style: TextStyle(color: Colors.white, fontSize: 20.0),textAlign: TextAlign.center,),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context,'carta');
                      },
                    ),
                  ),
                ),
              ]
            ),
           ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: size.width * .9,
                  height: size.height * 0.10,
                child: _textos(descripcion)
                 )
              ],
            ) 
          )
        ]
      )
    );
  }

}