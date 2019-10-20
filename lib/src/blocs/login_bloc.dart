import 'dart:async';

import 'package:rest_app/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{
  

  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar los datos del Stream
  Stream<String> get emailStream    => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  //combinar Streams usando rxDart (combine)
  Stream<bool>get formValidStream => Observable.combineLatest2(emailStream, passwordStream, (e,p) => true);

  //insertar valores al Stream
  Function (String) get changeEmail    => _emailController.sink.add;
  Function (String) get changePassword => _passwordController.sink.add;

  //Obtener el último valor de los Streams
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose(){
    _emailController?.close(); //? evita un error si fuera nulo
    _passwordController?.close();
  }

}