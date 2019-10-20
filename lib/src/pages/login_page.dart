import 'package:flutter/material.dart';

import 'package:rest_app/src/blocs/provider.dart';

class LoginPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Stack(
        children: <Widget>[
          
          _crearFondo(context),
          _loginForm(context)

        ],
      ) ,
    );
  }

  Widget _loginForm(BuildContext context) {

    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),

          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric( vertical: 50.0 ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                Text('Login', style: TextStyle(fontSize: 20.0)),
                SizedBox( height: 60.0 ),
                _crearEmail( bloc ),
                SizedBox( height: 30.0 ),
                _crearPassword( bloc ),
                SizedBox( height: 30.0 ),
                _crearBoton( bloc )
              ],
            ),
          ),

          Text('¿Olvido la contraseña?'),
          SizedBox( height: 100.0 )
        ],
      ),
    );
  }

    Widget _crearFondo(context){

      final size = MediaQuery.of(context).size;

      return Container(
        width: double.infinity,
        height: size.height * 0.4,
        decoration: BoxDecoration(
          color: Colors.black
          
        ), 
      );
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
                counterText: snapshot.data,
                errorText: snapshot.error
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
                counterText: snapshot.data,
                errorText: snapshot.error
              ),
              onChanged: bloc.changePassword,
            ),
          );
        },
      );


    } 
    Widget _crearBoton( LoginBloc bloc ){
    
      return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          
          return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
              child: Text('Login'),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
            ),
            elevation: 0.0,
            color: Colors.black,
            textColor: Colors.white,
            onPressed: snapshot.hasData ? ()=> _login(context, bloc) : null
            // onPressed: snapshot.hasData ? (){} : null,
          );
        },
      );
    }
    _login( BuildContext context, LoginBloc bloc) {

    print('================');
    print('Email: ${ bloc.email }');
    print('Password: ${ bloc.password }');
    print('================');

    Navigator.pushReplacementNamed(context, 'config');

    }
  
}