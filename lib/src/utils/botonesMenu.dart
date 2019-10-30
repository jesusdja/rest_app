import 'package:flutter/material.dart';
import 'package:rest_app/src/utils/utils.dart' as utils;

class buttonsMenu extends StatefulWidget {
  @override
  _buttonsMenuState createState() => _buttonsMenuState();
}


class _buttonsMenuState extends State<buttonsMenu> {

  List<String> _listImage = new List<String>();

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
                _tipoMenu(context, 'Menú Medio día','MD','Descripción breve del menu xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
                _tipoMenu(context, 'Menú Noches','N','Descripción breve del menu'),
                _tipoMenu(context, 'Menú Fin de Semana','FS','Descripción breve del menu'),
                _tipoMenu(context, 'A la Carta','C','Descripción breve del menu'),

              ],
            ),
          ),
        ],
      ),
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