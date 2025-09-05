import 'package:flutter/material.dart';
import 'package:marketsmart/widgets/login/login3_widget.dart';
import 'package:marketsmart/widgets/login/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginWidget(
        child: Login3Widget(
          textTitle: 'Ingresar',
          textFinalButton: 'Registrarse si no tienes cuenta',
          path: 'register',
          textButton: 'Acceder',
          pathButton: 'home', //consumir servicio
          loginRegister: 1, //1 para login, 2 para register
        ),
      ),
    );
  }
}
