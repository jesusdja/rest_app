import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as prefix0;
import 'package:rest_app/src/blocs/login_bloc.dart';
export 'package:rest_app/src/blocs/login_bloc.dart';


class Provider extends InheritedWidget{
  
  final loginBloc = LoginBloc();

  //Constructor
  Provider({Key key , Widget child})
    : super(key: key, child: child);


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true; 
    
  static LoginBloc of  (BuildContext context){

    return( context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;

  }
  
}