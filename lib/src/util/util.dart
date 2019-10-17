import 'package:flutter/material.dart';
import 'package:rest_app/src/blocs/provider.dart';

void mostrarAlerta(BuildContext context, String titulo, String mensaje, ) {

 _eleccion(bool isOk, BuildContext context){
   if(isOk){
     print('OK');
     //TODO: Abrir mesa
   }else{
     print('Ver Carta');
     //TODO: ver carta
   }
}

  showDialog(
    context: context,
    builder: ( context ) {
      return AlertDialog(
        title: Text(titulo),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: ()=> _eleccion(true, context),
            
          ),
          FlatButton(
            child: Text('Ver carta'),
            onPressed: ()=> _eleccion(false, context),
            
          ),
        ],
      );
    }
  );

 
}

void mostrarLogin(BuildContext context, String titulo) {
  
  

 _accion(bool isOk, BuildContext context){
   if(isOk){
     print('Entrar');
     //TODO: Login
   }else{
     print('Cancelar');
     //TODO: Cerrar/Volver
   }
}

  Widget _crearEmail(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.emailStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return Container(
          padding: EdgeInsets.symmetric( horizontal: 20.0 ),

          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email, color: Colors.black,),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo electrónico',
              counterText: snapshot.data
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    ); 
  }
  
  Widget _crearPassword(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){

        return Container(
          padding: EdgeInsets.symmetric( horizontal: 20.0 ),

          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.black,),
              labelText: 'Contraseña',
              counterText: snapshot.data
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );

    
  } 
  Widget _crearBoton( String etiqueta){

    return RaisedButton(
      color: Colors.black,
      textColor: Colors.white,      
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
        child: Text(etiqueta),
        
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      onPressed: () => _accion(true, context),
    );
  }
  
Widget _loginForm(BuildContext context, String titulo){
    
//TODO: Ponerlo en un popup menu

    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    
    return Container( 

      padding: EdgeInsets.all(5.0),
      width: size.width * 0.4,
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),

      child: Column(      
        children: <Widget>[
          _crearEmail(bloc),
          SizedBox(height: 10.0,),
          _crearPassword(bloc),
          SizedBox(height: 10.0,),
          _crearBoton('Entrar'),  
          SizedBox(height: 10.0,),
          Text('¿Olvidé la contarseña?')        
         
        ]
      )
       
    );

  }
  showDialog(
    context: context,
    builder: ( context ) {
      return AlertDialog(
        titlePadding: EdgeInsetsDirectional.only(bottom: 10.0),
        contentPadding: EdgeInsetsDirectional.only(top: 10.0),
        title: Text(titulo),
        backgroundColor: Colors.white,

        actions: <Widget>[          
          _loginForm(context, 'Login'),             
        ],
      
      );
    }
  );



  

}