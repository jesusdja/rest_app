


import 'dart:async';

class LoginBloc {
  

  final _emailController    = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //Recuperar los datos del Stream
  Stream<String> get emailStream    => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  //insertar valores al Stream
  Function (String) get changeEmail    => _emailController.sink.add;
  Function (String) get changePassword => _passwordController.sink.add;

  dispose(){
    _emailController?.close(); //? evita un error si fuera nulo
    _passwordController?.close();
  }

}