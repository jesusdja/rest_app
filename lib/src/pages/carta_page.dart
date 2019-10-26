import 'package:flutter/material.dart';

import 'package:rest_app/src/providers/productos_provider.dart';
import 'package:rest_app/src/models/producto_model.dart';



class CartaPage extends StatefulWidget {
  @override
  _CartaPageState createState() => _CartaPageState();
}


class _CartaPageState extends State<CartaPage> {
  
  final productosProvider = new ProductosProvider();
  int bottomSelectedIndex = 0;
  bool selectButtonPreferent = true;
  Map<ProductoModel,int> mapPRodcutsCantidadTotal;
  bool mesaActiva = false;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    mapPRodcutsCantidadTotal = Map();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !mesaActiva ? AppBar(
        title: Text('Carta'),
      ) : null,
      body: Row(
        children: <Widget>[
          _pageViewCarta(context),
          _pageViewLateral(context),
        ],
      )
    );
  }

  Widget _logo(BuildContext context){
    return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            mesaActiva ? SizedBox(height: MediaQuery.of(context).size.height * 0.2,) : SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
            Image(image: AssetImage('assets/logo-completo-blanco-120x126.png',),color: Colors.black,width: MediaQuery.of(context).size.width * 0.06,),
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Text('ASIAN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height * 0.05) )
            )
          ],
        )
    );
  }

  Widget buttonMenuPage(BuildContext context,String texto,int index){
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.15,
      height: size.height * 0.1,
      margin: EdgeInsets.all(15),
      child: FlatButton(
        color: Colors.deepOrange,
        shape:new RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          padding: EdgeInsets.symmetric( horizontal: size.width * 0.001, vertical: size.height * 0.03),
          child: Text(texto,style: TextStyle(color: bottomSelectedIndex == index ? Colors.white : Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),textAlign: TextAlign.center,),
        ),
        onPressed: () {
          bottomTapped(index);
        },
      ),
    );
  }

  //***************************************************************
  //**********************CARTA************************************
  //***************************************************************

  Widget _pageViewCarta(BuildContext context){
    return Container(
      color: Colors.grey[200],
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: <Widget>[
          _logo(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              buttonMenuPage(context,'Bebidas',0),
              buttonMenuPage(context,'Platos',1),
              buttonMenuPage(context,'Especiales',2),
              buttonMenuPage(context,'Postres',3),
            ],
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                pageChanged(index);
              },
              children: <Widget>[
                _bebidas(),
                _platos(),
                _platosEspeciales(),
                _postres()
              ],
            ),
          ),
        ],
      ),
    );
  }

  void bottomTapped(int index) {
    bottomSelectedIndex = index;
    pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    setState(() {});
  }

  pageChanged(int index){
    bottomSelectedIndex = index;
    setState(() {});
  }

  Widget _bebidas(){
    return Container(
      child: _crearGrid('B'),
    );
  }

  Widget _platos(){
    return Center(
      child: _crearGrid('PL'),
    );
  }

  Widget _platosEspeciales(){
    return Center(
      child: _crearGrid('E'),
    );
  }

  Widget _postres(){
    return Center(
      child: _crearGrid('P'),
    );
  }

  Widget _crearGrid(String cate) {
    return FutureBuilder(
        future: productosProvider.cargarProductos(),
        builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
          if(snapshot.hasData){
            final productos = snapshot.data;
            return GridView.builder(
                itemCount: productos.length,
                itemBuilder: (context , i) {
                  //FILTRO PARA PASAR POR CATEGORIAS
                  //B : BEBIDA - PL : PLATO - E : ESPECIALES - P : POSTRE
                  if(productos[i].categoria != cate){
                    return _crearItem(productos[i],context,cate);
                  }else{
                    return null;
                  }
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

  Widget _crearItem(ProductoModel producto,BuildContext context,String categoria) {
    return Card(
        color: Colors.white,
        child: InkWell(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
                Image.asset('assets/no-image.png',height: MediaQuery.of(context).size.height * 0.15,),
                textoStyle(producto.nombre,MediaQuery.of(context).size.height * 0.04),
                textoStyle('${producto.precio}',MediaQuery.of(context).size.height * 0.04),
              ],
            ),
          ),
          onTap: (){
            if(categoria!= 'P'){
              _agregarListProductsIguales(producto);
            }else{
              _agregarListProductsIndividuales(producto);
            }

            setState(() {});
          },
        )
    );
  }


  //***************************************************************
  //**********************LATERAL**********************************
  //***************************************************************
  Widget _pageViewLateral(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      child: !mesaActiva ? _mesaInactiva() : _mesaActiva(),
    );
  }


  Widget _mesaInactiva(){
    return Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.18,
          child: FlatButton(
            color: Colors.black,
            shape:new RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            child: Text('Abrir Mesa',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20,),
            ),
            onPressed: () {
              mesaActiva = true;
              setState(() {});
            },
          ),
        )
    );
  }

  Widget _mesaActiva(){
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          mesaActiva ? SizedBox(height: MediaQuery.of(context).size.height * 0.05,) : SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
          Text('Platos Seleccionados',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center, ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView.builder(
              itemCount: mapPRodcutsCantidadTotal.length,
              itemBuilder: (context,index){
                ProductoModel product = mapPRodcutsCantidadTotal.keys.elementAt(index);
                return Card(
                    color: Colors.grey[200],
                    child: InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: ListTile(
                          title: Text(product.nombre),
                          trailing: textoStyleBold('${mapPRodcutsCantidadTotal[product]}',20),
                        ),
                      ),
                      onTap: (){
                        _seleccionarProduct(context,product,mapPRodcutsCantidadTotal[product]);
                      },
                    )
                );
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.18,
            child: Column(
              children: <Widget>[
                textoStyleBold('Monto Total :',20),
                textoStyleBold('${numberFormat(montoTotalMesa)} €',40),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future _seleccionarProduct(BuildContext context,ProductoModel producto,int cant) async{
    await showDialog(
        context: context,
        // ignore: deprecated_member_use
        child: SimpleDialog(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    textoStyle('¿ Que desea hacer ?',MediaQuery.of(context).size.height * 0.05),
                    textoStyle('${producto.nombre}',MediaQuery.of(context).size.height * 0.05),
                    textoStyle('Cantidad : $cant',MediaQuery.of(context).size.height * 0.05),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  children: <Widget>[
                    _botonEliminar(producto),
                    _botonEnviar(producto),
                  ],
                ),
              ),
            ]
        )
    );
  }

  Widget _botonEliminar(ProductoModel producto){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 20,left: 20),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.red,
          label: Text('Eliminar'),
          icon: Icon(Icons.delete_outline),
          onPressed: (){
            mapPRodcutsCantidadTotal[producto] = mapPRodcutsCantidadTotal[producto] - 1;
            montoTotalMesa -= producto.precio;
            if(mapPRodcutsCantidadTotal[producto] == 0){
              mapPRodcutsCantidadTotal.remove(producto);
            }
            Navigator.of(context).pop();
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget _botonEnviar(ProductoModel producto){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 20,left: 20),
        child: FloatingActionButton.extended(
          onPressed: (){},
          backgroundColor: Colors.green,
          label: Text('Enviar'),
          icon: Icon(Icons.send),
        ),
      ),
    );
  }

  String numberFormat(double x) {
    List<String> parts = x.toString().split('.');
    RegExp re = RegExp(r'\B(?=(\d{3})+(?!\d))');

    parts[0] = parts[0].replaceAll(re, '.');
    if (parts.length == 1) {
      parts.add('00');
    } else {
      parts[1] = parts[1].padRight(2, '0').substring(0, 2);
    }
    return parts.join(',');
  }


  _agregarListProductsIguales(ProductoModel producto){
    bool entre = false;
    mapPRodcutsCantidadTotal.forEach((key,value){
      if(key.id == producto.id){
        mapPRodcutsCantidadTotal[key]++;
        entre = true;
      }
    });
    if(!entre){
      mapPRodcutsCantidadTotal[producto] = 1;
    }
    montoTotalMesa +=  producto.precio;
    setState(() {});
  }

  double montoTotalMesa = 0;
  _agregarListProductsIndividuales(ProductoModel producto){
    mapPRodcutsCantidadTotal[producto] = 1;
    montoTotalMesa +=  producto.precio;
    setState(() {});
  }

  Widget textoStyle(String texto,double hei){
    return Text(texto,style: TextStyle(fontSize: hei),);
  }
  Widget textoStyleBold(String texto,double hei){
    return Text(texto,style: TextStyle(fontSize: hei,fontWeight: FontWeight.bold),);
  }

}